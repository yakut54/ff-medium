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

// Получает список документов категорий из медитации

Future<List<CategoriesRecord>> coursesGetCategories(
    CoursesRecord coursesDoc) async {
  List<Future<DocumentSnapshot>> addFutures = [];

  coursesDoc.categories.forEach((element) => addFutures.add(element.get()));

  final result = await Future.wait(addFutures);
  List<CategoriesRecord> list = [];
  result.forEach((element) => list.add(CategoriesRecord.fromSnapshot(element)));
  return list;
}
