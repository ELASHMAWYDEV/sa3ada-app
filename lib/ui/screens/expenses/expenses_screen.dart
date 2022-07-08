// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/ui/components/header.dart';
import 'package:sa3ada_app/ui/components/main_button.dart';
import 'package:sa3ada_app/ui/components/rounded_selector_box.dart';
import 'package:sa3ada_app/ui/components/select_box.dart';
import 'package:sa3ada_app/ui/components/take_photo_button.dart';
import 'package:sa3ada_app/ui/components/text_box.dart';
import 'package:sa3ada_app/ui/controllers/expenses_controller.dart';
import 'package:sa3ada_app/utils/constants.dart';

class ExpensesScreen extends StatelessWidget {
  ExpensesScreen({Key? key}) : super(key: key);

  final ExpensesController controller = Get.put(ExpensesController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExpensesController>(builder: (_) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Header(title: "المصاريف", icon: Icons.close),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Text("اختر مصدر المصاريف",
                      style: TextStyle(color: kGrayLightColor, fontSize: 12)),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: _.fromSelectors
                        .map((selector) => RoundedSelectorBox(
                              selector: selector,
                              isActive: selector == _.selectedFrom,
                              onClick: () {
                                _.selectedFrom = selector;
                                _.selectedSubFrom = null;
                                _.update();
                              },
                            ))
                        .toList(),
                  ),
                  Visibility(
                      visible: _.selectedFrom == "فرع",
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          SelectBox(
                            items: _.subSelectors["branches"]!,
                            selectedItemIndex: _.selectedSubFrom != null
                                ? _.subSelectors["branches"]!
                                    .indexOf(_.selectedSubFrom!)
                                : 0,
                            onChange: (index) {
                              _.selectedSubFrom =
                                  _.subSelectors["branches"]![index];
                              _.update();
                            },
                          ),
                        ],
                      )),
                  Visibility(
                      visible: _.selectedFrom != null,
                      child: Column(
                        children: [
                          Divider(
                            color: kSecondaryColor,
                            height: 50,
                            thickness: 1,
                            indent: 40,
                            endIndent: 40,
                          ),
                          Text("اختر وجهة المصاريف",
                              style: TextStyle(
                                  color: kGrayLightColor, fontSize: 12)),
                          SizedBox(
                            height: 15,
                          ),
                          SelectBox(
                            items: _.toSelectors,
                            selectedItemIndex: _.selectedTo != null
                                ? _.toSelectors.indexOf(_.selectedTo!)
                                : 0,
                            onChange: (index) {
                              _.selectedTo = _.toSelectors[index];
                              _.update();
                            },
                          ),
                          Visibility(
                              visible: _.selectedTo != null,
                              child: Column(
                                children: [
                                  Divider(
                                    color: kSecondaryColor,
                                    height: 50,
                                    thickness: 1,
                                    indent: 40,
                                    endIndent: 40,
                                  ),
                                  TextBox(
                                      label: "المبلغ",
                                      controller: _.amountInputController,
                                      keyboardType: TextInputType.number),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextBox(
                                    label:
                                        "ملاحظة...مثال: مصاريف فاتورة ، ايراد مكتبة",
                                    controller: _.noteInputController,
                                    isLarge: true,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TakePhotoButton(),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  MainButton(
                                    title: "اضافة",
                                    onPressed: () async {
                                      await _.createExpensesTransaction();
                                    },
                                  ),
                                ],
                              ))
                        ],
                      ))
                ],
              ),
            ),

            // SelectModal(
            //     items: _.items,
            //     selectedItemIndex: _.selectedItemIndex,
            //     onChange: (index) {})
          ]),
        ),
      );
    });
  }
}
