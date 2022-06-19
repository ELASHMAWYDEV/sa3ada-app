// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:sa3ada_app/utils/constants.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      this.backgroundColor})
      : super(key: key);

  final String title;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: 10 , horizontal: 80)),
          backgroundColor:
              MaterialStateProperty.all(backgroundColor ?? kGreenColor),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)))),
      child: Text(
        title,
        style: TextStyle(
            color: kWhiteColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            height: 1.4),
      ),
    );
  }
}
