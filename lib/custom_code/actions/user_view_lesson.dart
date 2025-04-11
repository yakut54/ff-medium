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

Future<List<LessonStruct>> userViewLesson(LessonStruct lesson,
    List<LessonStruct>? lessons, DocumentReference userRef) async {
  final _lessons = lessons ?? [];
  final index = _lessons.indexOf(lesson);
  if (!_lessons[index].views.contains(userRef)) {
    final viewList = [..._lessons[index].views, userRef];
    _lessons[index].views = viewList;
  }

  return _lessons;
}
