import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.windows:
        return windows;
      default:
        return web;
    }
  }

  // Web Configuration
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDI9t5A121q6MSFA1HuiztrvbLWQFQjia4',
    appId: '1:1009155002224:web:441264cd3b50785d7ec9b5',
    messagingSenderId: '1009155002224',
    projectId: 'flutter-project-8a5e1',
    authDomain: 'flutter-project-8a5e1.firebaseapp.com',
    storageBucket: 'flutter-project-8a5e1.firebasestorage.app',
    measurementId: 'G-ZC0LJPZ2NC',
  );

  // Android Configuration (from your google-services.json)
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyArAWRtk1RO9XvXi5heQv_iiAURsHB-oCg',
    appId: '1:1009155002224:android:9b4c3ef3ad52dd667ec9b5',
    messagingSenderId: '1009155002224',
    projectId: 'flutter-project-8a5e1',
    storageBucket: 'flutter-project-8a5e1.firebasestorage.app',
  );

  // Windows Configuration (using same as web)
  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDI9t5A121q6MSFA1HuiztrvbLWQFQjia4',
    appId: '1:1009155002224:web:441264cd3b50785d7ec9b5',
    messagingSenderId: '1009155002224',
    projectId: 'flutter-project-8a5e1',
    authDomain: 'flutter-project-8a5e1.firebaseapp.com',
    storageBucket: 'flutter-project-8a5e1.firebasestorage.app',
  );
}
