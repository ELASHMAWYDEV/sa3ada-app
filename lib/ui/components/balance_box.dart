// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sa3ada_app/utils/constants.dart';
import 'package:sa3ada_app/utils/utils.dart';

class BalanceBox extends StatelessWidget {
  const BalanceBox({
    Key? key,
    required this.balance,
    this.title = "الرصيد",
    this.subTitle = "جنيه",
    this.balanceColor = kGreenColor,
  }) : super(key: key);

  final num balance;
  final String title;
  final String subTitle;
  final Color balanceColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: kSecondaryColor,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          child: Wrap(
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            spacing: 0,
            runSpacing: 0,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                    color: kWhiteColor),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    numberToString(balance),
                    style: TextStyle(
                        color: balanceColor,
                        fontSize: 34,
                        fontFamily: "Cairo",
                        height: 1.2),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(
                        fontSize: 18, fontFamily: "Cairo", color: kWhiteColor),
                  ),
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
