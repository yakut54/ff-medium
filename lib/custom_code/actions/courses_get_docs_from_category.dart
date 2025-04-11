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

// Получает список курсов из категории

Future<List<CoursesRecord>> coursesGetDocsFromCategory(
    CategoriesRecord categoryDoc) async {
  List<Future<DocumentSnapshot>> addFutures = [];

  categoryDoc.courses.forEach((element) => addFutures.add(element.get()));

  final result = await Future.wait(addFutures);
  List<CoursesRecord> list = [];
  result.forEach((element) => list.add(CoursesRecord.fromSnapshot(element)));
  return list;
}
