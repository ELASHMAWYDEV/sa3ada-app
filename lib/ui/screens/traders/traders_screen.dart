// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/data/models/mini_table_model.dart';
import 'package:sa3ada_app/ui/components/balance_box.dart';
import 'package:sa3ada_app/ui/components/header.dart';
import 'package:sa3ada_app/ui/components/mini_table.dart';
import 'package:sa3ada_app/ui/components/select_box.dart';
import 'package:sa3ada_app/utils/constants.dart';
import 'package:sa3ada_app/utils/utils.dart';

class TradersScreen extends StatefulWidget {
  TradersScreen({Key? key}) : super(key: key);

  @override
  State<TradersScreen> createState() => _TradersScreenState();
}

class _TradersScreenState extends State<TradersScreen> {
  var items = [
    'الطلبة',
    'الدولية',
    'عيسي',
    'بكار',
    'بكار',
    'بكار',
    'بكار',
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Header(
          title: "التجار",
        ),
        SizedBox(
          height: size.height - 80,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                SelectBox(
                  items: items,
                  selectedItemIndex: selectedIndex,
                  onChange: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                BalanceBox(
                  balance: 127234,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: kRedColor),
                      child: Text("كمبيالة في 26/07/2024",
                          style: TextStyle(height: 1)),
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
                MiniTable(
                  title: "الفواتير الأخيرة",
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
                        title: "النوع", selector: (row) => row["type"]),
                    MiniTableModel(
                        title: "الكلى",
                        selector: (row) => row["total"] == null
                            ? ""
                            : numberToString(row["total"])),
                    MiniTableModel(
                        title: "المدفوع", selector: (row) => row["id"]),
                    MiniTableModel(
                        title: "المتبقى", selector: (row) => row["id"]),
                    MiniTableModel(
                        title: "التاريخ", selector: (row) => row["id"]),
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
                  title: "عمليات الايداع الأخيرة",
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
                        title: "طريقة الايداع", selector: (row) => row["type"]),
                    MiniTableModel(
                        title: "رقم الايصال", selector: (row) => row["id"]),
                    MiniTableModel(
                        title: "التاريخ", selector: (row) => row["id"]),
                  ],
                )
              ]),
            ),
          ),
        )
      ],
    ));
  }
}
