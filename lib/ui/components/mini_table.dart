// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sa3ada_app/data/models/mini_table_model.dart';
import 'package:sa3ada_app/utils/constants.dart';

const TextStyle tableTitleStyle = TextStyle(
    fontSize: 12, color: kSecondaryColor, fontWeight: FontWeight.w600);
const TextStyle tableItemStyle = TextStyle(
    fontSize: 10,
    color: kSecondaryColor,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis);

class MiniTable extends StatelessWidget {
  const MiniTable({
    Key? key,
    required this.columns,
    required this.data,
    required this.title,
  }) : super(key: key);

  final List<MiniTableModel> columns;
  final List<dynamic> data;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            Spacer(),
            TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: kSecondaryColor,
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                child: Text(
                  "عرض الكل",
                  style: TextStyle(color: kWhiteColor, fontSize: 12),
                ))
          ],
        ),
        SizedBox(height: 15),
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: kWhiteColor, borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              Table(
                children: [
                  TableRow(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        width: 1,
                        color: kSecondaryColor,
                      ))),
                      children: columns
                          .asMap()
                          .map((index, column) => MapEntry(
                                index,
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      index == columns.length + 1 ? 20 : 0,
                                      14,
                                      index == 0 ? 15 : 0,
                                      14),
                                  child: Text(
                                    column.title,
                                    style: tableTitleStyle,
                                  ),
                                ),
                              ))
                          .values
                          .toList()),
                ],
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: 250, minHeight: double.minPositive),
                child: SingleChildScrollView(
                  child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      ...data
                          .asMap()
                          .map((index, row) => MapEntry(
                              index,
                              TableRow(
                                  decoration: BoxDecoration(
                                      color: index % 2 == 0
                                          ? kGrayLightColor.withOpacity(0.4)
                                          : kWhiteColor),
                                  children: columns
                                      .asMap()
                                      .map((index, column) => MapEntry(
                                          index,
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                index == columns.length + 1
                                                    ? 20
                                                    : 40,
                                                12,
                                                index == columns.length + 1
                                                    ? 0
                                                    : 15,
                                                12),
                                            child: Text(
                                              column.selector == null
                                                  ? row[column.title] ?? ""
                                                  : column.selector!(row) ?? "",
                                              maxLines: 1,
                                              style: tableItemStyle,
                                            ),
                                          )))
                                      .values
                                      .toList())))
                          .values
                          .toList()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
