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

  // ignore: missing_required_param
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDzrGVe5WGcdS72kuZCDaZeOpTLJZ7Chaw',
    appId: '1:653188326865:web:1553bed0a4ea68643cecf0',
    messagingSenderId: '653188326865',
    projectId: 'publication-d-annonce',
    authDomain: 'publication-d-annonce.firebaseapp.com',
    storageBucket: 'publication-d-annonce.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAAdsGETVTWx3HZPJ497MRbTN5KGCkVc9A',
    appId: '1:653188326865:android:3f0f23c3f12caf4d3cecf0',
    messagingSenderId: '653188326865',
    projectId: 'publication-d-annonce',
    storageBucket: 'publication-d-annonce.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA7_QoYn57zKb96oWAp4e7ubEcoM1e_Qvc',
    appId: '1:653188326865:ios:acc8ef57540782e13cecf0',
    messagingSenderId: '653188326865',
    projectId: 'publication-d-annonce',
    storageBucket: 'publication-d-annonce.appspot.com',
    androidClientId:
        '653188326865-vfi6kifh7l9i3ie6m67h70n447kpr20b.apps.googleusercontent.com',
    iosClientId:
        '653188326865-4safodku67uoocfvgceouj8694ave8rq.apps.googleusercontent.com',
    iosBundleId: 'com.example.localads',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA7_QoYn57zKb96oWAp4e7ubEcoM1e_Qvc',
    appId: '1:653188326865:ios:acc8ef57540782e13cecf0',
    messagingSenderId: '653188326865',
    projectId: 'publication-d-annonce',
    storageBucket: 'publication-d-annonce.appspot.com',
    androidClientId:
        '653188326865-vfi6kifh7l9i3ie6m67h70n447kpr20b.apps.googleusercontent.com',
    iosClientId:
        '653188326865-4safodku67uoocfvgceouj8694ave8rq.apps.googleusercontent.com',
    iosBundleId: 'com.example.localads',
  );
}