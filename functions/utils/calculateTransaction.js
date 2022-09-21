const { accountsCollection } = require("../firestore");
const functions = require("firebase-functions");

const getSign = (number, isReversed) => (isReversed ? -number : number);

module.exports = async ({ transactionData, invoiceData, depositData, isReversed = false }) => {
  const fromAccountRef = accountsCollection.doc(transactionData?.sourceAccount.id);
  const toAccountRef = accountsCollection.doc(transactionData?.destinationAccount.id);
  const fromAccountData = (await fromAccountRef.get()).data();
  const toAccountData = (await toAccountRef.get()).data();

  let fromTotalBalance = fromAccountData?.totalBalance ?? 0;
  let fromCreditBalance = fromAccountData?.creditBalance ?? 0;
  let toTotalBalance = toAccountData?.totalBalance ?? 0;
  let toCreditBalance = toAccountData?.creditBalance ?? 0;

  let isTransactionCalculated = true;

  functions.logger.log("calculating..", transactionData.type, fromAccountData?.type, toAccountData?.type);
  switch (fromAccountData?.type) {
    case "trader":
      switch (transactionData.type) {
        case "invoice":
          fromTotalBalance = fromTotalBalance + getSign(transactionData.totalAmount, isReversed);
          fromCreditBalance = fromCreditBalance - getSign(transactionData.creditAmount, isReversed);
          break;
        case "deposit":
          return { isTransactionCalculated: false };
        default:
          return { isTransactionCalculated: false };
      }
      break;
    case "branch":
      switch (transactionData.type) {
        case "invoice":
          fromTotalBalance = fromTotalBalance - getSign(transactionData.totalAmount, isReversed);
          break;
        case "deposit":
          fromCreditBalance = fromCreditBalance + getSign(transactionData.creditAmount, isReversed);
          break;
        default:
          return { isTransactionCalculated: false };
      }
      break;
    case "store":
      switch (transactionData.type) {
        case "invoice":
          if (invoiceData?.commissionPercentage) {
            // In case from a trader, remove the commission percentage
            fromTotalBalance =
              fromTotalBalance -
              getSign((invoiceData.total * (100 - invoiceData.discountPercentage)) / 100, isReversed);
          } else {
            fromTotalBalance = fromTotalBalance - getSign(transactionData.totalAmount, isReversed);
          }
          fromCreditBalance = fromCreditBalance - getSign(invoiceData.total, isReversed); // Before discount & commission
          break;
        case "deposit":
          return { isTransactionCalculated: false };
        default:
          return { isTransactionCalculated: false };
      }
      break;
    case "safe":
      switch (transactionData.type) {
        case "invoice":
          return { isTransactionCalculated: false };
        case "deposit":
          return { isTransactionCalculated: false };
        default:
          return { isTransactionCalculated: false };
      }
      break;
    case "bankAccount":
      switch (transactionData.type) {
        case "invoice":
          return { isTransactionCalculated: false };
        case "deposit":
          fromTotalBalance = fromTotalBalance - getSign(transactionData.totalAmount, isReversed);
          break;
        default:
          return { isTransactionCalculated: false };
      }
      break;
    case "sa3adaAccount":
      switch (transactionData.type) {
        case "invoice":
          return { isTransactionCalculated: false };
        case "deposit":
          return { isTransactionCalculated: false };
        default:
          return { isTransactionCalculated: false };
      }
      break;
    case "client":
      switch (transactionData.type) {
        case "invoice":
          return { isTransactionCalculated: false };
        case "deposit":
          fromCreditBalance = fromCreditBalance + getSign(transactionData.totalAmount, isReversed);
          break;
        default:
          return { isTransactionCalculated: false };
      }
      break;
    case "customer":
      switch (transactionData.type) {
        case "invoice":
          return { isTransactionCalculated: false };
        case "deposit":
          return { isTransactionCalculated: false };
        default:
          return { isTransactionCalculated: false };
      }
      break;
    default:
      return { isTransactionCalculated: false };
  }

  /**---------------------------**/
  switch (toAccountData?.type) {
    case "trader":
      switch (transactionData.type) {
        case "invoice":
          return { isTransactionCalculated: false };
        case "deposit":
          toCreditBalance = toCreditBalance + getSign(transactionData.creditAmount, isReversed);
          break;
        default:
          return { isTransactionCalculated: false };
      }
      break;
    case "branch":
      switch (transactionData.type) {
        case "invoice":
          toTotalBalance = toTotalBalance + getSign(transactionData.totalAmount, isReversed);
          toCreditBalance = toCreditBalance - getSign(transactionData.creditAmount, isReversed);
          break;
        case "deposit":
          toCreditBalance = toCreditBalance - getSign(transactionData.creditAmount, isReversed);
          break;
        default:
          return { isTransactionCalculated: false };
      }
      break;
    case "store":
      switch (transactionData.type) {
        case "invoice":
          if (invoiceData?.commissionPercentage) {
            // In case from a trader, remove the commission percentage
            toTotalBalance =
              toTotalBalance + getSign((invoiceData.total * (100 - invoiceData.discountPercentage)) / 100, isReversed);
          } else {
            toTotalBalance = toTotalBalance + getSign(transactionData.totalAmount, isReversed);
          }
          toCreditBalance = toCreditBalance + getSign(invoiceData.total, isReversed); // Before discount & commission
          break;
        case "deposit":
          return { isTransactionCalculated: false };
        default:
          return { isTransactionCalculated: false };
      }
      break;
    case "safe":
      switch (transactionData.type) {
        case "invoice":
          return { isTransactionCalculated: false };
        case "deposit":
          return { isTransactionCalculated: false };
        default:
          return { isTransactionCalculated: false };
      }
      break;
    case "bankAccount":
      switch (transactionData.type) {
        case "invoice":
          return { isTransactionCalculated: false };
        case "deposit":
          fromTotalBalance = fromTotalBalance - getSign(transactionData.totalAmount, isReversed);
          break;
        default:
          return { isTransactionCalculated: false };
      }
      break;
    case "sa3adaAccount":
      switch (transactionData.type) {
        case "invoice":
          return { isTransactionCalculated: false };
        case "deposit":
          return { isTransactionCalculated: false };
        default:
          return { isTransactionCalculated: false };
      }
      break;
    case "client":
      switch (transactionData.type) {
        case "invoice":
          toTotalBalance = toTotalBalance + getSign(transactionData.totalAmount, isReversed);
          toCreditBalance = toCreditBalance + getSign(transactionData.creditAmount, isReversed);
          break;
        case "deposit":
          return { isTransactionCalculated: false };
        default:
          return { isTransactionCalculated: false };
      }
      break;
    case "customer":
      switch (transactionData.type) {
        case "invoice":
          return { isTransactionCalculated: false };
        case "deposit":
          return { isTransactionCalculated: false };
        default:
          return { isTransactionCalculated: false };
      }
      break;
    default:
      return { isTransactionCalculated: false };
  }

  functions.logger.log("calculating..", { isTransactionCalculated });
  if (isTransactionCalculated) {
    // From Account
    await fromAccountRef.update({
      totalBalance: fromTotalBalance,
      creditBalance: fromCreditBalance,
    });

    // To Account
    await toAccountRef.update({
      totalBalance: toTotalBalance,
      creditBalance: toCreditBalance,
    });
  }

  functions.logger.log({
    fromTotalBalance,
    fromCreditBalance,
    toTotalBalance,
    toCreditBalance,
    isTransactionCalculated,
  });
  return {
    isTransactionCalculated,
  };
};
