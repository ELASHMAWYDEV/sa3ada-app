// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/ui/components/header.dart';
import 'package:sa3ada_app/ui/components/main_button.dart';
import 'package:sa3ada_app/ui/components/rounded_selector_box.dart';
import 'package:sa3ada_app/ui/components/select_box.dart';
import 'package:sa3ada_app/ui/components/take_photo_button.dart';
import 'package:sa3ada_app/ui/components/text_box.dart';
import 'package:sa3ada_app/ui/controllers/transfer_deposit_controller.dart';
import 'package:sa3ada_app/utils/constants.dart';

class TransferDepositScreen extends StatelessWidget {
  TransferDepositScreen({Key? key}) : super(key: key);

  final TransferDepositController controller =
      Get.put(TransferDepositController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransferDepositController>(builder: (_) {
      return Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(children: [
              Header(title: "ايداع / تحويل", icon: Icons.close),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Text("اختر نوع المحول منه",
                        style: TextStyle(color: kGrayLightColor, fontSize: 12)),
                    SizedBox(
                      height: 15,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: _.fromSelectors
                    //       .map((selector) => RoundedSelectorBox(
                    //             selector: selector,
                    //             isActive: selector == _.selectedFrom,
                    //             onClick: () {
                    //               _.selectedFrom = selector;
                    //               _.selectedSubFrom = null;
                    //               _.update();
                    //             },
                    //           ))
                    //       .toList(),
                    // ),
                    Visibility(
                        visible: ["تاجر", "فرع"].contains(_.selectedFrom),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            SelectBox(
                              items: _.selectedFrom == "تاجر"
                                  ? _.subSelectors["traders"]!
                                  : _.subSelectors["branches"]!,
                              selectedItemIndex: _.selectedFrom == "تاجر"
                                  ? _.selectedSubFrom != null
                                      ? _.subSelectors["traders"]!
                                          .indexOf(_.selectedSubFrom!)
                                      : 0
                                  : _.selectedSubFrom != null
                                      ? _.subSelectors["branches"]!
                                          .indexOf(_.selectedSubFrom!)
                                      : 0,
                              onChange: (index) {
                                _.selectedFrom == "تاجر"
                                    ? _.selectedSubFrom =
                                        _.subSelectors["traders"]![index]
                                    : _.selectedSubFrom =
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
                            Text("اختر نوع المحول اليه",
                                style: TextStyle(
                                    color: kGrayLightColor, fontSize: 12)),
                            SizedBox(
                              height: 15,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: _.toSelectors
                            //       .map((selector) => RoundedSelectorBox(
                            //             selector: selector,
                            //             isActive: selector == _.selectedTo,
                            //             onClick: () {
                            //               _.selectedTo = selector;
                            //               _.selectedSubTo = null;
                            //               _.update();
                            //             },
                            //           ))
                            //       .toList(),
                            // ),
                            Visibility(
                                visible: ["تاجر", "فرع"].contains(_.selectedTo),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    SelectBox(
                                      items: _.selectedTo == "تاجر"
                                          ? _.subSelectors["traders"]!
                                          : _.subSelectors["branches"]!,
                                      selectedItemIndex: _.selectedTo == "تاجر"
                                          ? _.selectedSubTo != null
                                              ? _.subSelectors["traders"]!
                                                  .indexOf(_.selectedSubTo!)
                                              : 0
                                          : _.selectedSubTo != null
                                              ? _.subSelectors["branches"]!
                                                  .indexOf(_.selectedSubTo!)
                                              : 0,
                                      onChange: (index) {
                                        _.selectedFrom == "تاجر"
                                            ? _.selectedSubTo = _
                                                .subSelectors["traders"]![index]
                                            : _.selectedSubTo = _.subSelectors[
                                                "branches"]![index];
                                        _.update();
                                      },
                                    ),
                                  ],
                                )),
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
                                    TextBox(
                                        label: "رقم الايصال",
                                        controller:
                                            _.receiptNumberInputController,
                                        keyboardType: TextInputType.number),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TakePhotoButton(
                                          title: "اضافة صور الايداع/السحب",
                                          onSelectingImages: (images) {},
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    MainButton(
                                      title: "اضافة",
                                      onPressed: () {},
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
        ),
      );
    });
  }
}
