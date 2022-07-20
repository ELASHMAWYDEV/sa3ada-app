// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/data/firebase_services/auth_service.dart';
import 'package:sa3ada_app/data/firestore_models/user_model.dart';
import 'package:sa3ada_app/ui/components/floating_add_button.dart';
import 'package:sa3ada_app/ui/components/image_header.dart';
import 'package:sa3ada_app/ui/screens/home/components/new_invoice_modal.dart';
import 'package:sa3ada_app/utils/constants.dart';
import 'package:sa3ada_app/utils/services/firebase.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingAddButton(
        options: [
          FloatingOptionButton(
            title: "فاتورة",
            onClick: () {
              Get.dialog(NewInvoiceModal());
              // Get.toNamed("/invoices/add");
            },
          ),
          FloatingOptionButton(
            title: "ايداع / تحويل",
            onClick: () {
              Get.toNamed("/actions/transfer-deposit");
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ImageHeader(),
                Positioned(
                    top: MediaQuery.of(context).padding.top + 10,
                    left: 20,
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed("items");
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: kGreenColor,
                          padding: EdgeInsets.zero,
                          fixedSize: Size(45, 45),
                          minimumSize: Size(45, 45),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100))),
                      child: Icon(
                        Icons.storage,
                        color: kWhiteColor,
                        size: 26,
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            OptionButton(
              title: "الفروع",
              onPressed: () {},
            ),
            OptionButton(
              title: "العملاء",
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
            ),
          ],
        ),
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
