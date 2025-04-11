import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/pages/catalog/course/widgets/course_play_button/course_play_button_widget.dart';
import '/index.dart';
import 'course_page_widget.dart' show CoursePageWidget;
import 'package:flutter/material.dart';

class CoursePageModel extends FlutterFlowModel<CoursePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - userViewLesson] action in Row widget.
  List<LessonStruct>? listVideo;
  // Stores action output result for [Custom Action - userViewLesson] action in Row widget.
  List<LessonStruct>? listPDF;
  // Model for CoursePlayButton component.
  late CoursePlayButtonModel coursePlayButtonModel1;
  // Model for CoursePlayButton component.
  late CoursePlayButtonModel coursePlayButtonModel2;

  @override
  void initState(BuildContext context) {
    coursePlayButtonModel1 =
        createModel(context, () => CoursePlayButtonModel());
    coursePlayButtonModel2 =
        createModel(context, () => CoursePlayButtonModel());
  }

  @override
  void dispose() {
    coursePlayButtonModel1.dispose();
    coursePlayButtonModel2.dispose();
  }
}
