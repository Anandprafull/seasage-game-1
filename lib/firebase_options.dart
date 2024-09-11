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
    apiKey: 'AIzaSyC10EE4VHmK-mrQEamuSC4-tLYIk86HE_E',
    appId: '1:950280277458:web:2d62bc7254aa0859118c0b',
    messagingSenderId: '950280277458',
    projectId: 'plastic-dive',
    authDomain: 'plastic-dive.firebaseapp.com',
    storageBucket: 'plastic-dive.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBi1EIny4VCSK-NiTXfqliln0RPKPSUqM8',
    appId: '1:950280277458:android:59ed587b07c9d2f7118c0b',
    messagingSenderId: '950280277458',
    projectId: 'plastic-dive',
    storageBucket: 'plastic-dive.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBVHMcu0H59hkrfynq3aZPIpi2IEetQBg0',
    appId: '1:950280277458:ios:b6c0b79a7d0a9b76118c0b',
    messagingSenderId: '950280277458',
    projectId: 'plastic-dive',
    storageBucket: 'plastic-dive.appspot.com',
    iosBundleId: 'com.nomaddev.plasticDiver',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBVHMcu0H59hkrfynq3aZPIpi2IEetQBg0',
    appId: '1:950280277458:ios:fe16149d03db28b8118c0b',
    messagingSenderId: '950280277458',
    projectId: 'plastic-dive',
    storageBucket: 'plastic-dive.appspot.com',
    iosBundleId: 'com.nomaddev.plasticDiver.RunnerTests',
  );
}