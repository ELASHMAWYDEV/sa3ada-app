// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/data/firestore_models/item_model.dart';
import 'package:sa3ada_app/data/models/mini_table_model.dart';
import 'package:sa3ada_app/ui/components/alert_prompt_box.dart';
import 'package:sa3ada_app/ui/components/main_button.dart';
import 'package:sa3ada_app/ui/components/mini_table.dart';
import 'package:sa3ada_app/ui/controllers/add_new_invoice_controller.dart';
import 'package:sa3ada_app/utils/constants.dart';
import 'package:sa3ada_app/utils/utils.dart';

class ConfirmInvoiceModal extends StatelessWidget {
  ConfirmInvoiceModal({
    Key? key,
  }) : super(key: key);

  bool isCreatingInvoiceFinished = false;

  final AddNewInvoiceController controller =
      Get.find<AddNewInvoiceController>();

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Dialog(
        backgroundColor: kSecondaryColor,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          width: size.width * 0.9,
          height: size.height * 0.6,
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
            SizedBox(
              height: size.height * 0.4,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: MiniTable(
                    onPressingAll: () {},
                    listAll: true,
                    data: controller.invoiceItems,
                    columns: [
                      MiniTableModel(
                          title: "م",
                          selector: (row) =>
                              (controller.invoiceItems.indexOf(row) + 1)
                                  .toString()),
                      MiniTableModel(
                          title: "اسم الكتاب",
                          selector: (row) => getBookFullName(row)),
                      MiniTableModel(
                          title: "الكمية", selector: (row) => row.quantity),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            MainButton(
                title: "تسجيل الفاتورة",
                onPressed: () {
                  AlertPromptBox.showPrompt(
                      message: "تأكيد تسجيل الفاتورة",
                      title: "تأكيد",
                      onSuccess: () async {
                        await controller.addNewInvoice();
                      });
                })
          ]),
        ),
      );
    });
  }
}
