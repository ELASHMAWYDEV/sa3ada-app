// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/firebase_options.dart';
import 'package:sa3ada_app/utils/constants.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling background messaging: ${message.messageId}");
}

AndroidNotificationChannel channel = const AndroidNotificationChannel(
    "app_channel", "App Notifications",
    description: "This channel is used to handle notifications");
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class FirebaseService extends GetxService {
  static final FirebaseService _firebaseUtil = FirebaseService._();
  FirebaseService._() {
    init();
  }
  factory FirebaseService() {
    return _firebaseUtil;
  }

  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  static final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  static Future<void> init() async {
    try {
      await Firebase.initializeApp(
              name: 'sa3ada_app',
              options: DefaultFirebaseOptions.currentPlatform)
          .whenComplete(() => print("initialized firebase app"));

      if (kIsWeb) {
        firestore.enablePersistence();
      }
      // firestore.enableNetwork();
      // firestore.settings = Settings(persistenceEnabled: true);

      // Handle authentication
      firebaseAuth.authStateChanges().listen((user) {
        if (user == null) {
          print("user logged out...");
          Get.offAndToNamed("/login");
        }
      });

      // Initialize emulators
      if (!kReleaseMode) {
        await firebaseAuth.useAuthEmulator('192.168.1.153', 9099);
        firestore.useFirestoreEmulator('192.168.1.153', 8080);
        await firebaseStorage.useStorageEmulator('192.168.1.153', 9199);
      }

      //Get the token
      // final String? token = await firebaseMessaging.getToken();

      // print("firebase token: $token");

      //Handle background messages
      FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

      // //Get notification permission
      // NotificationSettings settings =
      //     await firebaseMessaging.requestPermission();
      // print("authurization is : ${settings.authorizationStatus}");

      /*****************************************/
      //Handle messaging
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        if (notification != null && android != null) {
          flutterLocalNotificationsPlugin.show(
              notification.hashCode,
              notification.title,
              notification.body,
              NotificationDetails(
                  android: AndroidNotificationDetails(channel.id, channel.name,
                      channelDescription: channel.description,
                      color: kPrimaryColor,
                      playSound: true,
                      priority: Priority.high,
                      icon: "@mipmap/ic_launcher")));
        }
      });
      /*****************************************/
    } catch (e) {
      print("Error in firebase service init(): $e");
    }
  }
}







  // //Handle notifications
  // await FlutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
  //         AndroidFlutterLocalNotificationsPlugin>()
  //     ?.createNotificationChannel(channel);