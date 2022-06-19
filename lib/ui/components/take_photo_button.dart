// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sa3ada_app/utils/constants.dart';

class TakePhotoButton extends StatelessWidget {
  TakePhotoButton({
    Key? key,
    this.title = "التقاط صور",
  }) : super(key: key);

  final String title;
  final ImagePicker imagePicker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          final XFile? images =
              await imagePicker.pickImage(source: ImageSource.camera);

          print(images);
        },
        style: TextButton.styleFrom(
            backgroundColor: kSecondaryColor,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(color: kWhiteColor, height: 1.5),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.camera_alt,
              color: kWhiteColor,
            )
          ],
        ));
  }
}
