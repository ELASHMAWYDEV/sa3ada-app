// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sa3ada_app/utils/constants.dart';

class ImageHeader extends StatelessWidget {
  const ImageHeader({Key? key, this.title = "مكتبة السعادة"}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Stack(
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
              title,
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
        ),
      ],
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
