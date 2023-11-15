import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBV6Ay7bbyHSWjGtzFGaNuHuXahuV6ZBXU",
            authDomain: "nit-student.firebaseapp.com",
            projectId: "nit-student",
            storageBucket: "nit-student.appspot.com",
            messagingSenderId: "826309155293",
            appId: "1:826309155293:web:1c9e5d28857d099dc03e34",
            measurementId: "G-75H357R3B4"));
  } else {
    await Firebase.initializeApp();
  }
}
