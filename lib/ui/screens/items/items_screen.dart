// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/data/models/mini_table_model.dart';
import 'package:sa3ada_app/ui/components/header.dart';
import 'package:sa3ada_app/ui/components/mini_table.dart';
import 'package:sa3ada_app/utils/constants.dart';
import 'package:sa3ada_app/utils/utils.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  MiniTable(
                    title: "الكتب",
                    onPressingAll: () {
                      Get.toNamed("/items/books");
                    },
                    data: [
                      {
                        "customCode": "434",
                        "name": "سلاح عربي ٤ب م١",
                        "quantity": 124,
                        "price": {"retail": 50}
                      },
                      {
                        "customCode": "434",
                        "name": "سلاح عربي ٤ب م١",
                        "quantity": 124,
                        "price": {"retail": 50}
                      },
                      {
                        "customCode": "434",
                        "name": "سلاح عربي ٤ب م١",
                        "quantity": 124,
                        "price": {"retail": 50}
                      },
                      {
                        "customCode": "434",
                        "name": "سلاح عربي ٤ب م١",
                        "quantity": 124,
                        "price": {"retail": 50}
                      },
                      {
                        "customCode": "434",
                        "name": "سلاح عربي ٤ب م١",
                        "quantity": 124,
                        "price": {"retail": 50}
                      },
                    ],
                    columns: [
                      MiniTableModel(
                          title: "الكود", selector: (row) => row["customCode"]),
                      MiniTableModel(
                          title: "اسم الكتاب", selector: (row) => row["name"]),
                      MiniTableModel(
                          title: "الكمية",
                          selector: (row) => row["quantity"] == null
                              ? ""
                              : numberToString(row["quantity"])),
                      MiniTableModel(
                          title: "سعر البيع",
                          selector: (row) => numberToString(
                              row["price"]["retail"],
                              includeMinimals: true)),
                    ],
                  ),
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
                    data: [
                      {"id": "1", "type": "نقدي", "total": 198235},
                      {"id": "2"},
                      {"id": "3"},
                      {"id": "4"},
                      {"id": "5"},
                      {"id": "6"},
                    ],
                    columns: [
                      MiniTableModel(title: "#", selector: (row) => row["id"]),
                      MiniTableModel(
                          title: "المبلغ",
                          selector: (row) => row["total"] == null
                              ? ""
                              : numberToString(row["total"])),
                      MiniTableModel(
                          title: "طريقة الايداع",
                          selector: (row) => row["type"]),
                      MiniTableModel(
                          title: "رقم الايصال", selector: (row) => row["id"]),
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
  }
}
