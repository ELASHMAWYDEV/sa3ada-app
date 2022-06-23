// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sa3ada_app/utils/constants.dart';

class RoundedSelectorBox extends StatelessWidget {
  const RoundedSelectorBox({
    Key? key,
    required this.selector,
    required this.isActive,
    required this.onClick,
  }) : super(key: key);

  final String selector;
  final bool isActive;
  final VoidCallback onClick;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      style: TextButton.styleFrom(
          padding: EdgeInsets.all(5),
          backgroundColor: isActive ? kGreenColor : kSecondaryColor,
          fixedSize: Size(size.width * 0.25 - 20, size.width * 0.25 - 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
      child: Center(
        child: Text(
          selector,
          textAlign: TextAlign.center,
          // ignore: prefer_const_constructors
          style: TextStyle(
              height: 1.4, fontWeight: FontWeight.w600, color: kWhiteColor),
        ),
      ),
    );
  }
}
