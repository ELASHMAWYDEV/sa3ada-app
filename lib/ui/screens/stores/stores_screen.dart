// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:sa3ada_app/data/firestore_models/account_model.dart'
    as account_model;
import 'package:sa3ada_app/data/firestore_models/invoice_model.dart';
import 'package:sa3ada_app/data/firestore_models/item_model.dart' as item_model;
import 'package:sa3ada_app/data/firestore_models/user_model.dart';
import 'package:sa3ada_app/data/models/mini_table_model.dart';
import 'package:sa3ada_app/ui/components/balance_box.dart';
import 'package:sa3ada_app/ui/components/floating_add_button.dart';
import 'package:sa3ada_app/ui/components/header.dart';
import 'package:sa3ada_app/ui/components/mini_table.dart';
import 'package:sa3ada_app/ui/components/select_box.dart';
import 'package:sa3ada_app/utils/constants.dart';
import 'package:sa3ada_app/utils/services/storage_service.dart';
import 'package:sa3ada_app/utils/utils.dart';

class StoresScreen extends StatefulWidget {
  const StoresScreen({Key? key}) : super(key: key);

  @override
  State<StoresScreen> createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> {
  account_model.AccountModel? selectedAccount;

  @override
  Widget build(BuildContext context) {
    print(selectedAccount?.id);
    return FirestoreBuilder<UserModelDocumentSnapshot>(
        ref: usersRef.doc(Get.find<StorageService>().userData?.id),
        builder: (context, snapshot, _) {
          if (snapshot.hasError)
            return Center(child: Text('error: ${snapshot.error}'));
          if (!snapshot.hasData)
            return Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(
                  color: kGreenColor,
                ),
              ),
            );
          final UserModel? user = snapshot.requireData.data != null
              ? UserModel.fromJson({
                  ...?snapshot.requireData.data?.toJson(),
                  "id": snapshot.requireData.id
                })
              : null;

          return FirestoreBuilder<account_model.AccountModelQuerySnapshot>(
              ref: account_model.accountsRef.whereType(isEqualTo: "store"),
              builder: (context, snapshot, _) {
                if (snapshot.hasError) return Text('error: ${snapshot.error}');
                if (!snapshot.hasData)
                  return CircularProgressIndicator(
                    color: kGreenColor,
                  );

                account_model.AccountModelQuerySnapshot querySnapshot =
                    snapshot.requireData;

                List<account_model.AccountModel> accounts = querySnapshot.docs
                    .map((e) => account_model.AccountModel.fromJson(
                        {...e.data.toJson(), "id": e.id}))
                    .toList();

                final List<account_model.AccountModel> filteredAccounts =
                    accounts
                        .where((element) => user!.stores.contains(element.id))
                        .toList();

                return Scaffold(
                    body: Column(
                  children: [
                    Header(
                      title: "المخازن",
                    ),
                    SizedBox(
                      height: size.height -
                          kToolbarHeight -
                          MediaQuery.of(context).padding.top,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Column(children: [
                            SizedBox(
                              height: 20,
                            ),
                            SelectBox(
                              title: "اختر المخزن",
                              items:
                                  filteredAccounts.map((e) => e.name).toList(),
                              selectedItemIndex: selectedAccount == null
                                  ? null
                                  : filteredAccounts.indexWhere((account) =>
                                      account.id == selectedAccount?.id),
                              onChange: (index) {
                                selectedAccount = filteredAccounts[index];
                                setState(() {});
                              },
                            ),
                            Visibility(
                              visible: selectedAccount != null,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 25,
                                  ),
                                  BalanceBox(
                                    title: "اجمالي البضاعة",
                                    balance: selectedAccount?.totalBalance ?? 0,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  BalanceBox(
                                    title: "الوارد كلي",
                                    balance:
                                        selectedAccount?.creditBalance?.abs() ??
                                            0,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Divider(
                                    color: kSecondaryColor,
                                    height: 50,
                                    thickness: 1,
                                    indent: 40,
                                    endIndent: 40,
                                  ),
                                  FirestoreBuilder<
                                          List<
                                              InvoiceModelQueryDocumentSnapshot>>(
                                      ref: invoicesRef.select((snapshot) {
                                    return snapshot.docs
                                        .where((element) =>
                                            element.data.to.id ==
                                            selectedAccount?.id)
                                        .toList();
                                  }), builder: (context, snapshot, _) {
                                    if (snapshot.hasError)
                                      return Text('error: ${snapshot.error}');
                                    if (!snapshot.hasData)
                                      return CircularProgressIndicator(
                                        color: kGreenColor,
                                      );

                                    List<InvoiceModel>? invoices = snapshot.data
                                        ?.map<InvoiceModel>((e) =>
                                            InvoiceModel.fromJson({
                                              ...e.data.toJson(),
                                              "id": e.id
                                            }))
                                        .toList();
                                    return MiniTable(
                                      title: "الوارد",
                                      onPressingAll: () {},
                                      data: invoices ?? [],
                                      columns: [
                                        MiniTableModel(
                                            title: "#",
                                            selector: (row) =>
                                                row.invoiceReference),
                                        MiniTableModel(
                                            title: "من",
                                            selector: (row) => row.from.name),
                                        MiniTableModel(
                                            title: "المبلغ",
                                            selector: (row) => numberToString(
                                                row.subTotal,
                                                includeMinimals: true)),
                                        MiniTableModel(
                                            title: "الوقت",
                                            selector: (row) =>
                                                DateFormat("d/M  HH:mm aa")
                                                    .format(row.createdAt)),
                                      ],
                                    );
                                  }),
                                  Divider(
                                    color: kSecondaryColor,
                                    height: 50,
                                    thickness: 1,
                                    indent: 40,
                                    endIndent: 40,
                                  ),
                                  FirestoreBuilder<
                                          List<
                                              InvoiceModelQueryDocumentSnapshot>>(
                                      ref: invoicesRef.select((snapshot) {
                                    return snapshot.docs
                                        .where((element) =>
                                            element.data.from.id ==
                                            selectedAccount?.id)
                                        .toList();
                                  }), builder: (context, snapshot, _) {
                                    if (snapshot.hasError)
                                      return Text('error: ${snapshot.error}');
                                    if (!snapshot.hasData)
                                      return CircularProgressIndicator(
                                        color: kGreenColor,
                                      );

                                    List<InvoiceModel>? invoices = snapshot.data
                                        ?.map<InvoiceModel>((e) =>
                                            InvoiceModel.fromJson({
                                              ...e.data.toJson(),
                                              "id": e.id
                                            }))
                                        .toList();
                                    return MiniTable(
                                      title: "المنصرف",
                                      onPressingAll: () {},
                                      data: invoices ?? [],
                                      columns: [
                                        MiniTableModel(
                                            title: "#",
                                            selector: (row) =>
                                                row.invoiceReference),
                                        MiniTableModel(
                                            title: "إلي",
                                            selector: (row) => row.from.name),
                                        MiniTableModel(
                                            title: "المبلغ",
                                            selector: (row) => numberToString(
                                                row.subTotal,
                                                includeMinimals: true)),
                                        MiniTableModel(
                                            title: "الوقت",
                                            selector: (row) =>
                                                DateFormat("d/M  HH:mm aa")
                                                    .format(row.createdAt)),
                                      ],
                                    );
                                  }),
                                  Divider(
                                    color: kSecondaryColor,
                                    height: 50,
                                    thickness: 1,
                                    indent: 40,
                                    endIndent: 40,
                                  ),
                                  FirestoreBuilder<
                                          account_model.ItemModelQuerySnapshot>(
                                      ref: account_model.accountsRef
                                          .doc(selectedAccount?.id)
                                          .accountItems,
                                      builder: (context, snapshot, _) {
                                        if (snapshot.hasError)
                                          return Text(
                                              'error: ${snapshot.error}');
                                        if (!snapshot.hasData)
                                          return CircularProgressIndicator(
                                            color: kGreenColor,
                                          );

                                        account_model.ItemModelQuerySnapshot
                                            querySnapshot =
                                            snapshot.requireData;
                                        return MiniTable(
                                          title: "الاصناف المتوفرة",
                                          onPressingAll: () {},
                                          data: querySnapshot.docs
                                              .map<item_model.ItemModel>(
                                                  (e) => e.data)
                                              .toList(),
                                          columns: [
                                            MiniTableModel(
                                                title: "الكود",
                                                selector: (row) =>
                                                    row.itemReference),
                                            MiniTableModel(
                                                title: "اسم الكتاب",
                                                selector: (row) =>
                                                    getBookFullName(row)),
                                            MiniTableModel(
                                                title: "الكمية",
                                                selector: (row) =>
                                                    row.quantity),
                                            MiniTableModel(
                                                title: "سعر البيع",
                                                selector: (row) =>
                                                    row.coverPrice),
                                          ],
                                        );
                                      })
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ),
                    )
                  ],
                ));
              });
        });
  }
}
