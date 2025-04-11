import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'p_d_f_view_page_model.dart';
export 'p_d_f_view_page_model.dart';

class PDFViewPageWidget extends StatefulWidget {
  const PDFViewPageWidget({
    super.key,
    required this.docPath,
    required this.title,
  });

  final String? docPath;
  final String? title;

  static String routeName = 'PDFViewPage';
  static String routePath = '/pDFViewPage';

  @override
  State<PDFViewPageWidget> createState() => _PDFViewPageWidgetState();
}

class _PDFViewPageWidgetState extends State<PDFViewPageWidget> {
  late PDFViewPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PDFViewPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.lockOrientation(
        false,
      );
    });

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
              size: 24.0,
            ),
            onPressed: () async {
              await actions.lockOrientation(
                true,
              );
              context.pop();
            },
          ),
          title: Text(
            valueOrDefault<String>(
              widget.title,
              '_',
            ).maybeHandleOverflow(
              maxChars: 20,
              replacement: '…',
            ),
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
          child: FlutterFlowPdfViewer(
            networkPath: widget.docPath!,
            height: double.infinity,
            horizontalScroll: false,
          ),
        ),
      ),
    );
  }
}
