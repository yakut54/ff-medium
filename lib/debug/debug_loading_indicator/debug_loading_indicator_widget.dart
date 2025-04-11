import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'debug_loading_indicator_model.dart';
export 'debug_loading_indicator_model.dart';

class DebugLoadingIndicatorWidget extends StatefulWidget {
  const DebugLoadingIndicatorWidget({super.key});

  static String routeName = 'DebugLoadingIndicator';
  static String routePath = '/debugLoadingIndicator';

  @override
  State<DebugLoadingIndicatorWidget> createState() =>
      _DebugLoadingIndicatorWidgetState();
}

class _DebugLoadingIndicatorWidgetState
    extends State<DebugLoadingIndicatorWidget> {
  late DebugLoadingIndicatorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DebugLoadingIndicatorModel());

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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  custom_widgets.MartaNGLoading(
                    width: 32.0,
                    height: 32.0,
                    message: null,
                  ),
                ].divide(SizedBox(height: 50.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
