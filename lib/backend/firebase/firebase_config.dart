import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAKJoNFNLgRCSqMXxCwJFqIdgZm1NIkpHs",
            authDomain: "marta-ng-24fgxr.firebaseapp.com",
            projectId: "marta-ng-24fgxr",
            storageBucket: "marta-ng-24fgxr.appspot.com",
            messagingSenderId: "499722214027",
            appId: "1:499722214027:web:974e4ee32c556b1250128e"));
  } else {
    await Firebase.initializeApp();
  }
}
