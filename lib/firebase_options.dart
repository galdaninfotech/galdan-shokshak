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
    apiKey: 'AIzaSyAlD9XQjCEbjoUgiV532f3LlArmZakWY4c',
    appId: '1:474428731021:web:6d7ec98fa0c4b39b237cc4',
    messagingSenderId: '474428731021',
    projectId: 'shopsie1',
    authDomain: 'shopsie1.firebaseapp.com',
    storageBucket: 'shopsie1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBrlv_ZQxpup6uvElh8wZA19VoIci3Jet4',
    appId: '1:474428731021:android:0dc1b9ba75ed347b237cc4',
    messagingSenderId: '474428731021',
    projectId: 'shopsie1',
    storageBucket: 'shopsie1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyABaOwG8t66oSn1IjtPdKkryrHlEubTLWQ',
    appId: '1:474428731021:ios:efa757f71f8114f5237cc4',
    messagingSenderId: '474428731021',
    projectId: 'shopsie1',
    storageBucket: 'shopsie1.appspot.com',
    androidClientId: '474428731021-ocu25pr5633tci8q7q64g549n3d58ppq.apps.googleusercontent.com',
    iosClientId: '474428731021-14abe2puat5tu5rkvfjjeba0gppjhfkt.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterFirebaseLogin',
  );
}
