import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/pages/profile/tier_button/tier_button_widget.dart';
import '/mobile/pages/profile/tier_button_component/tier_button_component_widget.dart';
import '/web/screens/tiers/c_e_cloud_payments_keys/c_e_cloud_payments_keys_widget.dart';
import '/web/screens/tiers/c_e_guest_tier/c_e_guest_tier_widget.dart';
import '/web/screens/tiers/c_e_primary_tier/c_e_primary_tier_widget.dart';
import '/web/screens/tiers/c_e_secondary_tier/c_e_secondary_tier_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'tiers_screen_model.dart';
export 'tiers_screen_model.dart';

class TiersScreenWidget extends StatefulWidget {
  const TiersScreenWidget({super.key});

  @override
  State<TiersScreenWidget> createState() => _TiersScreenWidgetState();
}

class _TiersScreenWidgetState extends State<TiersScreenWidget> {
  late TiersScreenModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TiersScreenModel());

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
      child: StreamBuilder<AppRecord>(
        stream: AppRecord.getDocument(functions.appRecordGetReference()),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 32.0,
                height: 32.0,
                child: SpinKitHourGlass(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  size: 32.0,
                ),
              ),
            );
          }

          final containerAppRecord = snapshot.data!;

          return Container(
            decoration: BoxDecoration(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).accent3,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 10.0, 20.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Гостевой доступ:',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Vela Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: false,
                                      ),
                                ),
                                Text(
                                  containerAppRecord.guestTier.period
                                      .toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Vela Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: false,
                                      ),
                                ),
                                Text(
                                  functions.tiersGetTextEnding(
                                      containerAppRecord.guestTier),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Vela Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ].divide(SizedBox(width: 10.0)),
                            ),
                            FlutterFlowIconButton(
                              borderRadius: 20.0,
                              buttonSize: 40.0,
                              fillColor: Color(0x3FFFFFFF),
                              icon: Icon(
                                Icons.edit,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: CEGuestTierWidget(
                                        guestTier: containerAppRecord.guestTier,
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(
                                    () => _model.guestTier = value));

                                await containerAppRecord.reference
                                    .update(createAppRecordData(
                                  guestTier: updateTierStruct(
                                    _model.guestTier,
                                    clearUnsetFields: false,
                                  ),
                                ));

                                safeSetState(() {});
                              },
                            ),
                          ].divide(SizedBox(width: 15.0)),
                        ),
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      final primary = containerAppRecord.tiers.toList();

                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(primary.length, (primaryIndex) {
                          final primaryItem = primary[primaryIndex];
                          return Visibility(
                            visible: primaryItem.isPrimary,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 5.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).accent3,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 5.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.currentIndex = primaryIndex;
                                          safeSetState(() {});
                                        },
                                        child: TierButtonComponentWidget(
                                          key: Key(
                                              'Key7yh_${primaryIndex}_of_${primary.length}'),
                                          buttonType: primaryIndex ==
                                                  _model.currentIndex
                                              ? TierButtonType.select
                                              : TierButtonType.unselect,
                                          tier: primaryItem,
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderRadius: 20.0,
                                        buttonSize: 40.0,
                                        fillColor: Color(0x3FFFFFFF),
                                        icon: Icon(
                                          Icons.edit,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          _model.currentIndex = primaryIndex;
                                          safeSetState(() {});
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: CEPrimaryTierWidget(
                                                  tier: primaryItem,
                                                ),
                                              );
                                            },
                                          ).then((value) => safeSetState(() =>
                                              _model.primaryTier = value));

                                          await containerAppRecord.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'tiers':
                                                    getTierListFirestoreData(
                                                  functions.tierUpdateList(
                                                      _model.currentIndex,
                                                      _model.primaryTier!,
                                                      containerAppRecord.tiers
                                                          .toList()),
                                                ),
                                              },
                                            ),
                                          });

                                          safeSetState(() {});
                                        },
                                      ),
                                    ]
                                        .divide(SizedBox(height: 5.0))
                                        .around(SizedBox(height: 5.0)),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                  Builder(
                    builder: (context) {
                      final secondary = containerAppRecord.tiers.toList();

                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children:
                            List.generate(secondary.length, (secondaryIndex) {
                          final secondaryItem = secondary[secondaryIndex];
                          return Visibility(
                            visible: !secondaryItem.isPrimary,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 5.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.currentIndex = secondaryIndex;
                                          safeSetState(() {});
                                        },
                                        child: TierButtonWidget(
                                          key: Key(
                                              'Keysa8_${secondaryIndex}_of_${secondary.length}'),
                                          buttonType: _model.currentIndex ==
                                                  secondaryIndex
                                              ? TierButtonType.select
                                              : TierButtonType.unselect,
                                          tier: secondaryItem,
                                          amountAfter: valueOrDefault<int>(
                                            containerAppRecord
                                                .tiers.firstOrNull?.price,
                                            299,
                                          ),
                                        ),
                                      ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 20.0,
                                      buttonSize: 40.0,
                                      fillColor: Color(0x3FFFFFFF),
                                      icon: Icon(
                                        Icons.edit,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        _model.currentIndex = secondaryIndex;
                                        safeSetState(() {});
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: CESecondaryTierWidget(
                                                tier: secondaryItem,
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() =>
                                            _model.secondaryTier = value));

                                        await containerAppRecord.reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'tiers': getTierListFirestoreData(
                                                functions.tierUpdateList(
                                                    _model.currentIndex,
                                                    _model.secondaryTier!,
                                                    containerAppRecord.tiers
                                                        .toList()),
                                              ),
                                            },
                                          ),
                                        });

                                        safeSetState(() {});
                                      },
                                    ),
                                  ]
                                      .divide(SizedBox(width: 5.0))
                                      .around(SizedBox(width: 5.0)),
                                ),
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).accent3,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Ключи CloudPayments',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Vela Sans',
                                    color: FlutterFlowTheme.of(context).accent1,
                                    fontSize: 22.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 5.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 30.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent1,
                                          icon: Icon(
                                            Icons.content_copy_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 12.0,
                                          ),
                                          onPressed: () async {
                                            await Clipboard.setData(
                                                ClipboardData(
                                                    text: containerAppRecord
                                                        .keys
                                                        .cloudpayments
                                                        .publicId));
                                          },
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 5.0, 10.0, 5.0),
                                            child: Text(
                                              containerAppRecord
                                                  .keys.cloudpayments.publicId,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Vela Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 5.0)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 30.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent1,
                                          icon: Icon(
                                            Icons.content_copy_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 12.0,
                                          ),
                                          onPressed: () async {
                                            await Clipboard.setData(
                                                ClipboardData(
                                                    text: containerAppRecord
                                                        .keys
                                                        .cloudpayments
                                                        .password));
                                          },
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 5.0, 10.0, 5.0),
                                            child: Text(
                                              (String input) {
                                                return '${input.substring(0, 4)}************************${input.substring(input.length - 4)}';
                                              }(containerAppRecord
                                                  .keys.cloudpayments.password),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Vela Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 5.0)),
                                    ),
                                  ]
                                      .divide(SizedBox(height: 10.0))
                                      .around(SizedBox(height: 10.0)),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 20.0,
                                  buttonSize: 40.0,
                                  fillColor: Color(0x3FFFFFFF),
                                  icon: Icon(
                                    Icons.edit,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: CECloudPaymentsKeysWidget(
                                            cpKeys: containerAppRecord
                                                .keys.cloudpayments,
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(
                                        () => _model.cpKeys = value));

                                    await containerAppRecord.reference
                                        .update(createAppRecordData(
                                      keys: updateEquiringKeysStruct(
                                        EquiringKeysStruct(
                                          cloudpayments: _model.cpKeys,
                                        ),
                                        clearUnsetFields: false,
                                      ),
                                    ));

                                    safeSetState(() {});
                                  },
                                ),
                              ].divide(SizedBox(width: 10.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 40.0)),
              ),
            ),
          );
        },
      ),
    );
  }
}
