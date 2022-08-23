// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:sa3ada_app/utils/constants.dart';

class MainButton extends StatefulWidget {
  const MainButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      this.backgroundColor})
      : super(key: key);

  final String title;
  final Future Function() onPressed;
  final Color? backgroundColor;

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        if (isLoading) {
          return;
        }
        setState(() {
          isLoading = true;
        });

        await widget.onPressed();
        setState(() {
          isLoading = false;
        });
      },
      style: ButtonStyle(
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: 10, horizontal: 80)),
          backgroundColor:
              MaterialStateProperty.all(widget.backgroundColor ?? kGreenColor),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)))),
      child: isLoading
          ? SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(
                color: kWhiteColor,
                strokeWidth: 2,
              ))
          : Text(
              widget.title,
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  height: 1.4),
            ),
    );
  }
}
