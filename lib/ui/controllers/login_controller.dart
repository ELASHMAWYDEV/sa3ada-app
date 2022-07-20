// ignore_for_file: prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/ui/components/alert_prompt_box.dart';
import 'package:sa3ada_app/utils/constants.dart';
import 'package:sa3ada_app/utils/services/firebase.dart';
import 'package:sa3ada_app/utils/services/navigation_service.dart';
import 'package:sa3ada_app/utils/services/storage_service.dart';

class LoginController extends GetxController {
  TextEditingController usernameInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();

  @override
  void onReady() {
    super.onReady();

    if (Get.find<StorageService>().isLoggedIn) {
      Get.offAllNamed("/home");
    }
  }

  Future<void> login() async {
    try {
      if (usernameInputController.text == "") {
        ScaffoldMessenger.of(Get.find<NavigationService>().context())
            .showSnackBar(kSnackBar(
                message: "يجب كتابة البريد الالكتروني",
                backgroundColor: kRedColor));
        return;
      }

      if (passwordInputController.text == "") {
        ScaffoldMessenger.of(Get.find<NavigationService>().context())
            .showSnackBar(kSnackBar(
                message: "يجب كتابة كلمة المرور", backgroundColor: kRedColor));
        return;
      }

      final credential = await FirebaseService.firebaseAuth
          .signInWithEmailAndPassword(
              email: usernameInputController.text,
              password: passwordInputController.text);

      Get.toNamed("/home");
      ScaffoldMessenger.of(Get.find<NavigationService>().context())
          .showSnackBar(kSnackBar(message: "تم تسجيل الدخول بنجاح"));
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          ScaffoldMessenger.of(Get.find<NavigationService>().context())
              .showSnackBar(kSnackBar(
                  message: "هذا المستخدم غير موجود",
                  backgroundColor: kRedColor));
          break;
        // return AlertPromptBox.showError(error: "هذا المستخدم غير موجود");
        case 'wrong-password':
          ScaffoldMessenger.of(Get.find<NavigationService>().context())
              .showSnackBar(kSnackBar(
                  message: "كلمة المرور غير صحيحة",
                  backgroundColor: kRedColor));
          // return AlertPromptBox.showError(error: "كلمة المرور غير صحيحة");
          break;
        default:
          return AlertPromptBox.showError(error: e.toString());
      }
    } catch (e) {
      AlertPromptBox.showError(error: "حدث خطأ ما ، يرجي الرجوع للمطور\n$e");
    }
  }
}
