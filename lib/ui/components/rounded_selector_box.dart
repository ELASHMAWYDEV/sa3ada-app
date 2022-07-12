// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sa3ada_app/data/models/selector_model.dart';
import 'package:sa3ada_app/utils/constants.dart';

class RoundedSelectorBox extends StatelessWidget {
  const RoundedSelectorBox({
    Key? key,
    required this.selector,
    required this.isActive,
    required this.onSelect,
  }) : super(key: key);

  final SelectorModel selector;
  final bool isActive;
  final Function(SelectorModel) onSelect;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onSelect(selector);
      },
      style: TextButton.styleFrom(
          padding: EdgeInsets.all(5),
          backgroundColor: isActive ? kGreenColor : kSecondaryColor,
          fixedSize: Size(size.width * 0.25 - 20, size.width * 0.25 - 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
      child: Center(
        child: Text(
          selector.label,
          textAlign: TextAlign.center,
          style: TextStyle(
              height: 1.4, fontWeight: FontWeight.w600, color: kWhiteColor),
        ),
      ),
    );
  }
}
