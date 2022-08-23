// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:sa3ada_app/data/models/mini_table_model.dart';
import 'package:sa3ada_app/utils/constants.dart';

const TextStyle tableTitleStyle = TextStyle(
    fontSize: 12, color: kSecondaryColor, fontWeight: FontWeight.w600);
const TextStyle tableItemStyle = TextStyle(
    fontSize: 10,
    color: kSecondaryColor,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.visible);

class MiniTable extends StatelessWidget {
  const MiniTable({
    Key? key,
    required this.columns,
    required this.data,
    this.title,
    required this.onPressingAll,
    this.onCellPressed,
    this.listAll = false,
    this.columnWidths,
  }) : super(key: key);

  final List<MiniTableModel> columns;
  final List<dynamic> data;
  final String? title;
  final VoidCallback onPressingAll;
  final Function(dynamic)? onCellPressed;
  final bool listAll;
  final Map<int, TableColumnWidth>? columnWidths;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: title != null,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title ?? "",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: kWhiteColor),
              ),
              Spacer(),
              Visibility(
                visible: !listAll,
                child: TextButton(
                    onPressed: onPressingAll,
                    style: TextButton.styleFrom(
                        backgroundColor: kSecondaryColor,
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    child: Text(
                      "عرض الكل",
                      style: TextStyle(color: kWhiteColor, fontSize: 12),
                    )),
              )
            ],
          ),
        ),
        SizedBox(height: 15),
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Table(
                columnWidths: columnWidths,
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
                    maxHeight: listAll ? double.infinity : 250,
                    minHeight: double.minPositive),
                child: SingleChildScrollView(
                  child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    columnWidths: columnWidths,
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
                                          GestureDetector(
                                            onTap: () {
                                              print(index);
                                              if (onCellPressed != null) {
                                                onCellPressed!(row);
                                              }
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  index == columns.length + 1
                                                      ? 20
                                                      : column.cell == null
                                                          ? 40
                                                          : 20,
                                                  12,
                                                  index == 0 ? 15 : 0,
                                                  12),
                                              child: column.cell != null
                                                  ? column.cell!(column
                                                              .selector ==
                                                          null
                                                      ? row[column.title] ?? ""
                                                      : column.selector!(row) ??
                                                          "")
                                                  : Text(
                                                      column.selector == null
                                                          ? row[column.title]
                                                              .toString()
                                                          : column.selector!
                                                                  (row)
                                                              .toString(),
                                                      // maxLines: 1,
                                                      style: tableItemStyle,
                                                    ),
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
