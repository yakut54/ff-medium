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

// Добавление курса в онбординги и категории

Future coursesAddToOnbAndCat(
  CoursesRecord courseDoc,
) async {
  List<Future<void>> addFutures = [];

  for (DocumentReference ref in courseDoc.categories) {
    addFutures.add(ref.update({
      'courses': FieldValue.arrayUnion([courseDoc.reference])
    }));
  }
  for (DocumentReference ref in courseDoc.onboardings) {
    addFutures.add(ref.update({
      'courses': FieldValue.arrayUnion([courseDoc.reference])
    }));
  }

  await Future.wait(addFutures);
}
