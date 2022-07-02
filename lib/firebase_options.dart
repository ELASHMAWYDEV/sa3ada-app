// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBWIZXHyT55tQah8fsF_zNlH31ESk-DAAI',
    appId: '1:746609326906:web:2402960c9648bd147a6e03',
    messagingSenderId: '746609326906',
    projectId: 'sa3ada-62bc6',
    authDomain: 'sa3ada-62bc6.firebaseapp.com',
    storageBucket: 'sa3ada-62bc6.appspot.com',
    measurementId: 'G-FT08JRBTQH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDmWnz0XqbXGAaSmlktf6aBk5OqOeYx-6o',
    appId: '1:746609326906:android:1916ffd936a70f007a6e03',
    messagingSenderId: '746609326906',
    projectId: 'sa3ada-62bc6',
    storageBucket: 'sa3ada-62bc6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDOI5aJj2NPLgb0zrEdgEJCSwmfVKGrCiQ',
    appId: '1:746609326906:ios:c6f082b4f18ab9007a6e03',
    messagingSenderId: '746609326906',
    projectId: 'sa3ada-62bc6',
    storageBucket: 'sa3ada-62bc6.appspot.com',
    iosClientId: '746609326906-l622nhol58n896v32ql4le8cqbav6pru.apps.googleusercontent.com',
    iosBundleId: 'com.example.sa3adaApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDOI5aJj2NPLgb0zrEdgEJCSwmfVKGrCiQ',
    appId: '1:746609326906:ios:c6f082b4f18ab9007a6e03',
    messagingSenderId: '746609326906',
    projectId: 'sa3ada-62bc6',
    storageBucket: 'sa3ada-62bc6.appspot.com',
    iosClientId: '746609326906-l622nhol58n896v32ql4le8cqbav6pru.apps.googleusercontent.com',
    iosBundleId: 'com.example.sa3adaApp',
  );
}
