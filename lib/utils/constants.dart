import 'package:flutter/material.dart';
import 'package:sa3ada_app/utils/services/navigation_service.dart';
import 'package:get/get.dart';

const Color kPrimaryColor = Color(0xFF4B6584);
const Color kSecondaryColor = Color(0xFF2F3542);
const Color kWhiteColor = Color(0xFFFFFFFF);
const Color kRedColor = Color(0xFFFF4757);
const Color kGreenColor = Color(0xFF0BE881);

const String kAppTitle = "مكتبة السعادة";
String kFontFamilyPrimary = "Tajawal";
String kFontFamilySecondary = "Cairo";

final Size size = MediaQuery.of(Get.find<NavigationService>().context()).size;
