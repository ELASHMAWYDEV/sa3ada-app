// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/data/firestore_models/account_model.dart';
import 'package:sa3ada_app/data/models/selector_model.dart';
import 'package:sa3ada_app/ui/components/main_button.dart';
import 'package:sa3ada_app/ui/components/rounded_selector_box.dart';
import 'package:sa3ada_app/ui/components/select_box.dart';
import 'package:sa3ada_app/utils/constants.dart';

class NewInvoiceModal extends StatefulWidget {
  const NewInvoiceModal({Key? key}) : super(key: key);

  @override
  State<NewInvoiceModal> createState() => _NewInvoiceModalState();
}

class _NewInvoiceModalState extends State<NewInvoiceModal> {
  final List<SelectorModel> selectorsFrom = [
    SelectorModel(label: "فرع", value: "branch"),
    SelectorModel(label: "مخزن", value: "store"),
    SelectorModel(label: "تاجر", value: "trader"),
  ];
  final List<SelectorModel> selectorsTo = [
    SelectorModel(label: "عميل", value: "client"),
    SelectorModel(label: "زبون", value: "customer"),
    SelectorModel(label: "مخزن", value: "store"),
    SelectorModel(label: "فرع", value: "branch"),
  ];

  SelectorModel? selectedFrom;
  AccountModel? selectedSubFrom;
  SelectorModel? selectedTo;
  AccountModel? selectedSubTo;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: kSecondaryColor,
      child: FittedBox(
          child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        width: size.width * 0.9,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: <BoxShadow>[
              BoxShadow(blurRadius: 2, color: kSecondaryColor.withOpacity(0.5))
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
                "فاتورة جديدة",
                style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text("من",
              style: TextStyle(
                fontSize: 14,
                color: kSecondaryColor,
              )),
          SizedBox(
            height: 15,
          ),
          Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 15,
            spacing: 30,
            children: selectorsFrom
                .map((selector) => RoundedSelectorBox(
                      selector: selector,
                      isActive: selector == selectedFrom,
                      onSelect: (selectedItem) {
                        selectedSubFrom = null;
                        selectedSubTo = null;
                        selectedTo = null;
                        if (selectedFrom == selectedItem) {
                          selectedFrom = null;
                        } else {
                          selectedFrom = selectedItem;
                        }
                        setState(() {});
                      },
                    ))
                .toList(),
          ),
          Visibility(
              visible: selectedFrom != null,
              child: FirestoreBuilder<AccountModelQuerySnapshot>(
                  ref: accountsRef.whereType(isEqualTo: selectedFrom?.value),
                  builder: (context, snapshot, _) {
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
                        child: Text("لا يوجد نتائج لكي تختار منها"),
                      );

                    List<AccountModel> accounts = querySnapshot.docs
                        .map((e) => AccountModel.fromJson(
                            {...e.data.toJson(), "id": e.id}))
                        .toList();

                    return Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: SelectBox(
                              items: accounts.map((e) => e.name).toList(),
                              selectedItemIndex: selectedSubFrom == null
                                  ? null
                                  : accounts.indexWhere((account) =>
                                      account.id == selectedSubFrom?.id),
                              onChange: (index) {
                                selectedSubFrom = accounts[index];
                                setState(() {});
                              },
                              backgroundColor: kSecondaryColor,
                              textColor: kWhiteColor),
                        ),
                      ],
                    );
                  })),
          Visibility(
            visible: selectedFrom != null && selectedSubFrom != null,
            child: Column(
              children: [
                Divider(
                  color: kSecondaryColor,
                  height: 50,
                  thickness: 1,
                  indent: 40,
                  endIndent: 40,
                ),
                Text("الى",
                    style: TextStyle(
                      fontSize: 14,
                      color: kSecondaryColor,
                    )),
                SizedBox(
                  height: 15,
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  runSpacing: 15,
                  spacing: 30,
                  children: selectorsTo
                      .map((selector) => RoundedSelectorBox(
                            selector: selector,
                            isActive: selector == selectedTo,
                            onSelect: (selectedItem) {
                              selectedSubTo = null;
                              if (selectedTo == selectedItem) {
                                selectedTo = null;
                              } else {
                                selectedTo = selectedItem;
                              }
                              setState(() {});
                            },
                          ))
                      .toList(),
                ),
                Visibility(
                    visible: selectedTo != null,
                    child: FirestoreBuilder<AccountModelQuerySnapshot>(
                        ref:
                            accountsRef.whereType(isEqualTo: selectedTo?.value),
                        builder: (context, snapshot, _) {
                          if (snapshot.hasError)
                            return Text('error: ${snapshot.error}');
                          if (!snapshot.hasData)
                            return CircularProgressIndicator(
                              color: kGreenColor,
                            );

                          AccountModelQuerySnapshot querySnapshot =
                              snapshot.requireData;

                          if (querySnapshot.docs.isEmpty)
                            return Text("لا يوجد نتائج لكي تختار منها");

                          List<AccountModel> accounts = querySnapshot.docs
                              .map((e) => AccountModel.fromJson(
                                  {...e.data.toJson(), "id": e.id}))
                              .toList();

                          return Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: SelectBox(
                                    items: accounts.map((e) => e.name).toList(),
                                    selectedItemIndex: selectedSubTo == null
                                        ? null
                                        : accounts.indexWhere((account) =>
                                            account.id == selectedSubTo?.id),
                                    onChange: (index) {
                                      selectedSubTo = accounts[index];
                                      setState(() {});
                                    },
                                    backgroundColor: kSecondaryColor,
                                    textColor: kWhiteColor),
                              ),
                            ],
                          );
                        })),
                SizedBox(
                  height: 40,
                ),
                Visibility(
                    visible: selectedTo != null &&
                        selectedFrom != null &&
                        selectedSubFrom != null &&
                        selectedSubTo != null,
                    child: MainButton(
                        title: "التالى",
                        onPressed: () {
                          Get.toNamed("/invoices/add", arguments: {
                            "from": selectedFrom,
                            "to": selectedTo,
                            "subFrom": selectedSubFrom,
                            "subTo": selectedSubTo,
                          });
                        }))
              ],
            ),
          ),
        ]),
      )),
    );
  }
}
