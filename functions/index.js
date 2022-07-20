const functions = require("firebase-functions");
const { transactionsCollection, itemsCollection, invoicesCollection, accountsCollection } = require("./firestore");

const onTransactionCreated = functions.firestore
  .document("transactions/{transactionId}")
  .onCreate(async (snapshot, context) => {
    try {
      functions.logger.log("Created transaction with id:", context.params.transactionId, {
        data: snapshot.data(),
      });

      const transactionRef = transactionsCollection.doc(context.params.transactionId);
      transactionRef.update({ id: context.params.transactionId, isDeleted: false });
    } catch (e) {
      functions.logger.error(e);
    }
  });

const onItemCreated = functions.firestore.document("items/{itemId}").onCreate(async (snapshot, context) => {
  try {
    functions.logger.log("Create new item with id:", context.params.itemId, {
      data: snapshot.data(),
    });

    const itemRef = itemsCollection.doc(context.params.itemId);
    const allItems = await itemsCollection.get();

    await itemRef.update({
      id: context.params.itemId,
      customCode: allItems.docs[allItems.size - 1].data()["customCode"] + 1,
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

    const invoiceData = snapshot.data();

    const invoiceRef = invoicesCollection.doc(context.params.invoiceId);

    await invoiceRef.update({ id: context.params.invoiceId, items: [] });

    for (let item of invoiceData.items) {
      // Subtract items from the source account
      const fromItemCollectionRef = accountsCollection.doc(invoiceData?.from.id).collection("items");
      const toItemCollectionRef = accountsCollection.doc(invoiceData?.to.id).collection("items");
      const fromItemRef = fromItemCollectionRef.where("barcode", "==", item.barcode);
      const toItemRef = toItemCollectionRef.where("barcode", "==", item.barcode);
      const fromItem = (await fromItemRef.get()).docs[0];
      const toItem = (await toItemRef.get()).docs[0];

      if (fromItem) {
        await fromItemCollectionRef
          .doc(fromItem.id)
          .set({ quantity: (fromItem.data()?.quantity ?? 0) - item.quantity }, { merge: true });
      } else {
        await fromItemCollectionRef.add({ ...item, quantity: -item.quantity });
      }

      // Add items to the destination
      if (toItem) {
        await toItemCollectionRef
          .doc(toItem.id)
          .set({ quantity: (toItem.data()?.quantity ?? 0) + item.quantity }, { merge: true });
      } else {
        await toItemCollectionRef.add({ ...item, quantity: item.quantity });
      }
    }
  } catch (e) {
    functions.logger.error(e);
  }
});

module.exports = { onTransactionCreated, onItemCreated, onInvoiceCreated };
