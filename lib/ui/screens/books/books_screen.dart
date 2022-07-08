// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/ui/components/header.dart';
import 'package:sa3ada_app/ui/components/rounded_selector_box.dart';
import 'package:sa3ada_app/ui/components/text_box.dart';
import 'package:sa3ada_app/ui/controllers/books_controller.dart';
import 'package:sa3ada_app/utils/constants.dart';

class BooksScreen extends StatelessWidget {
  BooksScreen({Key? key}) : super(key: key);

  final BooksController controller = Get.put(BooksController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BooksController>(builder: (_) {
      return Scaffold(
        body: Column(
          children: [
            Header(title: "الكتب"),
            SizedBox(
              height: size.height -
                  kToolbarHeight -
                  MediaQuery.of(context).padding.top,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(children: [
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: _.yearsSelectors
                          .map((selector) => RoundedSelectorBox(
                                selector: selector,
                                isActive: selector == _.selectedYear,
                                onClick: () {
                                  _.selectedYear = selector;
                                  _.update();
                                },
                              ))
                          .toList(),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextBox(
                        label: "البحث عن صنف...",
                        controller: _.searchInputController),
                    Divider(
                      color: kSecondaryColor,
                      height: 50,
                      thickness: 1,
                      indent: 40,
                      endIndent: 40,
                    ),
                    SizedBox(
                      height: size.height * 0.7,
                      child: ListView.builder(
                          padding: EdgeInsets.only(bottom: 120),
                          itemCount: 10,
                          itemBuilder: ((context, index) => Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                      backgroundColor: kWhiteColor,
                                      padding: EdgeInsets.all(12),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      textStyle: TextStyle(
                                          color: kSecondaryColor,
                                          fontFamily: kFontFamilyPrimary)),
                                  child: Row(children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "سلاح دراسات 4ب م1",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: kSecondaryColor),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "كود الصنف: ",
                                              style: TextStyle(
                                                  color: kSecondaryColor),
                                            ),
                                            Text(
                                              "294",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: kSecondaryColor),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "سعر البيع",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: kSecondaryColor),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              "50 ج",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: kSecondaryColor),
                                            ),
                                            Container(
                                              height: 1,
                                              width: 50,
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              decoration: BoxDecoration(
                                                  color: kSecondaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                            ),
                                            Text(
                                              "الكمية المتاحة",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: kSecondaryColor),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              "234",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: kSecondaryColor),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Container(
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: kSecondaryColor
                                                        .withOpacity(0.2),
                                                    offset: Offset(0, 3),
                                                    blurRadius: 10)
                                              ]),
                                          child: Image.network(
                                            "https://picsum.photos/300/300",
                                            width: 90,
                                            height: 90,
                                            fit: BoxFit.contain,
                                          ),
                                        )
                                      ],
                                    )
                                  ]),
                                ),
                              ))),
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
