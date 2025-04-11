import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'admin_video_page_model.dart';
export 'admin_video_page_model.dart';

class AdminVideoPageWidget extends StatefulWidget {
  const AdminVideoPageWidget({
    super.key,
    required this.videoUrl,
  });

  final String? videoUrl;

  static String routeName = 'AdminVideoPage';
  static String routePath = '/adminVideoPage';

  @override
  State<AdminVideoPageWidget> createState() => _AdminVideoPageWidgetState();
}

class _AdminVideoPageWidgetState extends State<AdminVideoPageWidget> {
  late AdminVideoPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminVideoPageModel());

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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Предпросмотр',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Vela Sans',
                  color: Colors.black,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  useGoogleFonts: false,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 60.0),
                child: FlutterFlowVideoPlayer(
                  path: widget.videoUrl!,
                  videoType: VideoType.network,
                  width: double.infinity,
                  height: double.infinity,
                  autoPlay: false,
                  looping: false,
                  showControls: true,
                  allowFullScreen: false,
                  allowPlaybackSpeedMenu: false,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
