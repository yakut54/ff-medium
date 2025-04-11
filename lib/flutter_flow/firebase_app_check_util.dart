import 'package:firebase_app_check/firebase_app_check.dart';

Future initializeFirebaseAppCheck() => FirebaseAppCheck.instance.activate(
      webProvider: ReCaptchaEnterpriseProvider(
          '6LeKLZgpAAAAAM4pYAVBnsIFoVcjhBfI4FgniGq1'),
      androidProvider: AndroidProvider.playIntegrity,
    );
