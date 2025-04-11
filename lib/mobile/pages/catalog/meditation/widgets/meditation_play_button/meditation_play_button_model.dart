import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'meditation_play_button_widget.dart' show MeditationPlayButtonWidget;
import 'package:flutter/material.dart';

class MeditationPlayButtonModel
    extends FlutterFlowModel<MeditationPlayButtonWidget> {
  ///  Local state fields for this component.

  ContentType? nextCourse = ContentType.none;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - userViewLesson] action in Button widget.
  List<LessonStruct>? listVideo;
  // Stores action output result for [Custom Action - userViewLesson] action in Button widget.
  List<LessonStruct>? listDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
