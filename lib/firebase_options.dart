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
    apiKey: 'AIzaSyD1sIwgW56QoiqgOahJE4Fo0pexdyKsBfI',
    appId: '1:994018426562:web:3791e0d2b71214d728455b',
    messagingSenderId: '994018426562',
    projectId: 'tick-tack-too-2853c',
    authDomain: 'tick-tack-too-2853c.firebaseapp.com',
    storageBucket: 'tick-tack-too-2853c.appspot.com',
    measurementId: 'G-8VQ00BPDKB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB0MOJXoQeyLC1g1Mq0BR8_bLzcSLfb33w',
    appId: '1:994018426562:android:b71e66fdab531bf728455b',
    messagingSenderId: '994018426562',
    projectId: 'tick-tack-too-2853c',
    storageBucket: 'tick-tack-too-2853c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAZqGvAcRicxBg_vgIpYaenggQvTC2rHJ4',
    appId: '1:994018426562:ios:7cc6a8ba1154edf928455b',
    messagingSenderId: '994018426562',
    projectId: 'tick-tack-too-2853c',
    storageBucket: 'tick-tack-too-2853c.appspot.com',
    iosBundleId: 'com.example.tickTackToo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAZqGvAcRicxBg_vgIpYaenggQvTC2rHJ4',
    appId: '1:994018426562:ios:8593cfb29bddae1828455b',
    messagingSenderId: '994018426562',
    projectId: 'tick-tack-too-2853c',
    storageBucket: 'tick-tack-too-2853c.appspot.com',
    iosBundleId: 'com.example.tickTackToo.RunnerTests',
  );
}
