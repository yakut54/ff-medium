import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'debug_internet_connection_checker_model.dart';
export 'debug_internet_connection_checker_model.dart';

class DebugInternetConnectionCheckerWidget extends StatefulWidget {
  const DebugInternetConnectionCheckerWidget({super.key});

  static String routeName = 'DebugInternetConnectionChecker';
  static String routePath = '/debugInternetConnectionChecker';

  @override
  State<DebugInternetConnectionCheckerWidget> createState() =>
      _DebugInternetConnectionCheckerWidgetState();
}

class _DebugInternetConnectionCheckerWidgetState
    extends State<DebugInternetConnectionCheckerWidget> {
  late DebugInternetConnectionCheckerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DebugInternetConnectionCheckerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
            'InternetConnectionChecker',
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Vela Sans',
                  fontSize: 16.0,
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
              decoration: BoxDecoration(),
              child: FFButtonWidget(
                onPressed: FFAppState().hasInternetConnection
                    ? null
                    : () async {
                        await action_blocks.notConnectedSnackBar(context);
                      },
                text: 'Action',
                options: FFButtonOptions(
                  width: 200.0,
                  height: 200.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).success,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Vela Sans',
                        color: Colors.white,
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(100.0),
                  disabledColor: FlutterFlowTheme.of(context).error,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
