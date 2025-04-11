import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'tier_button_component_model.dart';
export 'tier_button_component_model.dart';

class TierButtonComponentWidget extends StatefulWidget {
  const TierButtonComponentWidget({
    super.key,
    required this.buttonType,
    required this.tier,
  });

  final TierButtonType? buttonType;
  final TierStruct? tier;

  @override
  State<TierButtonComponentWidget> createState() =>
      _TierButtonComponentWidgetState();
}

class _TierButtonComponentWidgetState extends State<TierButtonComponentWidget> {
  late TierButtonComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TierButtonComponentModel());

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
      width: 172.0,
      height: 187.0,
      decoration: BoxDecoration(),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Stack(
                alignment: AlignmentDirectional(0.0, 1.0),
                children: [
                  Container(
                    width: 172.0,
                    height: 172.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).accent2,
                      borderRadius: BorderRadius.circular(21.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(1.0),
                      child: Builder(
                        builder: (context) {
                          if ((widget.buttonType == TierButtonType.unselect) ||
                              (widget.buttonType == TierButtonType.disabled)) {
                            return Container(
                              width: 170.0,
                              height: 173.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            );
                          } else {
                            return Container(
                              width: 170.0,
                              height: 173.0,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFFBF2B1),
                                    Color(0xFFF4426C)
                                  ],
                                  stops: [0.0, 1.0],
                                  begin: AlignmentDirectional(1.0, -1.0),
                                  end: AlignmentDirectional(-1.0, 1.0),
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 1.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Material(
                          color: Colors.transparent,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                          child: Container(
                            width: 170.0,
                            height: 127.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                              border: Border.all(
                                color: Color(0x00E7E7E7),
                                width: 0.0,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 15.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          widget.tier?.period.toString(),
                                          '1',
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Vela Sans',
                                              color: () {
                                                if (widget.buttonType ==
                                                    TierButtonType.select) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground;
                                                } else if (widget.buttonType ==
                                                    TierButtonType.unselect) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText;
                                                } else {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .accent2;
                                                }
                                              }(),
                                              fontSize: 32.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      functions
                                          .tiersGetTextEnding(widget.tier!),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Vela Sans',
                                            color: () {
                                              if (widget.buttonType ==
                                                  TierButtonType.select) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .secondaryBackground;
                                              } else if (widget.buttonType ==
                                                  TierButtonType.unselect) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .primaryText;
                                              } else {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .accent2;
                                              }
                                            }(),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ],
                                ),
                                RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: valueOrDefault<String>(
                                          widget.tier?.price.toString(),
                                          '0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Vela Sans',
                                              color: () {
                                                if (widget.buttonType ==
                                                    TierButtonType.select) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground;
                                                } else if (widget.buttonType ==
                                                    TierButtonType.unselect) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText;
                                                } else {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .accent2;
                                                }
                                              }(),
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      TextSpan(
                                        text: '₽',
                                        style: TextStyle(
                                          color: () {
                                            if (widget.buttonType ==
                                                TierButtonType.select) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .secondaryBackground;
                                            } else if (widget.buttonType ==
                                                TierButtonType.unselect) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .primaryText;
                                            } else {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .accent2;
                                            }
                                          }(),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0,
                                        ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Vela Sans',
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ].divide(SizedBox(height: 4.0)),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: 170.0,
                            height: 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).accent2,
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                          child: Container(
                            width: 170.0,
                            height: 45.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                              border: Border.all(
                                color: Color(0x00E7E7E7),
                                width: 0.0,
                              ),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: functions
                                          .tiersCalculateAmountPerWeek(
                                              widget.tier!)
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Vela Sans',
                                            color: () {
                                              if (widget.buttonType ==
                                                  TierButtonType.select) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .secondaryBackground;
                                              } else if (widget.buttonType ==
                                                  TierButtonType.unselect) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .secondaryText;
                                              } else {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .accent2;
                                              }
                                            }(),
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    TextSpan(
                                      text: '₽/неделя',
                                      style: TextStyle(
                                        color: () {
                                          if (widget.buttonType ==
                                              TierButtonType.select) {
                                            return FlutterFlowTheme.of(context)
                                                .secondaryBackground;
                                          } else if (widget.buttonType ==
                                              TierButtonType.unselect) {
                                            return FlutterFlowTheme.of(context)
                                                .secondaryText;
                                          } else {
                                            return FlutterFlowTheme.of(context)
                                                .accent2;
                                          }
                                        }(),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.0,
                                      ),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Vela Sans',
                                        color: () {
                                          if (widget.buttonType ==
                                              TierButtonType.select) {
                                            return FlutterFlowTheme.of(context)
                                                .secondaryBackground;
                                          } else if (widget.buttonType ==
                                              TierButtonType.unselect) {
                                            return FlutterFlowTheme.of(context)
                                                .secondaryText;
                                          } else {
                                            return FlutterFlowTheme.of(context)
                                                .accent2;
                                          }
                                        }(),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: false,
                                      ),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (widget.tier?.bannerText != null &&
                widget.tier?.bannerText != '')
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Container(
                  width: 115.0,
                  height: 26.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.tier?.bannerText,
                      '_',
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Vela Sans',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
