import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'audio_player_model.dart';
export 'audio_player_model.dart';

class AudioPlayerWidget extends StatefulWidget {
  const AudioPlayerWidget({
    super.key,
    this.meditationDoc,
    this.courseDoc,
    required this.lessonIndex,
  });

  final MeditationsRecord? meditationDoc;
  final CoursesRecord? courseDoc;
  final int? lessonIndex;

  static String routeName = 'AudioPlayer';
  static String routePath = '/audioPlayer';

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  late AudioPlayerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AudioPlayerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Visibility(
          visible:
              (widget.meditationDoc != null) || (widget.courseDoc != null),
          child: custom_widgets.MartaNGPlayerController(
            width: double.infinity,
            height: double.infinity,
            initLessonIndex: widget.lessonIndex!,
            courseDoc: widget.courseDoc,
            meditationDoc: widget.meditationDoc,
          ),
        ),
      ),
    );
  }
}
