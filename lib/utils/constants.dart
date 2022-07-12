// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sa3ada_app/data/models/selector_model.dart';
import 'package:sa3ada_app/utils/services/navigation_service.dart';
import 'package:get/get.dart';

const Color kPrimaryColor = Color(0xFF4B6584);
const Color kSecondaryColor = Color(0xFF2F3542);
const Color kGrayLightColor = Color(0xFFD9D9D9);
const Color kWhiteColor = Color(0xFFFFFFFF);
const Color kRedColor = Color(0xFFFF4757);
const Color kGreenColor = Color(0xFF0BE881);

const String kAppTitle = "مكتبة السعادة";
String kFontFamilyPrimary = "Tajawal";
String kFontFamilySecondary = "Cairo";

final Size size = MediaQuery.of(Get.find<NavigationService>().context()).size;

SnackBar kSnackBar(
        {required String message, Color backgroundColor = kGreenColor}) =>
    SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: kWhiteColor,
            fontFamily: kFontFamilyPrimary,
            fontSize: 16,
            height: 1.4),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 2,
      dismissDirection: DismissDirection.horizontal,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      margin: EdgeInsets.only(bottom: 30, right: 20, left: 20),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
    );

final kSemesterSelectors = [
  SelectorModel(label: "ترم أول", value: "seme1"),
  SelectorModel(label: "ترم ثان", value: "seme2"),
];

final List<SelectorModel> kStageSelectors = [
  SelectorModel(value: "kindergarten", label: "حضانات"),
  SelectorModel(value: "primary", label: "ابتدائى"),
  SelectorModel(value: "middle", label: "اعدادى"),
  SelectorModel(value: "secondary", label: "ثانوى"),
  SelectorModel(value: "other", label: "أخرى"),
];

final Map<String, List<SelectorModel>> kGradeSelectors = {
  "kindergarten": [
    SelectorModel(value: "KG1", label: "Kg1"),
    SelectorModel(value: "KG2", label: "Kg2"),
  ],
  "primary": [
    SelectorModel(value: "grade1", label: "١ب"),
    SelectorModel(value: "grade2", label: "٢ب"),
    SelectorModel(value: "grade3", label: "٣ب"),
    SelectorModel(value: "grade4", label: "٤ب"),
    SelectorModel(value: "grade5", label: "٥ب"),
    SelectorModel(value: "grade6", label: "٦ب"),
  ],
  "middle": [
    SelectorModel(value: "grade7", label: "١ع"),
    SelectorModel(value: "grade8", label: "٢ع"),
    SelectorModel(value: "grade9", label: "٣ع"),
  ],
  "secondary": [
    SelectorModel(value: "grade10", label: "١ث"),
    SelectorModel(value: "grade11", label: "٢ث"),
    SelectorModel(value: "grade12", label: "٣ث"),
  ],
  "other": []
};
