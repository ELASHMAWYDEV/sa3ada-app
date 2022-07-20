const admin = require("firebase-admin");

admin.initializeApp();

const usersCollection = admin.firestore().collection("users");
const accountsCollection = admin.firestore().collection("accounts");
const invoicesCollection = admin.firestore().collection("invoices");
const transactionsCollection = admin.firestore().collection("transactions");
const itemsCollection = admin.firestore().collection("items");

module.exports = {
  usersCollection,
  accountsCollection,
  invoicesCollection,
  transactionsCollection,
  itemsCollection,
  
};
