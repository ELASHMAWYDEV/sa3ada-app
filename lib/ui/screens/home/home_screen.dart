// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures, unnecessary_nullable_for_final_variable_declarations
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/data/firestore_models/user_model.dart';
import 'package:sa3ada_app/ui/components/floating_add_button.dart';
import 'package:sa3ada_app/ui/components/image_header.dart';
import 'package:sa3ada_app/ui/components/sync_button.dart';
import 'package:sa3ada_app/ui/screens/home/components/new_invoice_modal.dart';
import 'package:sa3ada_app/utils/constants.dart';
import 'package:sa3ada_app/utils/services/firebase.dart';
import 'package:sa3ada_app/utils/services/storage_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print(Get.find<StorageService>().userData?.id);
    return FirestoreBuilder<UserModelDocumentSnapshot>(
        ref: usersRef.doc(Get.find<StorageService>().userData?.id),
        builder: (context, snapshot, _) {
          if (snapshot.hasError)
            return Center(child: Text('error: ${snapshot.error}'));
          if (!snapshot.hasData)
            return Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(
                  color: kGreenColor,
                ),
              ),
            );
          final UserModel? user = snapshot.requireData.data != null
              ? UserModel.fromJson({
                  ...?snapshot.requireData.data?.toJson(),
                  "id": snapshot.requireData.id
                })
              : null;

          // In case of any error
          if (user == null) {
            Future.delayed(Duration(seconds: 2), () async {
              setState(() {});
            });
          }

          return Scaffold(
            floatingActionButton: FloatingAddButton(
              options: [
                if (user!.permissions.contains("createInvoice"))
                  FloatingOptionButton(
                    title: "فاتورة",
                    onClick: () {
                      Get.dialog(NewInvoiceModal());
                      // Get.toNamed("/invoices/add");
                    },
                  )
                else
                  ...[],
                if (user.permissions.contains("createDeposit"))
                  FloatingOptionButton(
                    title: "ايداع / تحويل",
                    onClick: () {
                      Get.toNamed("/actions/transfer-deposit");
                    },
                  )
                else
                  ...[],
                if (user.permissions.contains("createExpenses"))
                  FloatingOptionButton(
                    title: "مصاريف",
                    onClick: () {
                      Get.toNamed("/actions/expenses");
                    },
                  )
                else
                  ...[]
              ],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.startFloat,
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
                            onLongPress: () {
                              FirebaseService.firebaseAuth.signOut();
                            },
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
                      Positioned(
                          top: MediaQuery.of(context).padding.top + 10,
                          right: 20,
                          child: SyncButton()),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  RichText(
                      text: TextSpan(
                          style: TextStyle(fontFamily: kFontFamilyPrimary),
                          text: "مرحبا يا ",
                          children: [
                        TextSpan(
                            style: TextStyle(
                                color: kGreenColor,
                                fontWeight: FontWeight.w600),
                            text: user.name.split(" ")[0])
                      ])),
                  SizedBox(
                    height: 35,
                  ),
                  if (user.permissions.contains("clients"))
                    OptionButton(
                      title: "العملاء",
                      onPressed: () {
                        Get.toNamed("/clients");
                      },
                    ),
                  if (user.permissions.contains("branches"))
                    OptionButton(
                      title: "الفروع",
                      onPressed: () {
                        Get.toNamed("/branches");
                      },
                    ),
                  if (user.permissions.contains("traders"))
                    OptionButton(
                      title: "التجار",
                      onPressed: () {
                        Get.toNamed("/traders");
                      },
                    ),
                  if (user.permissions.contains("stores"))
                    OptionButton(
                      title: "المخازن",
                      onPressed: () {
                        Get.toNamed("/stores");
                      },
                    ),
                  if (user.type == "superAdmin")
                    OptionButton(
                      title: "الاحصائيات",
                      onPressed: () {
                        Get.toNamed("/stats");
                      },
                    ),
                  // OptionButton(
                  //   title: "حساب الشغل",
                  //   onPressed: () {},
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        });
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
