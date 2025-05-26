import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCOslrE6JC1Ob6d6TTGYf0W9REDy2fo2DA",
            authDomain: "ejercicio2-5b9d0.firebaseapp.com",
            projectId: "ejercicio2-5b9d0",
            storageBucket: "ejercicio2-5b9d0.firebasestorage.app",
            messagingSenderId: "421956434706",
            appId: "1:421956434706:web:4bb045a4c6c3e62b5a51cb"));
  } else {
    await Firebase.initializeApp();
  }
}
