// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sa3ada_app/data/firestore_models/item_model.dart';
import 'package:sa3ada_app/utils/constants.dart';
import 'package:sa3ada_app/utils/utils.dart';

class ItemBox extends StatelessWidget {
  const ItemBox({Key? key, required this.item, required this.onPressed})
      : super(key: key);

  final ItemModel item;
  final Function(ItemModel) onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed(item);
      },
      style: TextButton.styleFrom(
          backgroundColor: kWhiteColor,
          padding: EdgeInsets.all(12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          textStyle: TextStyle(
              color: kSecondaryColor, fontFamily: kFontFamilyPrimary)),
      child: Row(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getBookFullName(item),
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: kSecondaryColor),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "كود الصنف: ",
                  style: TextStyle(color: kSecondaryColor),
                ),
                Text(
                  "${item.itemReference}",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: kSecondaryColor),
                ),
              ],
            )
          ],
        ),
        Spacer(),
        Row(
          children: [
            Column(
              children: [
                Text(
                  "سعر البيع",
                  style: TextStyle(fontSize: 10, color: kSecondaryColor),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "${item.coverPrice} ج",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: kSecondaryColor),
                ),
                Container(
                  height: 1,
                  width: 50,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(5)),
                ),
                Text(
                  "الكمية المتاحة",
                  style: TextStyle(fontSize: 10, color: kSecondaryColor),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "${item.quantity ?? 0}",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: kSecondaryColor),
                ),
              ],
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                        color: kSecondaryColor.withOpacity(0.2),
                        offset: Offset(0, 3),
                        blurRadius: 10)
                  ]),
              child: Image.network(
                "https://picsum.photos/300/300",
                width: 90,
                height: 90,
                fit: BoxFit.contain,
              ),
            )
          ],
        )
      ]),
    );
  }
}
