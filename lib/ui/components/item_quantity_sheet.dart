// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/data/firestore_models/item_model.dart';
import 'package:sa3ada_app/ui/components/alert_prompt_box.dart';
import 'package:sa3ada_app/ui/components/item_box.dart';
import 'package:sa3ada_app/ui/components/main_button.dart';
import 'package:sa3ada_app/ui/components/text_box.dart';
import 'package:sa3ada_app/utils/constants.dart';

class ItemQuantitySheet extends StatelessWidget {
  const ItemQuantitySheet(
      {Key? key,
      required this.item,
      required this.onConfirm,
      this.defaultSelectedQuantity})
      : super(key: key);

  final ItemModel item;
  final Function(ItemModel, int) onConfirm;
  final int? defaultSelectedQuantity;

  static RxInt quantity = 0.obs;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      RxInt quantity = 0.obs;
      final TextEditingController quantityInputController =
          TextEditingController(text: quantity.toString());
      @override
      void initState() {
        quantityInputController.addListener(() {
          quantity(int.tryParse(quantityInputController.text) ?? 0);
        });
        quantity.listen((p0) {
          setState(() {});
        });
      }

      return Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ItemBox(
                item: item,
                onPressed: (item) {},
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "يرجي اختيار الكمية",
                style: TextStyle(color: kWhiteColor, fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              DropdownButton2(
                  iconSize: 30,
                  underline: SizedBox(),
                  focusColor: kGreenColor,
                  customButton: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    width: 140,
                    decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(4)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${item.quantity == null ? "لا يوجد" : quantity.toInt() != 0 ? quantity.toInt() : defaultSelectedQuantity ?? "اختر الكمية"}",
                          style: TextStyle(
                              color: kSecondaryColor,
                              fontSize: 14,
                              fontFamily: kFontFamilyPrimary),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_drop_down_rounded,
                          color: kSecondaryColor,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                  iconDisabledColor: kRedColor,
                  iconEnabledColor: kWhiteColor,
                  selectedItemBuilder: (ctx) => [Text("Hello")],
                  style: TextStyle(color: kSecondaryColor),
                  items: List.generate(
                      item.quantity == null ? 0 : item.quantity!,
                      (index) => DropdownMenuItem<int>(
                            child: Text("${index + 1}"),
                            value: index + 1,
                          )),
                  onChanged: (int? index) {
                    quantityInputController.text = (index ?? 0 + 1).toString();
                    quantity(index ?? 0 + 1);
                    print("selected ${index ?? 0 + 1}");
                  }),
              SizedBox(
                height: 20,
              ),
              TextBox(
                  label: "الكمية",
                  controller: quantityInputController,
                  keyboardType: TextInputType.number),
              Spacer(),
              MainButton(
                  title: "تأكيد الصنف",
                  onPressed: () async {
                    if (quantity.toInt() == 0 &&
                        defaultSelectedQuantity == null &&
                        item.quantity != null) {
                      AlertPromptBox.showError(error: "يرجي اختيار الكمية");
                    } else {
                      onConfirm(
                          item,
                          int.tryParse(quantity.toString()) ??
                              defaultSelectedQuantity!);
                      Get.back();
                    }
                  })
            ]),
      );
    });
  }
}
