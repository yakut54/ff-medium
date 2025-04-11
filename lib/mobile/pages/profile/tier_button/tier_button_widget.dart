import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'tier_button_model.dart';
export 'tier_button_model.dart';

class TierButtonWidget extends StatefulWidget {
  const TierButtonWidget({
    super.key,
    required this.buttonType,
    required this.tier,
    required this.amountAfter,
  });

  final TierButtonType? buttonType;
  final TierStruct? tier;
  final int? amountAfter;

  @override
  State<TierButtonWidget> createState() => _TierButtonWidgetState();
}

class _TierButtonWidgetState extends State<TierButtonWidget> {
  late TierButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TierButtonModel());

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
      child: Stack(
        children: [
          Builder(
            builder: (context) {
              if (widget.buttonType == TierButtonType.select) {
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
                    color: Color(0xFFA39C9F),
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
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '7 дней за ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Vela Sans',
                                        color: widget.buttonType ==
                                                TierButtonType.select
                                            ? FlutterFlowTheme.of(context)
                                                .accent1
                                            : FlutterFlowTheme.of(context)
                                                .primary,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: false,
                                      ),
                                ),
                                TextSpan(
                                  text: valueOrDefault<String>(
                                    widget.tier?.price.toString(),
                                    '0',
                                  ),
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: '₽',
                                  style: TextStyle(),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Vela Sans',
                                    color: widget.buttonType ==
                                            TierButtonType.select
                                        ? FlutterFlowTheme.of(context).accent1
                                        : FlutterFlowTheme.of(context).primary,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                          RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'после ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Vela Sans',
                                        color: widget.buttonType ==
                                                TierButtonType.select
                                            ? FlutterFlowTheme.of(context)
                                                .accent1
                                            : FlutterFlowTheme.of(context)
                                                .primary,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: false,
                                      ),
                                ),
                                TextSpan(
                                  text: valueOrDefault<String>(
                                    widget.amountAfter?.toString(),
                                    '0',
                                  ),
                                  style: TextStyle(
                                    color: widget.buttonType ==
                                            TierButtonType.select
                                        ? FlutterFlowTheme.of(context).accent1
                                        : FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                                TextSpan(
                                  text: '₽ в месяц',
                                  style: TextStyle(
                                    color: widget.buttonType ==
                                            TierButtonType.select
                                        ? FlutterFlowTheme.of(context).accent1
                                        : FlutterFlowTheme.of(context).primary,
                                  ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Vela Sans',
                                    color: widget.buttonType ==
                                            TierButtonType.select
                                        ? FlutterFlowTheme.of(context).accent1
                                        : FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Можно отменить в любое время',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Vela Sans',
                              color: widget.buttonType == TierButtonType.select
                                  ? FlutterFlowTheme.of(context).accent1
                                  : FlutterFlowTheme.of(context).primary,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: false,
                            ),
                      ),
                    ].divide(SizedBox(height: 5.0)),
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
      ),
    );
  }
}
