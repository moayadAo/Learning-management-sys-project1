// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCjmRoKcmXPIOjFtrQnjIaXYan3qdnd60U',
    appId: '1:45990512936:web:c74fc6e41e6e018d2fe81d',
    messagingSenderId: '45990512936',
    projectId: 'lms7-92a1e',
    authDomain: 'lms7-92a1e.firebaseapp.com',
    storageBucket: 'lms7-92a1e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDmezzYdaJCMZdayMl3DZKAAa_Ke7io3kc',
    appId: '1:45990512936:android:283dc95b42cd47642fe81d',
    messagingSenderId: '45990512936',
    projectId: 'lms7-92a1e',
    storageBucket: 'lms7-92a1e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCppmaj_Cum2fPss9LOK3OEpOsoLakmoP0',
    appId: '1:45990512936:ios:7f2ca5feec5846002fe81d',
    messagingSenderId: '45990512936',
    projectId: 'lms7-92a1e',
    storageBucket: 'lms7-92a1e.appspot.com',
    iosBundleId: 'com.example.learningSystem',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCppmaj_Cum2fPss9LOK3OEpOsoLakmoP0',
    appId: '1:45990512936:ios:7f2ca5feec5846002fe81d',
    messagingSenderId: '45990512936',
    projectId: 'lms7-92a1e',
    storageBucket: 'lms7-92a1e.appspot.com',
    iosBundleId: 'com.example.learningSystem',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCjmRoKcmXPIOjFtrQnjIaXYan3qdnd60U',
    appId: '1:45990512936:web:eb1d94e907ae6ce62fe81d',
    messagingSenderId: '45990512936',
    projectId: 'lms7-92a1e',
    authDomain: 'lms7-92a1e.firebaseapp.com',
    storageBucket: 'lms7-92a1e.appspot.com',
  );
}
