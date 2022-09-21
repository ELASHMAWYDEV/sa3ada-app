const functions = require("firebase-functions");
const {
  transactionsCollection,
  itemsCollection,
  invoicesCollection,
  accountsCollection,
  countersCollection,
  depositsCollection,
} = require("./firestore");
const { calculateTransaction } = require("./utils");

const onTransactionCreated = functions.firestore
  .document("transactions/{transactionId}")
  .onCreate(async (snapshot, context) => {
    try {
      functions.logger.log("Created transaction with id:", context.params.transactionId, {
        data: snapshot.data(),
      });

      const newCounter = ((await countersCollection.doc("transactions").get()).data()?.counter ?? 0) + 1;
      await countersCollection.doc("transactions").set({ counter: newCounter });

      const transactionData = snapshot.data();

      const transactionRef = transactionsCollection.doc(context.params.transactionId);
      await transactionRef.update({
        id: context.params.transactionId,
        transactionReference: newCounter,
        status: "pending",
      });

      // Update the balances
      let invoiceData;
      let depositData;

      switch (transactionData.type) {
        case "invoice":
          invoiceData = (await invoicesCollection.doc(transactionData.ownerId).get()).data();
          break;
        case "deposit":
          depositData = (await depositsCollection.doc(transactionData.ownerId).get()).data();
          break;
        default:
          return;
      }
      const { isTransactionCalculated } = await calculateTransaction({ transactionData, invoiceData, depositData });

      functions.logger.log({ isTransactionCalculated });
      if (isTransactionCalculated) {
        // Complete the owner
        switch (transactionData.type) {
          case "invoice":
            await invoicesCollection.doc(transactionData.ownerId).update({ status: "completed" });
            break;
          case "deposit":
            await depositsCollection.doc(transactionData.ownerId).update({ status: "completed" });
            break;
          default:
            return;
        }

        await transactionRef.update({ status: "completed" });
      }
    } catch (e) {
      functions.logger.error(e, { transactionId: context.params.transactionId, data: snapshot.data() });
    }
  });

const onItemCreated = functions.firestore.document("items/{itemId}").onCreate(async (snapshot, context) => {
  try {
    functions.logger.log("Create new item with id:", context.params.itemId, {
      data: snapshot.data(),
    });

    const newCounter = ((await countersCollection.doc("items").get()).data()?.counter ?? 0) + 1;
    await countersCollection.doc("items").set({ counter: newCounter });

    const itemRef = itemsCollection.doc(context.params.itemId);

    await itemRef.update({
      id: context.params.itemId,
      itemReference: newCounter,
    });
  } catch (e) {
    functions.logger.error(e);
  }
});

const onInvoiceCreated = functions.firestore.document("invoices/{invoiceId}").onCreate(async (snapshot, context) => {
  try {
    functions.logger.log("Create new invoice with id:", context.params.invoiceId, {
      data: snapshot.data(),
    });

    const newCounter = ((await countersCollection.doc("invoices").get()).data()?.counter ?? 0) + 1;
    await countersCollection.doc("invoices").set({ counter: newCounter });

    const invoiceData = snapshot.data();

    const invoiceRef = invoicesCollection.doc(context.params.invoiceId);

    await invoiceRef.update({
      id: context.params.invoiceId,
      invoiceReference: newCounter,
    });

    /*-------------Invoice Handler------------*/
    for (let item of invoiceData.items) {
      // Subtract items from the source account
      const fromItemCollectionRef = accountsCollection.doc(invoiceData?.from.id).collection("items");
      const toItemCollectionRef = accountsCollection.doc(invoiceData?.to.id).collection("items");
      const fromItemRef = fromItemCollectionRef.where("id", "==", item.id);
      const toItemRef = toItemCollectionRef.where("id", "==", item.id);
      const fromItem = (await fromItemRef.get()).docs[0] ?? null;
      const toItem = (await toItemRef.get()).docs[0] ?? null;

      if (fromItem?.id) {
        await fromItemCollectionRef
          .doc(fromItem.id)
          .update({ quantity: (fromItem.data()?.quantity ?? 0) - item.quantity });
      } else {
        item.quantity = -item.quantity;
        await fromItemCollectionRef.add(item);
      }

      // Add items to the destination
      if (toItem?.id) {
        await toItemCollectionRef.doc(toItem.id).update({ quantity: (toItem.data()?.quantity ?? 0) + item.quantity });
      } else {
        item.quantity = Math.abs(item.quantity);
        await toItemCollectionRef.add(item);
      }
    }

    // Create a transaction for this invoice
    await transactionsCollection.add({
      type: "invoice",
      totalAmount: invoiceData.subTotal,
      creditAmount: invoiceData.subTotal - invoiceData.paidAmount,
      sourceAccount: invoiceData.from,
      destinationAccount: invoiceData.to,
      ownerId: context.params.invoiceId,
    });
  } catch (e) {
    functions.logger.error(e, {
      invoiceId: context.params.invoiceId,
      data: snapshot.data(),
    });
  }
});

