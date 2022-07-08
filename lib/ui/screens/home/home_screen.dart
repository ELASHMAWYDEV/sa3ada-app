// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/data/firebase_services/auth_service.dart';
import 'package:sa3ada_app/data/firestore_models/user_model.dart';
import 'package:sa3ada_app/ui/components/floating_add_button.dart';
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
              FirebaseService.firebaseAuth.signOut();
            },
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
      body: SingleChildScrollView(
        child: Column(
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
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: size.height * 0.15),
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
                ),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            // FirestoreBuilder<UserModelQuerySnapshot>(
            //   ref: usersRef,
            //   builder: (context, snapshot, _) {
            //     if (snapshot.hasError) return Text('error: ${snapshot.error}');
            //     if (!snapshot.hasData) return const Text('loading');

            //     UserModelQuerySnapshot querySnapshot = snapshot.requireData;

            //     if (querySnapshot.docs.isEmpty) return Text("Empty");

            //     return SizedBox(
            //       height: 100,
            //       child: ListView.builder(
            //         itemCount: querySnapshot.docs.length,
            //         itemBuilder: (context, index) {
            //           // Access the User instance
            //           UserModel user = querySnapshot.docs[index].data;

            //           return Text(
            //               'User name: ${user.name}, id ${querySnapshot.docs[index].id}');
            //         },
            //       ),
            //     );
            //   },
            // ),
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
