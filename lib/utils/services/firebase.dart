import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
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

  late final FirebaseMessaging firebaseMessaging;
  late final FirebaseFirestore firestore;

  Future<void> init() async {
    await Firebase.initializeApp();
    firebaseMessaging = FirebaseMessaging.instance;
    firestore = FirebaseFirestore.instance;

    //Get the token
    final String? token = await firebaseMessaging.getToken();

    print("firebase token: $token");

    //Handle background messages
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    //Get notification permission
    NotificationSettings settings = await firebaseMessaging.requestPermission();
    print("authurization is : ${settings.authorizationStatus}");

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
  }
}







  // //Handle notifications
  // await FlutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
  //         AndroidFlutterLocalNotificationsPlugin>()
  //     ?.createNotificationChannel(channel);