const onInvoiceUpdated = functions.firestore.document("invoices/{invoiceId}").onUpdate(async (change, context) => {
  try {
    const before = change.before.data();
    const after = change.after.data();
    functions.logger.log("Updating invoice with id:", context.params.invoiceId, {
      before,
      after,
    });

    // Cancelled Invoice
    if (before.status == "completed" && after.status == "cancelled") {
      // Make a transaction exist first
      const transaction = (await transactionsCollection.where("ownerId", "==", change.before.id).get()).docs[0];
      if (!transaction) {
        functions.logger.error(
          "Tried to cancled invoice",
          change.before.id,
          "but no transactions found for this invoice"
        );
        return;
      }

      // Reverse invoice items
      for (let item of before.items) {
        // Subtract items from the source account
        const fromItemCollectionRef = accountsCollection.doc(before?.from.id).collection("items");
        const toItemCollectionRef = accountsCollection.doc(before?.to.id).collection("items");
        const fromItemRef = fromItemCollectionRef.where("id", "==", item.id);
        const toItemRef = toItemCollectionRef.where("id", "==", item.id);
        const fromItem = (await fromItemRef.get()).docs[0] ?? null;
        const toItem = (await toItemRef.get()).docs[0] ?? null;

        if (fromItem?.id) {
          await fromItemCollectionRef
            .doc(fromItem.id)
            .update({ quantity: (fromItem.data()?.quantity ?? 0) + item.quantity });
        } else {
          item.quantity = Math.abs(item.quantity);
          await fromItemCollectionRef.add(item);
        }

        // Add items to the destination
        if (toItem?.id) {
          await toItemCollectionRef.doc(toItem.id).update({ quantity: (toItem.data()?.quantity ?? 0) - item.quantity });
        } else {
          item.quantity = -Math.abs(item.quantity);
          await toItemCollectionRef.add(item);
        }
      }

      // Cancel transaction
      await transactionsCollection.doc(transaction.id).update({ status: "cancelled" });
      return;
    }
  } catch (e) {
    functions.logger.error(e, {
      invoiceId: context.params.invoiceId,
      before: change.before.data(),
      after: change.after.data(),
    });
  }
});

const onTransactionUpdated = functions.firestore
  .document("transactions/{transactionId}")
  .onUpdate(async (change, context) => {
    try {
      const before = change.before.data();
      const after = change.after.data();
      functions.logger.log("Updating transaction with id:", context.params.transactionId, {
        before,
        after,
      });

      const transactionRef = transactionsCollection.doc(context.params.transactionId);

      // Cancelled transaction
      if (before.status == "completed" && after.status == "cancelled") {
        // Reverse Money
        let invoiceData;
        let depositData;

        switch (after.type) {
          case "invoice":
            invoiceData = (await invoicesCollection.doc(after.ownerId).get()).data();
            break;
          case "deposit":
            depositData = (await depositsCollection.doc(after.ownerId).get()).data();
            break;
          default:
            return;
        }

        const { isTransactionCalculated } = await calculateTransaction({
          transactionData: after,
          invoiceData,
          depositData,
          isReversed: true,
        });

        if (isTransactionCalculated) {
          await transactionRef.update({ status: "completed" });
        }
      }
    } catch (e) {
      functions.logger.error(e, {
        transactionId: context.params.transactionId,
        before: change.before.data(),
        after: change.after.data(),
      });
    }
  });

const onDepositCreated = functions.firestore.document("deposits/{depositId}").onCreate(async (snapshot, context) => {
  try {
    const depositData = snapshot.data();
    functions.logger.log("Create new deposit with id:", context.params.depositId, {
      data: depositData,
    });

    const newCounter = ((await countersCollection.doc("deposits").get()).data()?.counter ?? 0) + 1;
    await countersCollection.doc("deposits").set({ counter: newCounter });
    const depositRef = depositsCollection.doc(context.params.depositId);

    await depositRef.update({
      id: context.params.depositId,
      depositReference: newCounter,
      status: "pending",
    });

    // Create a transaction for the deposit
    await transactionsCollection.add({
      type: "deposit",
      totalAmount: depositData.amount,
      creditAmount: depositData.amount,
      sourceAccount: depositData.from,
      destinationAccount: depositData.to,
      ownerId: context.params.depositId,
    });
  } catch (e) {
    functions.logger.error(e, {
      depositId: context.params.depositId,
      deposit: snapshot.data(),
    });
  }
});

module.exports = {
  onTransactionCreated,
  onItemCreated,
  onInvoiceCreated,
  onInvoiceUpdated,
  onTransactionUpdated,
  onDepositCreated,
};
