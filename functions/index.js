const functions = require("firebase-functions");
const { transactionsCollection, itemsCollection } = require("./firestore");

const onTransactionCreated = functions.firestore
  .document("transactions/{transactionId}")
  .onCreate(async (snapshot, context) => {
    try {
      functions.logger.log("Created transaction with id:", context.params.transactionId, {
        data: snapshot.data(),
      });

      const transactionRef = transactionsCollection.doc(context.params.transactionId);
      transactionRef.update({ isDeleted: false });
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
    itemRef.update({ customCode: (allItems.size + 1).toString() });
  } catch (e) {
    functions.logger.error(e);
  }
});

module.exports = { onTransactionCreated, onItemCreated };
