// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/data/firebase_services/auth_service.dart';
import 'package:sa3ada_app/ui/components/floating_add_button.dart';
import 'package:sa3ada_app/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingAddButton(
        options: [
          FloatingOptionButton(
            title: "فاتورة",
            onClick: () {},
          ),
          FloatingOptionButton(
            title: "ايداع / تحويل",
            onClick: () {
              Get.toNamed("/actions/transfer-deposit");
              AuthService.login();
            },
          ),
          FloatingOptionButton(
            title: "مصاريف",
            onClick: () {
              Get.toNamed("/actions/expenses");
            },
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: BackgroundImageClipper(),
                child: Container(
                  height: size.height * 0.3,
                  width: size.width,
                  foregroundDecoration: BoxDecoration(
                    color: kRedColor.withOpacity(0.5),
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/home-bg.jpg"),
                          fit: BoxFit.cover)),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: size.height * 0.15),
                  child: Text(
                    "مكتبة السعادة",
                    style: TextStyle(
                        fontFamily: "Cairo",
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                        shadows: [
                          BoxShadow(
                              color: kPrimaryColor,
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 2)),
                        ]),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 70,
          ),
          Visibility(
            visible: true,
            child: Column(
              children: [
                OptionButton(
                  title: "الفروع",
                  onPressed: () {},
                ),
                OptionButton(
                  title: "المخازن",
                  onPressed: () {},
                ),
                OptionButton(
                  title: "التجار",
                  onPressed: () {
                    Get.toNamed("/traders");
                  },
                ),
                OptionButton(
                  title: "الخزنة",
                  onPressed: () {},
                ),
                OptionButton(
                  title: "حساب الشغل",
                  onPressed: () {},
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  const OptionButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width - 40,
      padding: EdgeInsets.only(bottom: 15),
      child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(kWhiteColor),
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 40, vertical: 10)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)))),
          child: Text(
            title,
            style: TextStyle(
                fontFamily: "Tajawal",
                color: kSecondaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 20),
          )),
    );
  }
}

class BackgroundImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height / 2);
    path.quadraticBezierTo(0, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height / 2);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
