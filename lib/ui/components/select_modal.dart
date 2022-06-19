// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/utils/constants.dart';

class SelectModal extends StatelessWidget {
  const SelectModal({
    Key? key,
    required this.items,
    required this.selectedItemIndex,
    required this.onChange,
  }) : super(key: key);

  final List<String> items;
  final int selectedItemIndex;
  final Function(int) onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.circular(50)),
                    child: Icon(
                      Icons.close,
                      color: kWhiteColor,
                      size: 20,
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: items.length,
                padding: EdgeInsets.only(bottom: 20),
                itemBuilder: (BuildContext context, int index) => Padding(
                      padding: EdgeInsets.only(bottom: 7.0),
                      child: TextButton(
                        onPressed: () {
                          onChange(index);
                          Get.back();
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: index == selectedItemIndex
                                ? kPrimaryColor
                                : kWhiteColor,
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4))),
                        child: Text(items[index],
                            style: TextStyle(
                                color: index == selectedItemIndex
                                    ? kWhiteColor
                                    : kSecondaryColor,
                                fontSize: 18)),
                      ),
                    )),
          )
        ],
      ),
    );
  }
}
