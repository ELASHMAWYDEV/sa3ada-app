// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sa3ada_app/utils/constants.dart';

class TextBox extends StatelessWidget {
  const TextBox(
      {Key? key,
      required this.label,
      required this.controller,
      this.keyboardType,
      this.isLarge = false,
      this.isEditable = true,
      this.fillColor = kWhiteColor,
      this.hintColor = kGrayLightColor})
      : super(key: key);

  final String label;
  final bool isLarge;
  final bool isEditable;
  final Color fillColor;
  final Color hintColor;
  final TextInputType? keyboardType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: isLarge ? 3 : 1,
      controller: controller,
      keyboardType: keyboardType,
      autofocus: false,
      readOnly: !isEditable,
      style: TextStyle(color: kSecondaryColor, height: 1.4),
      decoration: InputDecoration(
        hintText: label,
        hintStyle: TextStyle(
          color: hintColor,
        ),
        isDense: true,
        fillColor: fillColor,
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(8)),
        focusColor: kPrimaryColor,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kSecondaryColor, width: 1.5),
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
