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
    apiKey: 'AIzaSyBK0F6cYSKUXy8M-foMzYxdZXbfb_o_Ztk',
    appId: '1:343876007903:web:29dd06e5062c06c7df766a',
    messagingSenderId: '343876007903',
    projectId: 'betterhero-830a0',
    authDomain: 'betterhero-830a0.firebaseapp.com',
    storageBucket: 'betterhero-830a0.appspot.com',
    measurementId: 'G-TDB2BN7D0N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZEgMNdCT3HeNsXpVhSWTzicQ38pYi8gY',
    appId: '1:343876007903:android:499a458746c1e06adf766a',
    messagingSenderId: '343876007903',
    projectId: 'betterhero-830a0',
    storageBucket: 'betterhero-830a0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAgYyaYo77aDyLoYTq5u0Az45Qs5sijR90',
    appId: '1:343876007903:ios:9c63a3d7a0769b91df766a',
    messagingSenderId: '343876007903',
    projectId: 'betterhero-830a0',
    storageBucket: 'betterhero-830a0.appspot.com',
    iosClientId: '343876007903-7pa13dbrchd4ppo6ljuidq4368bm2ehq.apps.googleusercontent.com',
    iosBundleId: 'com.example.betterheroapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAgYyaYo77aDyLoYTq5u0Az45Qs5sijR90',
    appId: '1:343876007903:ios:9c63a3d7a0769b91df766a',
    messagingSenderId: '343876007903',
    projectId: 'betterhero-830a0',
    storageBucket: 'betterhero-830a0.appspot.com',
    iosClientId: '343876007903-7pa13dbrchd4ppo6ljuidq4368bm2ehq.apps.googleusercontent.com',
    iosBundleId: 'com.example.betterheroapp',
  );
}