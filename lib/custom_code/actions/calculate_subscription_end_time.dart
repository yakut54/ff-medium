// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:medium/auth/firebase_auth/auth_util.dart';

Future<DateTime?> calculateSubscriptionEndTime() async {
  DateTime? subscriptionEndTime;
  final db = FirebaseFirestore.instance;
  await AppRecord.getDocumentOnce(db.doc('app/settings')).then(
    (doc) {
      final period = doc.guestTier.period;
      subscriptionEndTime =
          currentUserDocument?.createdTime?.add(Duration(hours: period));
    },
  );
  return subscriptionEndTime;
}
