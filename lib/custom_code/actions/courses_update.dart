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

// Обновляет референс курса в категориях и онбордингах

Future coursesUpdate(
  CoursesRecord courseDoc,
  CoursesRecord oldCourseDoc,
) async {
  List<DocumentReference> needDeleteFrom = [];
  List<DocumentReference> needAddTo = [];
  List<Future<void>> addFutures = [];
  List<Future<void>> deleteFutures = [];

  // Categories. Add
  courseDoc.categories.forEach((element) {
    if (!oldCourseDoc.categories.contains(element)) {
      needAddTo.add(element);
    }
    for (DocumentReference ref in needAddTo) {
      addFutures.add(ref.update({
        'courses': FieldValue.arrayUnion([courseDoc.reference])
      }));
    }
  });

  // Categories. Delete
  oldCourseDoc.categories.forEach((element) {
    if (!courseDoc.categories.contains(element)) {
      needDeleteFrom.add(element);
    }
  });
  for (DocumentReference ref in needDeleteFrom) {
    deleteFutures.add(ref.update({
      'courses': FieldValue.arrayRemove([oldCourseDoc.reference])
    }));
  }

  // Onboarding. Add
  courseDoc.onboardings.forEach((element) {
    if (!oldCourseDoc.onboardings.contains(element)) {
      needAddTo.add(element);
    }
  });
  for (DocumentReference ref in needAddTo) {
    addFutures.add(ref.update({
      'courses': FieldValue.arrayUnion([courseDoc.reference])
    }));
  }

  // Onboarding. Delete
  oldCourseDoc.onboardings.forEach((element) {
    if (!courseDoc.onboardings.contains(element)) {
      needDeleteFrom.add(element);
    }
  });
  for (DocumentReference ref in needDeleteFrom) {
    deleteFutures.add(ref.update({
      'courses': FieldValue.arrayRemove([oldCourseDoc.reference])
    }));
  }

  await Future.wait([...addFutures, ...deleteFutures]);
}
