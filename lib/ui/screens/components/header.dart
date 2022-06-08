// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/utils/constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text("التجار"),
      titleTextStyle: TextStyle(
          fontWeight: FontWeight.w600, fontFamily: "Tajawal", fontSize: 22),
      backgroundColor: kSecondaryColor,
      leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.arrow_back_ios),
          )),
    );
  }
}
