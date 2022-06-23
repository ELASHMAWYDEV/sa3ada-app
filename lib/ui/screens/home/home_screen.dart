// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          MainButton(
            title: "الفروع",
            onPressed: () {},
          ),
          MainButton(
            title: "المخازن",
            onPressed: () {},
          ),
          MainButton(
            title: "التجار",
            onPressed: () {
              Get.toNamed("/traders");
            },
          ),
          MainButton(
            title: "الخزنة",
            onPressed: () {},
          ),
          MainButton(
            title: "حساب الشغل",
            onPressed: () {},
          ),
          Spacer(),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                      color: kSecondaryColor.withOpacity(0.5),
                      offset: Offset(0, 4),
                      blurRadius: 10,
                      spreadRadius: 2)
                ]),
            child: TextButton(
                onPressed: () {
                  Get.toNamed("/actions/expenses");
                },
                style: TextButton.styleFrom(
                  backgroundColor: kRedColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.add,
                      color: kWhiteColor,
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

class MainButton extends StatelessWidget {
  const MainButton({Key? key, required this.title, required this.onPressed})
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
