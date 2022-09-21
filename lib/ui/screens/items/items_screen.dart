// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/data/firebase_services/auth_service.dart';
import 'package:sa3ada_app/data/firestore_models/item_model.dart';
import 'package:sa3ada_app/data/firestore_models/user_model.dart';
import 'package:sa3ada_app/data/models/mini_table_model.dart';
import 'package:sa3ada_app/ui/components/alert_prompt_box.dart';
import 'package:sa3ada_app/ui/components/floating_add_button.dart';
import 'package:sa3ada_app/ui/components/header.dart';
import 'package:sa3ada_app/ui/components/mini_table.dart';
import 'package:sa3ada_app/utils/constants.dart';
import 'package:sa3ada_app/utils/services/firebase.dart';
import 'package:sa3ada_app/utils/services/storage_service.dart';
import 'package:sa3ada_app/utils/utils.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

          return Scaffold(
            floatingActionButton: FloatingAddButton(options: [
              if (user!.permissions.contains("createItem")) ...[
                FloatingOptionButton(
                  title: "كتاب جديد",
                  onClick: () {
                    Get.toNamed("items/books/add");
                  },
                ),
                FloatingOptionButton(
                  title: "أدوات جديدة",
                  onClick: () {
                    AlertPromptBox.showSuccess(
                        message: "لم يتم اضافة هذه الخاصية بعد الي التطبيق",
                        title: "نعتذر");
                  },
                ),
              ] else
                ...[],
            ]),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.startFloat,
            body: Column(
              children: [
                Header(title: "الأصناف"),
                SizedBox(
                  height: size.height -
                      kToolbarHeight -
                      MediaQuery.of(context).padding.top,
                  child: SingleChildScrollView(
                      child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        FirestoreBuilder<ItemModelQuerySnapshot>(
                            ref: itemsRef.orderByName(),
                            builder: (context, snapshot, _) {
                              if (snapshot.hasError)
                                return Text('error: ${snapshot.error}');
                              if (!snapshot.hasData)
                                return CircularProgressIndicator(
                                  color: kGreenColor,
                                );
                              ItemModelQuerySnapshot querySnapshot =
                                  snapshot.requireData;
                              return MiniTable(
                                title: "الكتب",
                                onPressingAll: () {
                                  Get.toNamed("/items/books");
                                },
                                data: querySnapshot.docs
                                    .map<ItemModel>((e) => e.data)
                                    .toList(),
                                columns: [
                                  MiniTableModel(
                                      title: "الكود",
                                      selector: (row) => row.itemReference),
                                  MiniTableModel(
                                      title: "اسم الكتاب",
                                      selector: (row) => getBookFullName(row)),
                                  MiniTableModel(
                                      title: "سعر البيع",
                                      selector: (row) =>
                                          "${numberToString(row.coverPrice, includeMinimals: true)} ج"),
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
                        MiniTable(
                          title: "الأدوات",
                          onPressingAll: () {},
                          data: [],
                          columns: [
                            MiniTableModel(
                                title: "#", selector: (row) => row["id"]),
                            MiniTableModel(
                                title: "المبلغ",
                                selector: (row) => row["total"] == null
                                    ? ""
                                    : numberToString(row["total"])),
                            MiniTableModel(
                                title: "طريقة الايداع",
                                selector: (row) => row["type"]),
                            MiniTableModel(
                                title: "رقم الايصال",
                                selector: (row) => row["id"]),
                            MiniTableModel(
                                title: "التاريخ", selector: (row) => row["id"]),
                          ],
                        )
                      ],
                    ),
                  )),
                ),
              ],
            ),
          );
        });
  }
}
