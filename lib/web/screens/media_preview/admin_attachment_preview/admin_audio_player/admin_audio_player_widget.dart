import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'admin_audio_player_model.dart';
export 'admin_audio_player_model.dart';

class AdminAudioPlayerWidget extends StatefulWidget {
  const AdminAudioPlayerWidget({
    super.key,
    required this.audioUrl,
  });

  final String? audioUrl;

  @override
  State<AdminAudioPlayerWidget> createState() => _AdminAudioPlayerWidgetState();
}

class _AdminAudioPlayerWidgetState extends State<AdminAudioPlayerWidget> {
  late AdminAudioPlayerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminAudioPlayerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 400.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).primary,
            width: 10.0,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: AlignmentDirectional(1.0, -1.0),
              child: FlutterFlowIconButton(
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.close_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
            ),
            FlutterFlowAudioPlayer(
              audio: Audio.network(
                widget.audioUrl!,
                metas: Metas(
                  title: 'Аудио',
                ),
              ),
              titleTextStyle: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: 'Vela Sans',
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
              playbackDurationTextStyle:
                  FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Vela Sans',
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
              playbackButtonColor: FlutterFlowTheme.of(context).primary,
              activeTrackColor: FlutterFlowTheme.of(context).alternate,
              elevation: 4.0,
              playInBackground: PlayInBackground.enabled,
            ),
          ].divide(SizedBox(height: 20.0)),
        ),
      ),
    );
  }
}
