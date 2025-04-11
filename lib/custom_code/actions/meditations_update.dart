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

import 'dart:math';

// Обновляет референс медитации в категориях и онбордингах

Future meditationsUpdate(
  MeditationsRecord meditationDoc,
  MeditationsRecord oldMeditationDoc,
) async {
  List<DocumentReference> needDeleteFrom = [];
  List<DocumentReference> needAddTo = [];
  List<Future<void>> addFutures = [];
  List<Future<void>> deleteFutures = [];

  // Categories. Add
  meditationDoc.categories.forEach((element) {
    if (!oldMeditationDoc.categories.contains(element)) {
      needAddTo.add(element);
    }
    for (DocumentReference ref in needAddTo) {
      addFutures.add(ref.update({
        'meditations': FieldValue.arrayUnion([meditationDoc.reference])
      }));
    }
  });

  // Categories. Delete
  oldMeditationDoc.categories.forEach((element) {
    if (!meditationDoc.categories.contains(element)) {
      needDeleteFrom.add(element);
    }
  });
  for (DocumentReference ref in needDeleteFrom) {
    deleteFutures.add(ref.update({
      'meditations': FieldValue.arrayRemove([oldMeditationDoc.reference])
    }));
  }

  // Onboarding. Add
  meditationDoc.onboardings.forEach((element) {
    if (!oldMeditationDoc.onboardings.contains(element)) {
      needAddTo.add(element);
    }
  });
  for (DocumentReference ref in needAddTo) {
    addFutures.add(ref.update({
      'meditations': FieldValue.arrayUnion([meditationDoc.reference])
    }));
  }

  // Onboarding. Delete
  oldMeditationDoc.onboardings.forEach((element) {
    if (!meditationDoc.onboardings.contains(element)) {
      needDeleteFrom.add(element);
    }
  });
  for (DocumentReference ref in needDeleteFrom) {
    deleteFutures.add(ref.update({
      'meditations': FieldValue.arrayRemove([oldMeditationDoc.reference])
    }));
  }

  await Future.wait([...addFutures, ...deleteFutures]);
}
