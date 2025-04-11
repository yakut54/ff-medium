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

// Удаляет категории из медитаций и курсов

Future categoriesDeleteRefs(
  DocumentReference categoryRef,
) async {
  final db = FirebaseFirestore.instance;
  // Delete from 'categories/meditation'

  final meditationsCollectionName = 'meditations';
  final coursesCollectionName = 'courses';
  final categoriesCollectionName = 'categories';

// Delete category from medidations
  final meditationsQuery = await db
      .collection(meditationsCollectionName)
      .where(categoriesCollectionName, arrayContains: categoryRef)
      .get();
  if (meditationsQuery.size > 0) {
    meditationsQuery.docs.forEach((doc) => doc.reference.update({
          categoriesCollectionName: FieldValue.arrayRemove([categoryRef])
        }));
  }
// Delete category from courses
  final coursesQuery = await db
      .collection(coursesCollectionName)
      .where(categoriesCollectionName, arrayContains: categoryRef)
      .get();
  if (coursesQuery.size > 0) {
    coursesQuery.docs.forEach((doc) => doc.reference.update({
          categoriesCollectionName: FieldValue.arrayRemove([categoryRef])
        }));
  }
}
