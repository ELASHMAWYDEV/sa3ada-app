// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/data/firestore_models/user_model.dart';
import 'package:sa3ada_app/firebase_options.dart';
import 'package:sa3ada_app/utils/constants.dart';
import 'package:sa3ada_app/utils/services/storage_service.dart';

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
      // firestore.settings = Settings(persistenceEnabled: true);

      // Handle authentication
      firebaseAuth.authStateChanges().listen((user) async {
        if (user == null) {
          print("user logged out...");
          Get.offAndToNamed("/login");
          Get.find<StorageService>().userData = null;
        } else {
          // Create the user on firestore if doesn't exist
          final foundUsers =
              await usersRef.whereAuthUserId(isEqualTo: user.uid).get();
          if (foundUsers.docs.isEmpty) {
            final UserModelDocumentReference createdUser = await usersRef.add(
                UserModel(
                    authUserId: user.uid,
                    name: user.displayName ?? "غير معروف",
                    type: "user",
                    permissions: [],
                    branches: [],
                    stores: []));

            // Set the userId on the cloud
            await createdUser.update(id: createdUser.id);

            // Store user datay
            Get.find<StorageService>().userData = UserModel.fromJson({
              ...(await createdUser.get()).data!.toJson(),
              "id": createdUser.id
            });
          } else {
            // Update user data with the first occurence
            Get.find<StorageService>().userData = UserModel.fromJson({
              ...foundUsers.docs[0].data.toJson(),
              "id": foundUsers.docs[0].id
            });
          }
        }
      });

      // Initialize emulators
      if (!kReleaseMode) {
        await firebaseAuth.useAuthEmulator('10.10.10.224', 9099);
        firestore.useFirestoreEmulator('10.10.10.224', 8080);
        await firebaseStorage.useStorageEmulator('10.10.10.224', 9199);
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