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

// Получает список медитаций из категории

Future<List<MeditationsRecord>> meditationsGetDocsFromCategory(
    CategoriesRecord categoryDoc) async {
  List<Future<DocumentSnapshot>> addFutures = [];

  categoryDoc.meditations.forEach((element) => addFutures.add(element.get()));

  final result = await Future.wait(addFutures);
  List<MeditationsRecord> list = [];
  result
      .forEach((element) => list.add(MeditationsRecord.fromSnapshot(element)));
  return list;
}
