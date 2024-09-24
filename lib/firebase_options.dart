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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyARRr-2TItMYUUg2omrLbN1ES06yqOT9WU',
    appId: '1:148474411029:android:72c2452a19adb43569761c',
    messagingSenderId: '148474411029',
    projectId: 'test-firebase-sign',
    storageBucket: 'test-firebase-sign.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDF9b_SnupOQmNVlcA6aBQDWef4Ex5VKmw',
    appId: '1:148474411029:ios:59c4e251c5aaa1ad69761c',
    messagingSenderId: '148474411029',
    projectId: 'test-firebase-sign',
    storageBucket: 'test-firebase-sign.appspot.com',
    androidClientId: '148474411029-ahm3ndd9mp30e279j2gi5tfn8reoqki6.apps.googleusercontent.com',
    iosClientId: '148474411029-qa5sjo03qji5k6isssud0ahsama7ev0f.apps.googleusercontent.com',
    iosBundleId: 'com.example.taskLoginProvider',
  );
}