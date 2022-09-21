const { invoicesCollection } = require("../firestore");

const addStatusToInvoice = async () => {
  const invoices = await invoicesCollection.get();
  console.log(invoices)
}

addStatusToInvoice();
