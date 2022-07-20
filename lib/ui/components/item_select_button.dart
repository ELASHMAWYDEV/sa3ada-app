// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/data/firestore_models/account_model.dart'
    as account_model;
import 'package:sa3ada_app/data/firestore_models/item_model.dart' as item_model;
import 'package:sa3ada_app/data/models/selector_model.dart';
import 'package:sa3ada_app/ui/components/item_quantity_sheet.dart';
import 'package:sa3ada_app/ui/components/text_box.dart';
import 'package:sa3ada_app/ui/components/item_box.dart';
import 'package:sa3ada_app/ui/components/rounded_selector_box.dart';
import 'package:sa3ada_app/utils/constants.dart';

class ItemSelectButton extends StatefulWidget {
  const ItemSelectButton(
      {Key? key,
      required this.onSelect,
      required this.fromAccount,
      this.defaultSelectedQuantity})
      : super(key: key);

  final Function(item_model.ItemModel, int) onSelect;
  final account_model.AccountModel fromAccount;
  final int? defaultSelectedQuantity;
  @override
  State<ItemSelectButton> createState() => _ItemSelectButtonState();
}

class _ItemSelectButtonState extends State<ItemSelectButton> {
  final TextEditingController searchInputController = TextEditingController();

  SelectorModel? selectedStage;
  StateSetter? setModalState;

  @override
  void initState() {
    super.initState();
    searchInputController.addListener(() {
      if (setModalState != null) {
        setModalState!(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            Get.bottomSheet(StatefulBuilder(builder: (context, setModalState) {
              this.setModalState = setModalState;
              print(
                  "defaultSelectedQuantity .. ${widget.defaultSelectedQuantity}");
              return Container(
                  height: size.height * 0.8,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        sliver: SliverList(
                            delegate: SliverChildListDelegate([
                          SizedBox(
                            height: 20,
                          ),
                          Text("اختر المرحلة العمرية",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: kGrayLightColor, fontSize: 12)),
                          SizedBox(
                            height: 10,
                          ),
                          Wrap(
                            alignment: WrapAlignment.center,
                            runSpacing: 15,
                            spacing: 10,
                            children: kStageSelectors
                                .map((selector) => RoundedSelectorBox(
                                      selector: selector,
                                      isActive: selector == selectedStage,
                                      onSelect: (selectedItem) {
                                        if (selectedStage == selectedItem) {
                                          selectedStage = null;
                                        } else {
                                          selectedStage = selectedItem;
                                        }
                                        setModalState(() {});
                                      },
                                    ))
                                .toList(),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextBox(
                            label: "البحث عن صنف...",
                            controller: searchInputController,
                          ),
                          Divider(
                            color: kSecondaryColor,
                            height: 50,
                            thickness: 1,
                            indent: 40,
                            endIndent: 40,
                          ),
                          widget.fromAccount.type == "trader"
                              ? FirestoreBuilder<
                                      item_model.ItemModelQuerySnapshot>(
                                  ref: item_model.itemsRef
                                      .whereName(
                                          isGreaterThanOrEqualTo:
                                              searchInputController.text == ""
                                                  ? null
                                                  : searchInputController.text,
                                          isLessThanOrEqualTo: searchInputController.text == ""
                                              ? null
                                              : "${searchInputController.text}\uf8ff")
                                      .whereGrade(
                                          isEqualTo: selectedStage?.value == "other"
                                              ? "null"
                                              : null,
                                          whereIn: selectedStage == null || selectedStage?.value == "other"
                                              ? null
                                              : kGradeSelectors[selectedStage?.value]
                                                  ?.map((e) => e.value)
                                                  .toList()),
                                  builder: (context, snapshot, _) {
                                    if (snapshot.hasError)
                                      return Text('error: ${snapshot.error}');
                                    if (!snapshot.hasData)
                                      return CircularProgressIndicator(
                                        color: kGreenColor,
                                      );

                                    item_model.ItemModelQuerySnapshot
                                        querySnapshot = snapshot.requireData;

                                    return Column(
                                      children: List.generate(
                                          querySnapshot.docs.length, (index) {
                                        item_model.ItemModel item =
                                            item_model.ItemModel.fromJson({
                                          ...querySnapshot.docs[index].data
                                              .toJson(),
                                          "id": querySnapshot.docs[index].id,
                                          "quantity": 100000
                                        });

                                        return Padding(
                                          padding: EdgeInsets.only(bottom: 20),
                                          child: ItemBox(
                                            item: item,
                                            onPressed: (item) {
                                              Get.bottomSheet(ItemQuantitySheet(
                                                  defaultSelectedQuantity: widget
                                                      .defaultSelectedQuantity,
                                                  item: item,
                                                  onConfirm: (item, quantity) {
                                                    widget.onSelect(
                                                        item, quantity);
                                                    Get.back();
                                                  }));
                                            },
                                          ),
                                        );
                                      }),
                                    );
                                  })
                              : FirestoreBuilder<
                                      account_model.ItemModelQuerySnapshot>(
                                  ref: account_model.accountsRef
                                      .doc(widget.fromAccount.id)
                                      .accountItems
                                      .whereName(
                                          isGreaterThanOrEqualTo: searchInputController.text == "" ? null : searchInputController.text,
                                          isLessThanOrEqualTo: searchInputController.text == "" ? null : "${searchInputController.text}\uf8ff")
                                      .whereGrade(isEqualTo: selectedStage?.value == "other" ? "null" : null, whereIn: selectedStage == null || selectedStage?.value == "other" ? null : kGradeSelectors[selectedStage?.value]?.map((e) => e.value).toList()),
                                  builder: (context, snapshot, _) {
                                    if (snapshot.hasError)
                                      return Text('error: ${snapshot.error}');
                                    if (!snapshot.hasData)
                                      return CircularProgressIndicator(
                                        color: kGreenColor,
                                      );

                                    account_model.ItemModelQuerySnapshot
                                        querySnapshot = snapshot.requireData;

                                    return Column(
                                      children: List.generate(
                                          querySnapshot.docs.length, (index) {
                                        item_model.ItemModel item =
                                            item_model.ItemModel.fromJson({
                                          ...querySnapshot.docs[index].data
                                              .toJson(),
                                          "id": querySnapshot.docs[index].id
                                        });
                                        return Padding(
                                          padding: EdgeInsets.only(bottom: 20),
                                          child: ItemBox(
                                            item: item,
                                            onPressed: (item) {
                                              Get.bottomSheet(ItemQuantitySheet(
                                                  defaultSelectedQuantity: widget
                                                      .defaultSelectedQuantity,
                                                  item: item,
                                                  onConfirm: (item, quantity) {
                                                    widget.onSelect(
                                                        item, quantity);
                                                    Get.back();
                                                  }));
                                            },
                                          ),
                                        );
                                      }),
                                    );
                                  }),
                        ])),
                      ),
                    ],
                  ));
            }));
          },
          style: TextButton.styleFrom(
              backgroundColor: kSecondaryColor,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              fixedSize: Size(260, double.infinity),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "اختيار من الاصناف",
                style: TextStyle(color: kWhiteColor),
              ),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.search,
                color: kWhiteColor,
              )
            ],
          ),
        ),
      ],
    );
  }
}
