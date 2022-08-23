// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/data/firestore_models/item_model.dart';
import 'package:sa3ada_app/data/models/mini_table_model.dart';
import 'package:sa3ada_app/ui/components/alert_prompt_box.dart';
import 'package:sa3ada_app/ui/components/main_button.dart';
import 'package:sa3ada_app/ui/components/mini_table.dart';
import 'package:sa3ada_app/ui/components/text_box.dart';
import 'package:sa3ada_app/ui/controllers/add_new_invoice_controller.dart';
import 'package:sa3ada_app/utils/constants.dart';
import 'package:sa3ada_app/utils/utils.dart';

class ConfirmInvoiceModal extends StatelessWidget {
  ConfirmInvoiceModal({
    Key? key,
  }) : super(key: key);

  bool isCreatingInvoiceFinished = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddNewInvoiceController>(builder: (_) {
      return Dialog(
        backgroundColor: kSecondaryColor,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          width: size.width * 0.9,
          height: size.height * 0.45 + 250,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    blurRadius: 2, color: kSecondaryColor.withOpacity(0.5))
              ]),
          child: Column(children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SizedBox(
                      width: 25,
                      height: 25,
                      child: Center(
                        child: Icon(
                          Icons.close,
                          color: kSecondaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "تأكيد الفاتورة",
                  style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                  text: "عدد الاصناف: ",
                  style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: 16,
                      fontFamily: kFontFamilyPrimary),
                  children: [
                    TextSpan(
                        text: "${_.invoiceItems.length}",
                        style: TextStyle(fontWeight: FontWeight.w600))
                  ]),
            ),
            SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                  text: "الاجمالي: ",
                  style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: 16,
                      fontFamily: kFontFamilyPrimary),
                  children: [
                    TextSpan(
                        text: "${_.subTotal} جنيه",
                        style: TextStyle(fontWeight: FontWeight.w600))
                  ]),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: MiniTable(
                onPressingAll: () {},
                data: _.invoiceItems,
                columns: [
                  MiniTableModel(
                      title: "اسم الكتاب",
                      selector: (row) => getBookFullName(row)),
                  MiniTableModel(
                      title: "الكمية", selector: (row) => row.quantity),
                ],
              ),
            ),
            Spacer(),
            Visibility(
              visible: _.arguments["subFrom"].type != "store",
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextBox(
                  label: "المبلغ المدفوع",
                  controller: _.paidAmountController,
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            SizedBox(height: 20),
            Visibility(
              visible: _.arguments["subFrom"].type == "store" ||
                  _.paidAmountController.text != "",
              child: MainButton(
                  title: "تسجيل الفاتورة",
                  onPressed: () async {
                    AlertPromptBox.showPrompt(
                        message: "تأكيد تسجيل الفاتورة",
                        title: "تأكيد",
                        onSuccess: () async {
                          await _.addNewInvoice();
                        });
                  }),
            )
          ]),
        ),
      );
    });
  }
}
