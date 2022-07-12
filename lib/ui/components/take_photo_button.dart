// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sa3ada_app/utils/constants.dart';

class TakePhotoButton extends StatefulWidget {
  const TakePhotoButton({
    Key? key,
    this.title = "اضافة صور",
    required this.onSelectingImages,
  }) : super(key: key);

  final String title;
  final Function(List<File?>) onSelectingImages;
  @override
  State<TakePhotoButton> createState() => _TakePhotoButtonState();
}

class _TakePhotoButtonState extends State<TakePhotoButton> {
  final ImagePicker imagePicker = ImagePicker();
  final List<File> imageFiles = [];

  Future pickImage({ImageSource source = ImageSource.camera}) async {
    List<XFile?> images = [];
    if (source == ImageSource.gallery) {
      images.addAll((await imagePicker.pickMultiImage())?.toList() ?? []);
    } else {
      images.addNonNull(await imagePicker.pickImage(source: source));
    }

    Get.back();
    for (final image in images) {
      imageFiles.addNonNull(File(image!.path));
    }

    widget.onSelectingImages(imageFiles);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
            onPressed: () async {
              Get.bottomSheet(
                Container(
                  height: 200,
                  width: 100,
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    children: [
                      Text(
                        "اختر مصدر الصور",
                        style: TextStyle(
                            color: kSecondaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              onPressed: () {
                                pickImage(source: ImageSource.camera);
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: kSecondaryColor,
                                  fixedSize: Size(100, double.infinity),
                                  padding: EdgeInsets.all(15),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/camera.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "التقاط صورة",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: kWhiteColor),
                                  )
                                ],
                              )),
                          TextButton(
                              onPressed: () {
                                pickImage(source: ImageSource.gallery);
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: kSecondaryColor,
                                  fixedSize: Size(100, double.infinity),
                                  padding: EdgeInsets.all(15),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/gallery.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "المعرض",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: kWhiteColor),
                                  )
                                ],
                              ))
                        ],
                      )
                    ],
                  ),
                ),
                // backgroundColor: Colors.transparent
              );
            },
            style: TextButton.styleFrom(
                backgroundColor: kSecondaryColor,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.title,
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
            )),
        SizedBox(
          height: imageFiles.isEmpty ? 0 : 20,
        ),
        SizedBox(
          width: size.width - 40,
          height: imageFiles.isEmpty ? 0 : 70,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            itemCount: imageFiles.length,
            itemBuilder: (BuildContext ctx, int index) => Padding(
              padding: EdgeInsets.only(right: 15),
              child: Container(
                width: 70,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                                color: kSecondaryColor.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(0, 3))
                          ]),
                      child: Image.file(
                        imageFiles[index],
                        fit: BoxFit.cover,
                        width: 70,
                        height: 70,
                      ),
                    ),
                    Positioned(
                      top: -10,
                      right: -8,
                      child: GestureDetector(
                        onTap: () {
                          imageFiles.remove(imageFiles[index]);
                          widget.onSelectingImages(imageFiles);
                          setState(() {});
                        },
                        child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                color: kRedColor,
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                                child: Icon(
                              Icons.close,
                              size: 16,
                              color: kWhiteColor,
                            ))),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
