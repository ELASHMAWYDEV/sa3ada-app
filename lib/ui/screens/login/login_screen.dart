// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/ui/components/main_button.dart';
import 'package:sa3ada_app/ui/components/text_box.dart';
import 'package:sa3ada_app/ui/controllers/login_controller.dart';
import 'package:sa3ada_app/utils/constants.dart';
import 'package:sa3ada_app/utils/services/firebase.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (_) {
      return Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.2),
                  child: Text(
                    "مكتبة السعادة",
                    style: TextStyle(
                        fontFamily: "Cairo",
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                        color: kWhiteColor,
                        shadows: [
                          BoxShadow(
                              color: kPrimaryColor,
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 2)),
                        ]),
                  ),
                ),
                SizedBox(
                  height: 150,
                ),
                TextBox(
                  label: "البريد الالكتروني أو رقم الهاتف",
                  controller: _.usernameInputController,
                ),
                SizedBox(
                  height: 20,
                ),
                TextBox(
                    label: "كلمة المرور",
                    controller: _.passwordInputController,
                    isTextVisible: false),
                SizedBox(
                  height: 30,
                ),
                MainButton(
                    title: "تسجيل الدخول",
                    onPressed: () async {
                      await _.login();
                    })
              ],
            ),
          ),
        ),
      );
    });
  }
}
