// ignore_for_file: prefer_const_constructors, prefer_function_declarations_over_variables

import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/ui/components/main_button.dart';
import 'package:sa3ada_app/utils/services/firebase.dart';
import 'package:sa3ada_app/utils/services/navigation_service.dart';

class ConnectionService extends GetxService {
  ConnectionService();

  final _connectivity = Connectivity();
  final RxBool hasConnection = false.obs;
  late StreamSubscription<ConnectivityResult> _subscription;

  static Future<ConnectionService> init() async {
    final ConnectionService service = ConnectionService();

    //subscribe to connection change
    service._subscription = service._connectivity.onConnectivityChanged
        .listen(service._onConnectionChange);
    service.checkConnection();
    return service;
  }

  void _onConnectionChange(ConnectivityResult result) {
    //Check if connected
    checkConnection();
  }

  Future<void> checkConnection() async {
    final bool oldConnectionStatus = hasConnection.value;
    bool newConnectionStatus;

    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        newConnectionStatus = true;
      } else {
        newConnectionStatus = false;
      }
    } on SocketException {
      newConnectionStatus = false;
    }

    if (oldConnectionStatus != newConnectionStatus) {
      hasConnection(newConnectionStatus);
    }

    if (!newConnectionStatus) {
      if (!Get.isRegistered<NavigationService>()) {
        await Future.delayed(Duration(seconds: 2));
      }
      Get.dialog(
          AlertDialog(
            title: Text("لا يوجد اتصال بالانترنت"),
            content: Text(
                "لا يوجد اتصال بالانترنت ، تحقق من اتصالك ثم أعد المحاولة"),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              MainButton(
                  title: "اعادة المحاولة",
                  onPressed: () async {
                    if (!newConnectionStatus) {
                      await checkConnection();
                      Get.back();
                    } else {
                      Get.back();
                    }
                  })
            ],
          ),
          barrierDismissible: false);
    }
  }

  @override
  void onClose() {
    _subscription.cancel();
    super.onClose();
  }
}
