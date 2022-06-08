// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sa3ada_app/utils/constants.dart';
import 'package:sa3ada_app/utils/utils.dart';

class BalanceBox extends StatelessWidget {
  const BalanceBox({Key? key, required this.balance}) : super(key: key);

  final num balance;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: kSecondaryColor,
      ),
      child: Row(
        children: [
          Text(
            "الرصيد",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
          ),
          Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                numberToString(balance),
                style: TextStyle(
                    color: kGreenColor,
                    fontSize: 34,
                    fontFamily: "Cairo",
                    height: 1.2),
              ),
              Text(
                "جنيه",
                style: TextStyle(fontSize: 18, fontFamily: "Cairo"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
