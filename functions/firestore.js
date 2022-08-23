const admin = require("firebase-admin");

admin.initializeApp();

const usersCollection = admin.firestore().collection("users");
const accountsCollection = admin.firestore().collection("accounts");
const invoicesCollection = admin.firestore().collection("invoices");
const depositsCollection = admin.firestore().collection("deposits");
const transactionsCollection = admin.firestore().collection("transactions");
const itemsCollection = admin.firestore().collection("items");
const countersCollection = admin.firestore().collection("counters");

module.exports = {
  usersCollection,
  accountsCollection,
  invoicesCollection,
  depositsCollection,
  transactionsCollection,
  itemsCollection,
  countersCollection,
};
