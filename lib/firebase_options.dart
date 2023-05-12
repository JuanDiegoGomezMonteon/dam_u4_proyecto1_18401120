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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDVWdW18j05spfn0aWS9IbvHix-_SCUT_w',
    appId: '1:1053471654382:web:75af83aca9f452ffe10eff',
    messagingSenderId: '1053471654382',
    projectId: 'proyecto1-63479',
    authDomain: 'proyecto1-63479.firebaseapp.com',
    storageBucket: 'proyecto1-63479.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDCjs-DcnLvEkYTXKwtTjhFdpQRI6AR6sI',
    appId: '1:1053471654382:android:726fc885898b9bdde10eff',
    messagingSenderId: '1053471654382',
    projectId: 'proyecto1-63479',
    storageBucket: 'proyecto1-63479.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDksbTDPI4q1riwtnWGrbJQ02lqysifC-A',
    appId: '1:1053471654382:ios:d70a60007bc11c71e10eff',
    messagingSenderId: '1053471654382',
    projectId: 'proyecto1-63479',
    storageBucket: 'proyecto1-63479.appspot.com',
    iosClientId: '1053471654382-4v50kvifb6meg4tld89la87g0ugvna8f.apps.googleusercontent.com',
    iosBundleId: 'com.example.damU4Proyecto118401120',
  );
}
