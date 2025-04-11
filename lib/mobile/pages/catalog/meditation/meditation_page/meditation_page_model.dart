import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/pages/catalog/meditation/widgets/meditation_play_button/meditation_play_button_widget.dart';
import '/index.dart';
import 'meditation_page_widget.dart' show MeditationPageWidget;
import 'package:flutter/material.dart';

class MeditationPageModel extends FlutterFlowModel<MeditationPageWidget> {
  ///  Local state fields for this page.

  Color col = Color(0);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - userViewLesson] action in Row widget.
  List<LessonStruct>? listVideo;
  // Stores action output result for [Custom Action - userViewLesson] action in Row widget.
  List<LessonStruct>? listPDF;
  // Model for MeditationPlayButton component.
  late MeditationPlayButtonModel meditationPlayButtonModel;

  @override
  void initState(BuildContext context) {
    meditationPlayButtonModel =
        createModel(context, () => MeditationPlayButtonModel());
  }

  @override
  void dispose() {
    meditationPlayButtonModel.dispose();
  }
}
