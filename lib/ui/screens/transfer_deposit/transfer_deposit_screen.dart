// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/data/firestore_models/account_model.dart';
import 'package:sa3ada_app/data/firestore_models/deposit_model.dart';
import 'package:sa3ada_app/data/firestore_models/transaction_model.dart';
import 'package:sa3ada_app/ui/components/alert_prompt_box.dart';
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
      return WillPopScope(
        onWillPop: () async {
          AlertPromptBox.showPrompt(
              message: "لن يتم تسجيل الايداع ، هل تريد الخروج فعلا ؟",
              title: "تحذير",
              onSuccess: () async {
                Get.delete<TransferDepositController>();
                Get.back();
              });
          return false;
        },
        child: Scaffold(
          body: Container(
            child: SingleChildScrollView(
              child: Column(children: [
                Header(title: "ايداع / تحويل", icon: Icons.close),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      Text("اختر نوع المحول منه",
                          style:
                              TextStyle(color: kGrayLightColor, fontSize: 12)),
                      SizedBox(
                        height: 15,
                      ),
                      Wrap(
                        alignment: WrapAlignment.center,
                        runSpacing: 15,
                        spacing: 15,
                        children: _.selectors
                            .map((selector) => RoundedSelectorBox(
                                  selector: selector.keys.toList()[0],
                                  isActive: selector.keys.toList()[0] ==
                                      _.selectedFrom,
                                  onSelect: (selectedItem) {
                                    _.selectedSubFrom = null;
                                    _.selectedSubTo = null;
                                    _.selectedTo = null;
                                    if (_.selectedFrom == selectedItem) {
                                      _.selectedFrom = null;
                                    } else {
                                      _.selectedFrom = selectedItem;
                                    }
                                    _.update();
                                  },
                                ))
                            .toList(),
                      ),
                      Visibility(
                          visible: ["trader", "branch"]
                              .contains(_.selectedFrom?.value),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              FirestoreBuilder<AccountModelQuerySnapshot>(
                                  ref: accountsRef.whereType(
                                      isEqualTo: _.selectedFrom?.value),
                                  builder: (context, snapshot, __) {
                                    if (snapshot.hasError)
                                      return Text('error: ${snapshot.error}');
                                    if (!snapshot.hasData)
                                      return CircularProgressIndicator(
                                        color: kGreenColor,
                                      );

                                    AccountModelQuerySnapshot querySnapshot =
                                        snapshot.requireData;

                                    if (querySnapshot.docs.isEmpty)
                                      return Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Text(
                                            "لا يوجد نتائج لكي تختار منها"),
                                      );

                                    List<AccountModel> accounts = querySnapshot
                                        .docs
                                        .map((e) => AccountModel.fromJson(
                                            {...e.data.toJson(), "id": e.id}))
                                        .toList();
                                    return SelectBox(
                                      items:
                                          accounts.map((e) => e.name).toList(),
                                      selectedItemIndex:
                                          _.selectedSubFrom == null
                                              ? null
                                              : accounts.indexWhere((account) =>
                                                  account.id ==
                                                  _.selectedSubFrom?.id),
                                      onChange: (index) {
                                        _.selectedSubFrom = accounts[index];
                                        _.update();
                                      },
                                    );
                                  })
                            ],
                          )),
                      if (_.selectedFrom != null && _.selectedSubFrom != null ||
                          _.selectedFrom?.value == "bankAccount")
                        Visibility(
                            visible: (_.selectedFrom != null &&
                                    ["branch", "trader"]
                                        .contains(_.selectedFrom?.value) &&
                                    _.selectedSubFrom != null) ||
                                _.selectedFrom?.value == "bankAccount",
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
                                Wrap(
                                  alignment: WrapAlignment.center,
                                  runSpacing: 15,
                                  spacing: 15,
                                  children: _.selectors
                                      .where((element) =>
                                          element.keys.toList()[0] ==
                                          _.selectedFrom)
                                      .toList()[0]
                                      .values
                                      .toList()[0]
                                      .map((selector) => RoundedSelectorBox(
                                            selector: selector,
                                            isActive: selector == _.selectedTo,
                                            onSelect: (selectedItem) {
                                              _.selectedSubTo = null;
                                              _.selectedTo = null;
                                              if (_.selectedTo ==
                                                  selectedItem) {
                                                _.selectedTo = null;
                                              } else {
                                                _.selectedTo = selectedItem;
                                              }
                                              _.update();
                                            },
                                          ))
                                      .toList(),
                                ),
                                Visibility(
                                    visible: ["trader", "branch"]
                                        .contains(_.selectedTo?.value),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        FirestoreBuilder<
                                                AccountModelQuerySnapshot>(
                                            ref: accountsRef.whereType(
                                                isEqualTo: _.selectedTo?.value),
                                            builder: (context, snapshot, __) {
                                              if (snapshot.hasError)
                                                return Text(
                                                    'error: ${snapshot.error}');
                                              if (!snapshot.hasData)
                                                return CircularProgressIndicator(
                                                  color: kGreenColor,
                                                );

                                              AccountModelQuerySnapshot
                                                  querySnapshot =
                                                  snapshot.requireData;

                                              if (querySnapshot.docs.isEmpty)
                                                return Padding(
                                                  padding: const EdgeInsets.all(
                                                      20.0),
                                                  child: Text(
                                                      "لا يوجد نتائج لكي تختار منها"),
                                                );

                                              List<AccountModel> accounts =
                                                  querySnapshot.docs
                                                      .map((e) => AccountModel
                                                              .fromJson({
                                                            ...e.data.toJson(),
                                                            "id": e.id
                                                          }))
                                                      .toList();
                                              return SelectBox(
                                                items: accounts
                                                    .map((e) => e.name)
                                                    .toList(),
                                                selectedItemIndex:
                                                    _.selectedSubTo == null
                                                        ? null
                                                        : accounts.indexWhere(
                                                            (account) =>
                                                                account.id ==
                                                                _.selectedSubTo
                                                                    ?.id),
                                                onChange: (index) {
                                                  _.selectedSubTo =
                                                      accounts[index];
                                                  _.update();
                                                },
                                              );
                                            }),
                                      ],
                                    )),
                                Visibility(
                                    visible: (_.selectedTo != null &&
                                            [
                                              "branch",
                                              "trader"
                                            ].contains(_.selectedTo?.value) &&
                                            _.selectedSubTo != null) ||
                                        _.selectedTo?.value == "bankAccount",
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
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
                                        TextButton(
                                            onPressed: () async {
                                              _.depositDate =
                                                  await showDatePicker(
                                                          context: context,
                                                          initialDate:
                                                              _.depositDate ??
                                                                  DateTime
                                                                      .now(),
                                                          firstDate:
                                                              DateTime(2020),
                                                          lastDate:
                                                              DateTime.now()) ??
                                                      DateTime.now();
                                              _.update();
                                            },
                                            style: TextButton.styleFrom(
                                                backgroundColor:
                                                    kSecondaryColor,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 40,
                                                    vertical: 8),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4))),
                                            child: Text(
                                              _.depositDate == null
                                                  ? "اختر التاريخ"
                                                  : "${_.depositDate?.day}/${_.depositDate?.month}/${_.depositDate?.year}",
                                              style:
                                                  TextStyle(color: kWhiteColor),
                                            )),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Visibility(
                                          visible: _.selectedSubFrom != null &&
                                              _.selectedSubTo != null &&
                                              _.depositDate != null &&
                                              double.tryParse(_
                                                      .amountInputController
                                                      .text) !=
                                                  null,
                                          child: MainButton(
                                            title: "اضافة",
                                            onPressed: () async {
                                              AlertPromptBox.showPrompt(
                                                  message:
                                                      "هل انت متأكد انك تريد عمل ايداع من ${_.selectedSubFrom?.name} الي ${_.selectedSubTo?.name}\nبقيمة ${_.amountInputController.text}",
                                                  title: "تأكيد",
                                                  onSuccess: () async {
                                                    await depositsRef.add(DepositModel(
                                                        from:
                                                            _.selectedSubFrom!,
                                                        to: _.selectedSubTo!,
                                                        amount: double.tryParse(_
                                                                .amountInputController
                                                                .text)!
                                                            .toDouble(),
                                                        note: _
                                                            .noteInputController
                                                            .text,
                                                        createdAt:
                                                            DateTime.now(),
                                                        depositDate:
                                                            _.depositDate!,
                                                        status: "pending"));
                                                    AlertPromptBox.showSuccess(
                                                        message:
                                                            "تم عمل الايداع بنجاح",
                                                        onDismiss: () {
                                                          Get.offAndToNamed(
                                                              "/home");
                                                        });
                                                  });
                                            },
                                          ),
                                        ),
                                      ],
                                    ))
                              ],
                            ))
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      );
    });
  }
}
