import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'profile_item_component_model.dart';
export 'profile_item_component_model.dart';

class ProfileItemComponentWidget extends StatefulWidget {
  const ProfileItemComponentWidget({
    super.key,
    required this.label,
    required this.showArrow,
  });

  final String? label;
  final bool? showArrow;

  @override
  State<ProfileItemComponentWidget> createState() =>
      _ProfileItemComponentWidgetState();
}

class _ProfileItemComponentWidgetState
    extends State<ProfileItemComponentWidget> {
  late ProfileItemComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileItemComponentModel());

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
      height: 50.0,
      decoration: BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              valueOrDefault<String>(
                widget.label,
                '[TEXT]',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Vela Sans',
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts: false,
                  ),
            ),
          ),
          if (widget.showArrow ?? true)
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
        ],
      ),
    );
  }
}
