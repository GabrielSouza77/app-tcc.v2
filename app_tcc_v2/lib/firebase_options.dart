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
    apiKey: 'AIzaSyC7irJTg2cD5E4kKB2WHOA-tWNiaOnDda8',
    appId: '1:697044404820:web:fbcd62dbd605219b55bbc1',
    messagingSenderId: '697044404820',
    projectId: 'app-tcc-9e7bc',
    authDomain: 'app-tcc-9e7bc.firebaseapp.com',
    storageBucket: 'app-tcc-9e7bc.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCNnCmCPzKSYvY1bS8CSok2JmRTBgppwGA',
    appId: '1:697044404820:android:f2781d2e01ba040355bbc1',
    messagingSenderId: '697044404820',
    projectId: 'app-tcc-9e7bc',
    storageBucket: 'app-tcc-9e7bc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCgns9uSzAqTwDimcmxDa6hnqdIrYaWt_Y',
    appId: '1:697044404820:ios:0e20e4292f0022a555bbc1',
    messagingSenderId: '697044404820',
    projectId: 'app-tcc-9e7bc',
    storageBucket: 'app-tcc-9e7bc.appspot.com',
    iosClientId: '697044404820-tp61ftdjcmed94rgrt9ii39fnureku2a.apps.googleusercontent.com',
    iosBundleId: 'com.example.apptcc',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCgns9uSzAqTwDimcmxDa6hnqdIrYaWt_Y',
    appId: '1:697044404820:ios:0e20e4292f0022a555bbc1',
    messagingSenderId: '697044404820',
    projectId: 'app-tcc-9e7bc',
    storageBucket: 'app-tcc-9e7bc.appspot.com',
    iosClientId: '697044404820-tp61ftdjcmed94rgrt9ii39fnureku2a.apps.googleusercontent.com',
    iosBundleId: 'com.example.apptcc',
  );
}
