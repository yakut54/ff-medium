import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'no_content_model.dart';
export 'no_content_model.dart';

class NoContentWidget extends StatefulWidget {
  const NoContentWidget({
    super.key,
    required this.hideButton,
  });

  final bool? hideButton;

  @override
  State<NoContentWidget> createState() => _NoContentWidgetState();
}

class _NoContentWidgetState extends State<NoContentWidget> {
  late NoContentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoContentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Пока что здесь ничего нет ',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Vela Sans',
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts: false,
                    ),
              ),
              Text(
                'Материалы появятся позже',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Vela Sans',
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      useGoogleFonts: false,
                    ),
              ),
            ].divide(SizedBox(height: 8.0)),
          ),
          if (!widget.hideButton!)
            FFButtonWidget(
              onPressed: () async {
                context.safePop();
              },
              text: 'В каталог',
              options: FFButtonOptions(
                width: 230.0,
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).alternate,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Vela Sans',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      useGoogleFonts: false,
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(14.0),
              ),
            ),
        ].divide(SizedBox(height: 40.0)),
      ),
    );
  }
}
