// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/ui/components/header.dart';
import 'package:sa3ada_app/ui/components/main_button.dart';
import 'package:sa3ada_app/ui/components/rounded_selector_box.dart';
import 'package:sa3ada_app/ui/components/scan_barcode_button.dart';
import 'package:sa3ada_app/ui/components/take_photo_button.dart';
import 'package:sa3ada_app/ui/components/text_box.dart';
import 'package:sa3ada_app/ui/controllers/add_new_book_controller.dart';
import 'package:sa3ada_app/utils/constants.dart';

class AddNewBookScreen extends StatelessWidget {
  AddNewBookScreen({Key? key}) : super(key: key);

  final AddNewBookController controller = Get.put(AddNewBookController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddNewBookController>(builder: (_) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Header(
              title: "اضافة كتاب جديد",
              icon: Icons.close,
            ),
            SizedBox(
              height: size.height -
                  kToolbarHeight -
                  MediaQuery.of(context).padding.top,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(children: [
                    Text("اختر الترم",
                        style: TextStyle(color: kGrayLightColor, fontSize: 12)),
                    SizedBox(
                      height: 15,
                    ),
                    Wrap(
                      alignment: WrapAlignment.center,
                      runSpacing: 15,
                      spacing: 10,
                      children: kSemesterSelectors
                          .map<Widget>((selector) => RoundedSelectorBox(
                                selector: selector,
                                isActive: selector == _.selectedSemester,
                                onSelect: (selectedItem) {
                                  _.selectedSemester = selectedItem;
                                  _.selectedYear = null;
                                  _.selectedStage = null;
                                  _.update();
                                },
                              ))
                          .toList(),
                    ),
                    Visibility(
                      visible: _.selectedSemester != null,
                      child: Column(
                        children: [
                          Divider(
                            color: kSecondaryColor,
                            height: 50,
                            thickness: 1,
                            indent: 40,
                            endIndent: 40,
                          ),
                          Text("اختر المرحلة العمرية",
                              style: TextStyle(
                                  color: kGrayLightColor, fontSize: 12)),
                          SizedBox(
                            height: 15,
                          ),
                          Wrap(
                            alignment: WrapAlignment.center,
                            runSpacing: 15,
                            spacing: 10,
                            children: kStageSelectors
                                .map<Widget>((selector) => RoundedSelectorBox(
                                      selector: selector,
                                      isActive: selector == _.selectedStage,
                                      onSelect: (selectedItem) {
                                        _.selectedStage = selectedItem;
                                        _.selectedYear = null;
                                        _.update();
                                      },
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: _.selectedStage != null &&
                          kGradeSelectors[_.selectedStage?.value] != null,
                      child: Column(
                        children: [
                          Divider(
                            color: kSecondaryColor,
                            height: 50,
                            thickness: 1,
                            indent: 40,
                            endIndent: 40,
                          ),
                          Text("اختر السنة الدراسية",
                              style: TextStyle(
                                  color: kGrayLightColor, fontSize: 12)),
                          SizedBox(
                            height: 15,
                          ),
                          Wrap(
                            alignment: WrapAlignment.center,
                            runSpacing: 15,
                            spacing: 10,
                            children: kGradeSelectors[_.selectedStage?.value] !=
                                    null
                                ? kGradeSelectors[_.selectedStage?.value]!
                                    .map((selector) => RoundedSelectorBox(
                                          selector: selector,
                                          isActive: selector == _.selectedYear,
                                          onSelect: (selectedItem) {
                                            _.selectedYear = selectedItem;
                                            _.update();
                                          },
                                        ))
                                    .toList()
                                : [],
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: kGradeSelectors[_.selectedStage?.value] != null
                          ? _.selectedYear != null
                          : _.selectedStage != null,
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
                              label: "اسم الكتاب",
                              controller: _.bookNameInputController),
                          SizedBox(
                            height: 20,
                          ),
                          TextBox(
                              label: "سعر الغلاف",
                              controller: _.priceInputController,
                              keyboardType: TextInputType.number),
                          Divider(
                            color: kSecondaryColor,
                            height: 50,
                            thickness: 1,
                            indent: 40,
                            endIndent: 40,
                          ),
                          Row(
                            children: [
                              TakePhotoButton(
                                title: "التقاط صورة للكتاب",
                                onSelectingImages: (images) {
                                  FocusScope.of(context).unfocus();
                                },
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
                          ScanBarCodeButton(
                            onBarCodeScanned: (barcode) {
                              _.barcode = barcode;
                              _.update();
                              FocusScope.of(context).unfocus();
                            },
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          MainButton(
                              title: "اضافة",
                              onPressed: () {
                                _.addNewBook();
                              })
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
