const functions = require("firebase-functions");
const { transactionsCollection } = require("./firestore");

const onTransactionCreated = functions.firestore
  .document("transactions/{transactionId}")
  .onCreate(async (snapshot, context) => {
    functions.logger.log("Created transaction with id:", context.params.transactionId, {
      data: snapshot.data(),
    });

    const transactionRef = transactionsCollection.doc(context.params.transactionId);
    transactionRef.update({ isDeleted: false });

    




  });

module.exports = { onTransactionCreated };
