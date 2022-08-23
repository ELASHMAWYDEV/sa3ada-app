// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sa3ada_app/ui/components/alert_prompt_box.dart';
import 'package:sa3ada_app/utils/constants.dart';
import 'package:sa3ada_app/utils/services/firebase.dart';

class SyncButton extends StatefulWidget {
  const SyncButton({
    Key? key,
  }) : super(key: key);

  @override
  State<SyncButton> createState() => _SyncButtonState();
}

class _SyncButtonState extends State<SyncButton> {
  bool isSyncing = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          try {
            if (isSyncing) {
              return;
            }
            setState(() {
              isSyncing = true;
            });
            await FirebaseService.firestore.waitForPendingWrites();
          } catch (e) {
            AlertPromptBox.showError(error: "$e");
          } finally {
            setState(() {
              isSyncing = false;
            });
          }
        },
        style: TextButton.styleFrom(
            backgroundColor: kGreenColor,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100))),
        child: Column(
          children: [
            Visibility(
                visible: isSyncing,
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: kWhiteColor,
                    strokeWidth: 2,
                  ),
                )),
            Visibility(
              visible: !isSyncing,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "تحديث البيانات",
                    style: TextStyle(color: kWhiteColor),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.sync,
                    color: kWhiteColor,
                    size: 16,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
