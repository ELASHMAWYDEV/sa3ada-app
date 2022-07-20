// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/utils/constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.title,
    this.icon = Icons.arrow_back_ios,
    this.onIconPressed,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback? onIconPressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title),
      titleTextStyle: TextStyle(
          fontWeight: FontWeight.w600, fontFamily: "Tajawal", fontSize: 22),
      backgroundColor: kSecondaryColor,
      leading: InkWell(
          onTap: () {
            if (onIconPressed == null) {
              Get.back();
            } else {
              onIconPressed!();
            }
          },
          borderRadius: BorderRadius.circular(100),
          child: Icon(icon)),
    );
  }
}
