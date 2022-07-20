// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_function_declarations_over_variables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:sa3ada_app/utils/constants.dart';

class ScanBarCodeButton extends StatefulWidget {
  const ScanBarCodeButton(
      {Key? key,
      this.title = "اضغط هنا لالتقاط الباركود",
      required this.onBarCodeScanned,
      this.isBarcodeVisible = true,
      this.isFloatingBtn = false})
      : super(key: key);

  final String title;
  final Function(String) onBarCodeScanned;
  final bool isBarcodeVisible;
  final bool isFloatingBtn;

  @override
  State<ScanBarCodeButton> createState() => _ScanBarCodeButtonState();
}

class _ScanBarCodeButtonState extends State<ScanBarCodeButton> {
  String? barcodeText;
  bool isScanning = false;

  @override
  Widget build(BuildContext context) {
    final wrapper = ({required List<Widget> children}) => widget.isFloatingBtn
        ? SizedBox.expand(
            child: Stack(alignment: Alignment.bottomRight, children: children),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          );
    return wrapper(
      children: [
        Visibility(
          visible: !widget.isFloatingBtn &&
              barcodeText != null &&
              widget.isBarcodeVisible,
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
        SizedBox(
          width: widget.isFloatingBtn ? 50 : null,
          height: widget.isFloatingBtn ? 50 : null,
          child: TextButton(
            onPressed: () {
              isScanning = true;
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
                          if (barcode.rawValue != null &&
                              barcode.type == BarcodeType.product) {
                            // Avoid closing the current route
                            if (!isScanning) {
                              print("Already scanning");
                              return;
                            }
                            setState(() {
                              barcodeText = barcode.rawValue;
                            });
                            widget.onBarCodeScanned(barcodeText!);
                            Get.back();

                            isScanning = false;
                            if (!widget.isBarcodeVisible) {
                              setState(() {
                                barcodeText = null;
                              });
                            }
                          }
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
                backgroundColor:
                    widget.isFloatingBtn ? kRedColor : kSecondaryColor,
                padding: EdgeInsets.symmetric(
                    horizontal: widget.isFloatingBtn ? 0 : 40,
                    vertical: widget.isFloatingBtn ? 0 : 8),
                fixedSize: Size(widget.isFloatingBtn ? 100 : 260,
                    widget.isFloatingBtn ? 100 : double.infinity),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(widget.isFloatingBtn ? 100 : 4))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: !widget.isFloatingBtn,
                  child: Row(
                    children: [
                      Text(
                        !widget.isBarcodeVisible
                            ? widget.title
                            : barcodeText != null
                                ? "تغيير الباركود"
                                : widget.title,
                        style: TextStyle(color: kWhiteColor),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.qr_code_scanner_rounded,
                  color: kWhiteColor,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
