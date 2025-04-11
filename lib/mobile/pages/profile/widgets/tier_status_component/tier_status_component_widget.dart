import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'tier_status_component_model.dart';
export 'tier_status_component_model.dart';

class TierStatusComponentWidget extends StatefulWidget {
  const TierStatusComponentWidget({super.key});

  @override
  State<TierStatusComponentWidget> createState() =>
      _TierStatusComponentWidgetState();
}

class _TierStatusComponentWidgetState extends State<TierStatusComponentWidget> {
  late TierStatusComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TierStatusComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        Builder(
          builder: (context) {
            if (functions
                    .subscriptionFromJson(FFAppState().subscriptionSnapshot)
                    ?.status ==
                Tier.premium) {
              return Container(
                width: 343.0,
                height: 83.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFBF2B1), Color(0xFFF4426C)],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(1.0, -1.0),
                    end: AlignmentDirectional(-1.0, 1.0),
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              );
            } else {
              return Container(
                width: 343.0,
                height: 83.0,
                decoration: BoxDecoration(
                  color: Color(0x56F4F8F8),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              );
            }
          },
        ),
        Container(
          width: 343.0,
          height: 83.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/a414e4835acebf77f38249ec28072df4.png',
                                width: 224.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                        Text(
                          '${() {
                            if (functions
                                    .subscriptionFromJson(
                                        FFAppState().subscriptionSnapshot)
                                    ?.status ==
                                Tier.premium) {
                              return 'Подписка активна до ';
                            } else if (functions
                                    .subscriptionFromJson(
                                        FFAppState().subscriptionSnapshot)
                                    ?.status ==
                                Tier.guest) {
                              return 'Гостевой режим ';
                            } else {
                              return 'Подписка не активна ';
                            }
                          }()}${(functions.subscriptionFromJson(FFAppState().subscriptionSnapshot)?.status == Tier.none) || (functions.subscriptionFromJson(FFAppState().subscriptionSnapshot)?.status == Tier.guest) ? ' ' : dateTimeFormat(
                              "dd.MM.yy",
                              functions
                                  .subscriptionFromJson(
                                      FFAppState().subscriptionSnapshot)
                                  ?.subscriptionEndTime,
                              locale: FFLocalizations.of(context).languageCode,
                            )}',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Vela Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                    if (functions
                            .subscriptionFromJson(
                                FFAppState().subscriptionSnapshot)
                            ?.status !=
                        Tier.premium)
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        size: 24.0,
                      ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: SvgPicture.asset(
                    'assets/images/h03kl_.svg',
                    height: double.infinity,
                    fit: BoxFit.contain,
                    alignment: Alignment(1.0, 0.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
