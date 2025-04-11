import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'empty_filter_model.dart';
export 'empty_filter_model.dart';

class EmptyFilterWidget extends StatefulWidget {
  const EmptyFilterWidget({
    super.key,
    required this.action,
  });

  final Future Function()? action;

  @override
  State<EmptyFilterWidget> createState() => _EmptyFilterWidgetState();
}

class _EmptyFilterWidgetState extends State<EmptyFilterWidget> {
  late EmptyFilterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyFilterModel());

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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'По Вашему запросу ничего не найдено',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Vela Sans',
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  useGoogleFonts: false,
                ),
          ),
          FFButtonWidget(
            onPressed: () async {
              await widget.action?.call();
            },
            text: 'Сбросить все фильтры',
            options: FFButtonOptions(
              height: 40.0,
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
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
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ].divide(SizedBox(height: 40.0)),
      ),
    );
  }
}
