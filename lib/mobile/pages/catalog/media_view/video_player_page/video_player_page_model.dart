import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'video_player_page_widget.dart' show VideoPlayerPageWidget;
import 'package:flutter/material.dart';

class VideoPlayerPageModel extends FlutterFlowModel<VideoPlayerPageWidget> {
  ///  Local state fields for this page.

  LessonStruct? lesson;
  void updateLessonStruct(Function(LessonStruct) updateFn) {
    updateFn(lesson ??= LessonStruct());
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
