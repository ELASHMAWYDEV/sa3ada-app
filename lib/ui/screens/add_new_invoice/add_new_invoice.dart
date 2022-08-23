// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_function_declarations_over_variables
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/data/firestore_models/item_model.dart' as item_model;
import 'package:sa3ada_app/data/models/mini_table_model.dart';
import 'package:sa3ada_app/ui/components/alert_prompt_box.dart';
import 'package:sa3ada_app/ui/components/header.dart';
import 'package:sa3ada_app/ui/components/item_select_button.dart';
import 'package:sa3ada_app/ui/components/main_button.dart';
import 'package:sa3ada_app/ui/components/mini_table.dart';
import 'package:sa3ada_app/ui/components/scan_barcode_button.dart';
import 'package:sa3ada_app/ui/controllers/add_new_invoice_controller.dart';
import 'package:sa3ada_app/utils/constants.dart';
import 'package:sa3ada_app/utils/utils.dart';

import 'components/confirm_invoice_modal.dart';

class AddNewInvoice extends StatelessWidget {
  AddNewInvoice({Key? key}) : super(key: key);

  final AddNewInvoiceController controller = Get.put(AddNewInvoiceController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddNewInvoiceController>(builder: (_) {
      final scanBtn = ({bool isFloatingBtn = false}) => ScanBarCodeButton(
          isFloatingBtn: isFloatingBtn,
          title: "التقاط باركود الصنف",
          isBarcodeVisible: false,
          onBarCodeScanned: (barcode) async {
            await _.itemQuantitybyBarcode(barcode: barcode);
          });
      return WillPopScope(
        onWillPop: () async {
          AlertPromptBox.showPrompt(
              message: "لن يتم تسجيل هذه الفاتورة ، هل تريد الخروج فعلا ؟",
              title: "تحذير",
              onSuccess: () async {
                Get.delete<AddNewInvoiceController>();
                Get.back();
              });
          return false;
        },
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            floatingActionButton: scanBtn(isFloatingBtn: true),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.startFloat,
            body: Column(children: [
              Header(
                title: "انشاء فاتورة جديدة",
                icon: Icons.close,
                onIconPressed: () {
                  AlertPromptBox.showPrompt(
                      message:
                          "لن يتم تسجيل هذه الفاتورة ، هل تريد الخروج فعلا ؟",
                      title: "تحذير",
                      onSuccess: () async {
                        Get.back();
                      });
                },
              ),
              SizedBox(
                  height: size.height -
                      kToolbarHeight -
                      MediaQuery.of(context).padding.top,
                  child: SingleChildScrollView(
                      child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(children: [
                      Text("تاريخ الفاتورة",
                          style:
                              TextStyle(color: kGrayLightColor, fontSize: 10)),
                      TextButton(
                          onPressed: () async {
                            _.invoiceDate = await showDatePicker(
                                    context: context,
                                    initialDate: _.invoiceDate,
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime.now()) ??
                                DateTime.now();
                            _.update();
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: kSecondaryColor,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4))),
                          child: Text(
                            "${_.invoiceDate.day}/${_.invoiceDate.month}/${_.invoiceDate.year}",
                            style: TextStyle(color: kWhiteColor),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: "فاتورة من ",
                              style: TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 20,
                                  fontFamily: kFontFamilyPrimary),
                              children: [
                                TextSpan(
                                    text: "${_.arguments["subFrom"].name}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: kGreenColor)),
                                TextSpan(text: " الى "),
                                TextSpan(
                                    text: "${_.arguments["subTo"].name}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: kGreenColor))
                              ])),
                      Divider(
                        color: kSecondaryColor,
                        height: 50,
                        thickness: 1,
                        indent: 40,
                        endIndent: 40,
                      ),
                      scanBtn(),
                      SizedBox(
                        height: 10,
                      ),
                      Text("أو",
                          style: TextStyle(color: kWhiteColor, fontSize: 20)),
                      SizedBox(
                        height: 10,
                      ),
                      ItemSelectButton(
                        defaultSelectedQuantity:
                            _.arguments["subTo"].type == "customer" ? 1 : null,
                        selectedItems: _.invoiceItems,
                        fromAccount: _.arguments["subFrom"],
                        onSelect: (item, quantity) {
                          if (_.invoiceItems
                                  .firstWhereOrNull((e) => e.id == item.id) ==
                              null) {
                            _.invoiceItems.add(item_model.ItemModel.fromJson(
                                {...item.toJson(), "quantity": quantity}));
                          } else {
                            final int itemIndex = _.invoiceItems
                                .indexWhere((e) => e.id == item.id);

                            _.invoiceItems[itemIndex] =
                                item_model.ItemModel.fromJson({
                              ..._.invoiceItems[itemIndex].toJson(),
                              "quantity": quantity
                            });
                          }
                        },
                      ),
                      Divider(
                        color: kSecondaryColor,
                        height: 50,
                        thickness: 1,
                        indent: 40,
                        endIndent: 40,
                      ),
                      MiniTable(
                        title: "الأصناف",
                        onPressingAll: () {},
                        onCellPressed: (row) async {
                          await _.itemQuantitybyBarcode(barcode: row.barcode);
                        },
                        listAll: true,
                        columnWidths: {
                          1: FlexColumnWidth(2),
                        },
                        data: _.invoiceItems,
                        columns: [
                          MiniTableModel(
                              title: "م",
                              selector: (row) =>
                                  (_.invoiceItems.indexOf(row) + 1).toString()),
                          MiniTableModel(
                              title: "اسم الكتاب",
                              selector: (row) => getBookFullName(row)),
                          MiniTableModel(
                              title: "الكمية", selector: (row) => row.quantity),
                          MiniTableModel(
                              title: "سعر البيع",
                              selector: (row) => row.coverPrice),
                          MiniTableModel(
                            title: "",
                            selector: (row) => row,
                            cell: (row) => SizedBox(
                              height: 30,
                              width: 30,
                              child: TextButton(
                                onPressed: () {
                                  _.invoiceItems.remove(row);
                                  _.update();
                                  AlertPromptBox.showSuccess(
                                      message:
                                          "تم حذف ${getBookFullName(row)}");
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  backgroundColor: kRedColor,
                                  fixedSize: Size(15, 15),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.delete_forever_rounded,
                                    color: kWhiteColor,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: kSecondaryColor,
                        height: 50,
                        thickness: 1,
                        indent: 40,
                        endIndent: 40,
                      ),
                      Row(
                        children: [
                          Text(
                            "الإجمالي",
                            style: TextStyle(
                                color: kWhiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            "${_.total} ج",
                            style: TextStyle(
                                color: kWhiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Visibility(
                        visible: _.arguments["subFrom"].type != "store",
                        child: Row(
                          children: [
                            Text(
                              "الخصم",
                              style: TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            DropdownButton2(
                                iconSize: 30,
                                underline: SizedBox(),
                                focusColor: kGreenColor,
                                customButton: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 3),
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: kWhiteColor,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${_.discountPercentage}%",
                                        style: TextStyle(
                                            color: kSecondaryColor,
                                            fontSize: 14,
                                            fontFamily: kFontFamilyPrimary),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down_rounded,
                                        color: kSecondaryColor,
                                        size: 30,
                                      )
                                    ],
                                  ),
                                ),
                                iconDisabledColor: kRedColor,
                                iconEnabledColor: kWhiteColor,
                                style: TextStyle(color: kSecondaryColor),
                                items: List.generate(
                                    101,
                                    (index) => DropdownMenuItem<int>(
                                          child: Text("$index"),
                                          value: index,
                                        )),
                                onChanged: (int? index) {
                                  _.discountPercentage(index!.toDouble());
                                  _.update();
                                }),
                            Spacer(),
                            Text(
                              "- ${numberToString(_.total * _.discountPercentage.toDouble() / 100)} ج",
                              style: TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: _.arguments["subFrom"].type == "trader",
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  "الاجمالي بعد الخصم",
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Text(
                                  "- ${numberToString((_.total - _.total * _.discountPercentage.toDouble() / 100), includeMinimals: true)} ج",
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  "العمولة",
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                DropdownButton2(
                                    iconSize: 30,
                                    underline: SizedBox(),
                                    focusColor: kGreenColor,
                                    customButton: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 3),
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: kWhiteColor,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${_.commissionPercentage}%",
                                            style: TextStyle(
                                                color: kSecondaryColor,
                                                fontSize: 14,
                                                fontFamily: kFontFamilyPrimary),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down_rounded,
                                            color: kSecondaryColor,
                                            size: 30,
                                          )
                                        ],
                                      ),
                                    ),
                                    iconDisabledColor: kRedColor,
                                    iconEnabledColor: kWhiteColor,
                                    style: TextStyle(color: kSecondaryColor),
                                    items: List.generate(
                                        51,
                                        (index) => DropdownMenuItem<int>(
                                              child: Text("$index"),
                                              value: index,
                                            )),
                                    onChanged: (int? index) {
                                      _.commissionPercentage(index!.toDouble());
                                      _.update();
                                    }),
                                Spacer(),
                                Text(
                                  "- ${numberToString((_.total - _.total * _.discountPercentage.toDouble() / 100) * _.commissionPercentage.toDouble() / 100, includeMinimals: true)} ج",
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: kWhiteColor,
                        height: 30,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "الإجمالي بعد الخصم ${_.arguments["subFrom"].type == "trader" ? "والعمولة" : ""}",
                            style: TextStyle(
                                color: kWhiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            "${numberToString(_.subTotal, includeMinimals: true)} ج",
                            style: TextStyle(
                                color: kWhiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      MainButton(
                          title: "انشاء الفاتورة",
                          onPressed: () async {
                            if (_.invoiceItems.isEmpty) {
                              return AlertPromptBox.showError(
                                  error: "يجب اضافة صنف واحد علي الأقل");
                            }
                            Get.dialog(ConfirmInvoiceModal());
                            // await _.addNewInvoice();
                          })
                    ]),
                  )))
            ])),
      );
    });
  }
}
