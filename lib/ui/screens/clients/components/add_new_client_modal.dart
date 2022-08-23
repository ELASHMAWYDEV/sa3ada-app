// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/data/firestore_models/account_model.dart';
import 'package:sa3ada_app/ui/components/alert_prompt_box.dart';
import 'package:sa3ada_app/ui/components/main_button.dart';
import 'package:sa3ada_app/ui/components/text_box.dart';
import 'package:sa3ada_app/utils/constants.dart';

class AddNewClientModal extends StatefulWidget {
  const AddNewClientModal({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNewClientModal> createState() => _AddNewClientModalState();
}

class _AddNewClientModalState extends State<AddNewClientModal> {
  String newClientName = "";

  final TextEditingController clientNameInputController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Dialog(
        backgroundColor: kSecondaryColor,
        child: FittedBox(
          child: Container(
            width: size.width * 0.8,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      blurRadius: 2, color: kSecondaryColor.withOpacity(0.5))
                ]),
            child: Column(children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: Center(
                          child: Icon(
                            Icons.close,
                            color: kSecondaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "اضافة عميل جديد",
                style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 30,
              ),
              TextBox(
                  label: "اسم العميل", controller: clientNameInputController),
              SizedBox(height: 20),
              MainButton(
                  title: "اضافة",
                  onPressed: () async {
                    // Validation
                    if (clientNameInputController.text == "") {
                      return AlertPromptBox.showError(
                          error: "يجب كتابة اسم العميل");
                    }

                    // Check if name already exists
                    if ((await accountsRef
                            .whereName(
                                isEqualTo: clientNameInputController.text)
                            .get())
                        .docs
                        .isNotEmpty) {
                      return AlertPromptBox.showError(
                          error: "هذا العميل تم اضافته من قبل");
                    }

                    AlertPromptBox.showPrompt(
                        message:
                            "تأكيد اضافة ${clientNameInputController.text} كعميل جديد ؟",
                        title: "تأكيد",
                        onSuccess: () async {
                          await accountsRef
                              .add(AccountModel(
                                  name: clientNameInputController.text,
                                  type: "client",
                                  totalBalance: 0,
                                  creditBalance: 0))
                              .whenComplete(() {
                            Get.back();
                            AlertPromptBox.showSuccess(
                                message:
                                    "تم اضافة العميل ${clientNameInputController.text} بنجاح");
                          });
                        });
                  })
            ]),
          ),
        ),
      );
    });
  }
}
