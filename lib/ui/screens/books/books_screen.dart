// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/data/firestore_models/item_model.dart';
import 'package:sa3ada_app/ui/components/header.dart';
import 'package:sa3ada_app/ui/components/item_box.dart';
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
        resizeToAvoidBottomInset: false,
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
                    Wrap(
                      alignment: WrapAlignment.center,
                      runSpacing: 15,
                      spacing: 10,
                      children: kStageSelectors
                          .map((selector) => RoundedSelectorBox(
                                selector: selector,
                                isActive: selector == _.selectedStage,
                                onSelect: (selectedItem) {
                                  if (_.selectedStage == selectedItem) {
                                    _.selectedStage = null;
                                  } else {
                                    _.selectedStage = selectedItem;
                                  }
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
                      child: FirestoreBuilder<ItemModelQuerySnapshot>(
                          ref: itemsRef
                              .whereName(
                                  isGreaterThanOrEqualTo:
                                      _.searchInputController.text == ""
                                          ? null
                                          : _.searchInputController.text,
                                  isLessThanOrEqualTo: _
                                              .searchInputController.text ==
                                          ""
                                      ? null
                                      : "${_.searchInputController.text}\uf8ff")
                              .whereGrade(
                                  isEqualTo: _.selectedStage?.value == "other"
                                      ? "null"
                                      : null,
                                  whereIn: _.selectedStage == null ||
                                          _.selectedStage?.value == "other"
                                      ? null
                                      : kGradeSelectors[_.selectedStage?.value]
                                          ?.map((e) => e.value)
                                          .toList()),
                          builder: (context, snapshot, _) {
                            if (snapshot.hasError)
                              return Text('error: ${snapshot.error}');
                            if (!snapshot.hasData)
                              return CircularProgressIndicator(
                                color: kGreenColor,
                              );

                            ItemModelQuerySnapshot querySnapshot =
                                snapshot.requireData;

                            return ListView.builder(
                                padding: EdgeInsets.only(bottom: 120),
                                itemCount: querySnapshot.docs.length,
                                itemBuilder: ((context, index) {
                                  ItemModel item =
                                      querySnapshot.docs[index].data;
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 20),
                                    child: ItemBox(
                                      item: item,
                                      quantity: 29,
                                    ),
                                  );
                                }));
                          }),
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
