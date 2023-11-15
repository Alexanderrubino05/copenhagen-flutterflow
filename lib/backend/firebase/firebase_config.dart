import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCJV6a62KCCqSfB0yD5hv0ZuGxa5aBDBLo",
            authDomain: "bc-copenhagen.firebaseapp.com",
            projectId: "bc-copenhagen",
            storageBucket: "bc-copenhagen.appspot.com",
            messagingSenderId: "680555982149",
            appId: "1:680555982149:web:f388c8db7d9e68ee00222c",
            measurementId: "G-C1K91L9LZL"));
  } else {
    await Firebase.initializeApp();
  }
}
