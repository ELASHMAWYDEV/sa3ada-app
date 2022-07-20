// ignore_for_file: prefer_if_null_operators, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/data/firestore_models/invoice_model.dart';
import 'package:sa3ada_app/ui/components/alert_prompt_box.dart';
import 'package:sa3ada_app/data/firestore_models/account_model.dart'
    as account_model;
import 'package:sa3ada_app/data/firestore_models/item_model.dart' as item_model;
import 'package:sa3ada_app/ui/components/item_quantity_sheet.dart';

class AddNewInvoiceController extends GetxController {
  final Map<String, dynamic> arguments = Get.arguments;
  var foundItems;
  RxList<item_model.ItemModel> invoiceItems = <item_model.ItemModel>[].obs;
  RxDouble discountPercentage = 0.0.obs;
  RxDouble commission = 0.0.obs;
  double total = 0;
  double subTotal = 0;

  @override
  void onInit() {
    super.onInit();

    if (arguments["from"] == null ||
        arguments["to"] == null ||
        arguments["subFrom"] == null ||
        arguments["subTo"] == null) {
      Get.back();
      return;
    }

    discountPercentage(arguments["to"].value == "client" ||
            arguments["subFrom"].type == "trader"
        ? 20
        : 0);
    commission(arguments["subFrom"].type == "trader" ? 7 : 0);
    update();

    discountPercentage.listen((p0) {
      calculateInvoice();
    });
    commission.listen((p0) {
      calculateInvoice();
    });
    invoiceItems.listen((p0) {
      calculateInvoice();
    });
  }

  void calculateInvoice() {
    total = invoiceItems
        .fold(
            0,
            (num previousValue, item) =>
                (item.quantity! * item.coverPrice) + previousValue)
        .toDouble();

    subTotal = total -
        total * discountPercentage.toDouble() / 100 -
        total * commission.toDouble() / 100;
    update();
  }

  Future addNewInvoice() async {
    try {
      // Validation
      if (invoiceItems.isEmpty) {
        return AlertPromptBox.showError(error: "يجب اضافة صنف واحد علي الأقل");
      }

      final InvoiceModelDocumentReference createdInvoice =
          await invoicesRef.add(InvoiceModel(
              from: arguments["subFrom"],
              to: arguments["subTo"],
              items: invoiceItems,
              discountPercentage: discountPercentage.toDouble(),
              commission: commission.toDouble(),
              total: total,
              subTotal: subTotal,
              paidAmount: subTotal));

      // for (final item in invoiceItems) {
      //   await invoicesRef.doc(createdInvoice.id).items.add(item);
      // }

      AlertPromptBox.showSuccess(
          message: "تم انشاء الفاتورة بنجاح",
          onDismiss: () {
            Get.offAndToNamed("/home");
          });

      // Revoke all fields
      invoiceItems = <item_model.ItemModel>[].obs;
      discountPercentage = 0.0.obs;
      total = 0;
      subTotal = 0;
    } catch (e) {
      AlertPromptBox.showError(error: "$e");
    }
  }

  Future<void> itemQuantitybyBarcode({required String barcode}) async {
    // Get item from DB
    var foundItems;
    if (arguments["subFrom"].type == "trader") {
      foundItems =
          await item_model.itemsRef.whereBarcode(isEqualTo: barcode).get();
    } else {
      foundItems = await account_model.accountsRef
          .doc(arguments["subFrom"].id)
          .accountItems
          .whereBarcode(isEqualTo: barcode)
          .get();
    }

    if (foundItems.docs.isEmpty) {
      return AlertPromptBox.showError(
          error: "هذا الصنف غير مسجل في قاعدة البيانات");
    }

    // if item is in invoice items
    final item_model.ItemModel? invoiceItem =
        invoiceItems.firstWhereOrNull((item) => item.barcode == barcode);

    Get.bottomSheet(
      ItemQuantitySheet(
          defaultSelectedQuantity: invoiceItem != null
              ? invoiceItem.quantity
              : arguments["subTo"].type == "customer"
                  ? 1
                  : null,
          item: arguments["subFrom"].type != "trader"
              ? foundItems.docs[0].data
              : item_model.ItemModel.fromJson({
                  ...foundItems.docs[0].data.toJson(),
                  "id": foundItems.docs[0].id,
                  "quantity": 100000
                }),
          onConfirm: (item, quantity) {
            // Check if Item already exist
            if (invoiceItem == null) {
              invoiceItems.add(item_model.ItemModel.fromJson(
                  {...item.toJson(), "quantity": quantity}));
            } else {
              final int itemIndex =
                  invoiceItems.indexWhere((item) => item.barcode == barcode);

              invoiceItems[itemIndex] = item_model.ItemModel.fromJson(
                  {...invoiceItems[itemIndex].toJson(), "quantity": quantity});
            }
          }),
    );
  }
}
