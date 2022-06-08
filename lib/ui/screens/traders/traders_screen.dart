// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/data/models/mini_table_model.dart';
import 'package:sa3ada_app/ui/screens/components/balance_box.dart';
import 'package:sa3ada_app/ui/screens/components/header.dart';
import 'package:sa3ada_app/ui/screens/components/mini_table.dart';
import 'package:sa3ada_app/utils/constants.dart';
import 'package:sa3ada_app/utils/utils.dart';

class TradersScreen extends StatelessWidget {
  TradersScreen({Key? key}) : super(key: key);

  var items = [
    'الطلبة',
    'الدولية',
    'عيسي',
    'بكار',
    'بكار',
    'بكار',
    'بكار',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Header(),
        SizedBox(
          height: size.height - 80,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    SizedBox(
                      width: size.width * 0.8,
                      child: TextButton(
                          onPressed: () {
                            Get.bottomSheet(Container(
                              height: 350,
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                              decoration: BoxDecoration(
                                  color: kWhiteColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30))),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Container(
                                            width: 25,
                                            height: 25,
                                            decoration: BoxDecoration(
                                                color: kSecondaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: Icon(
                                              Icons.close,
                                              color: kWhiteColor,
                                              size: 20,
                                            )),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                        itemCount: items.length,
                                        padding: EdgeInsets.only(bottom: 20),
                                        itemBuilder: (BuildContext context,
                                                int index) =>
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 7.0),
                                              child: TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                style: TextButton.styleFrom(
                                                    backgroundColor: index == 0
                                                        ? kPrimaryColor
                                                        : kWhiteColor,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 40,
                                                            vertical: 15),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4))),
                                                child: Text(items[index],
                                                    style: TextStyle(
                                                        color: index == 0
                                                            ? kWhiteColor
                                                            : kSecondaryColor,
                                                        fontSize: 18)),
                                              ),
                                            )),
                                  )
                                ],
                              ),
                            ));
                          },
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 60)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100))),
                              backgroundColor:
                                  MaterialStateProperty.all(kWhiteColor)),
                          child: Text(
                            items[0],
                            style: TextStyle(
                                color: kSecondaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          )),
                    ),
                    Positioned(
                      left: 15,
                      top: 4,
                      child: Icon(
                        Icons.arrow_drop_down_sharp,
                        color: kSecondaryColor,
                        size: 40,
                      ),
                    ),
                  ],
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
                )
              ]),
            ),
          ),
        )
      ],
    ));
  }
}
