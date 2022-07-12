// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sa3ada_app/utils/constants.dart';

class ScanBarCodeButton extends StatefulWidget {
  const ScanBarCodeButton({
    Key? key,
    this.title = "التقاط الباركود",
    required this.onBarCodeScanned,
  }) : super(key: key);

  final String title;
  final Function(String) onBarCodeScanned;

  @override
  State<ScanBarCodeButton> createState() => _ScanBarCodeButtonState();
}

class _ScanBarCodeButtonState extends State<ScanBarCodeButton> {
  String? barcodeText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Visibility(
          visible: barcodeText != null,
          child: Column(
            children: [
              Text(
                "$barcodeText",
                style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            MobileScannerController cameraController =
                MobileScannerController();

            Get.bottomSheet(Container(
              height: 300,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40))),
              child: Stack(
                children: [
                  MobileScanner(
                      allowDuplicates: false,
                      controller: cameraController,
                      fit: BoxFit.cover,
                      onDetect: (barcode, args) {
                        EasyDebounce.debounce(
                            "barcode_debouncer", Duration(milliseconds: 500),
                            () {
                          if (barcode.rawValue != null &&
                              barcode.type == BarcodeType.product) {
                            setState(() {
                              barcodeText = barcode.rawValue;
                            });
                            widget.onBarCodeScanned(barcodeText!);
                            Get.back();
                          }
                        });
                      }),
                  Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.symmetric(
                          vertical: BorderSide(
                              color: kSecondaryColor.withOpacity(0.8),
                              width: 60),
                          horizontal: BorderSide(
                              color: kSecondaryColor.withOpacity(0.8),
                              width: 100),
                        ),
                      )),
                  Positioned(
                    top: 30,
                    right: 30,
                    child: IconButton(
                      color: Colors.white,
                      icon: ValueListenableBuilder(
                        valueListenable: cameraController.torchState,
                        builder: (context, state, child) {
                          switch (state as TorchState) {
                            case TorchState.off:
                              return const Icon(Icons.flash_off,
                                  color: Colors.grey);
                            case TorchState.on:
                              return const Icon(Icons.flash_on,
                                  color: Colors.yellow);
                          }
                        },
                      ),
                      iconSize: 32.0,
                      onPressed: () => cameraController.toggleTorch(),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 30,
                    child: IconButton(
                      color: Colors.white,
                      icon: ValueListenableBuilder(
                        valueListenable: cameraController.cameraFacingState,
                        builder: (context, state, child) {
                          switch (state as CameraFacing) {
                            case CameraFacing.front:
                              return const Icon(Icons.camera_front);
                            case CameraFacing.back:
                              return const Icon(Icons.camera_rear);
                          }
                        },
                      ),
                      iconSize: 32.0,
                      onPressed: () => cameraController.switchCamera(),
                    ),
                  )
                ],
              ),
            ));
          },
          style: TextButton.styleFrom(
              backgroundColor: kSecondaryColor,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              fixedSize: Size(260, double.infinity),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                barcodeText != null
                    ? "تغيير الباركود"
                    : "اضغط هنا لالتقاط الباركود",
                style: TextStyle(color: kWhiteColor),
              ),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.qr_code_scanner_rounded,
                color: kWhiteColor,
              )
            ],
          ),
        ),
      ],
    );
  }
}
