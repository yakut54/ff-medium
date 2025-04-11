import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/common/cards/meditation_card/meditation_card_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/web/screens/meditations/c_e_womens_meditation/c_e_womens_meditation_widget.dart';
import '/web/ui/empty_filter/empty_filter_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'womens_meditations_screen_model.dart';
export 'womens_meditations_screen_model.dart';

class WomensMeditationsScreenWidget extends StatefulWidget {
  const WomensMeditationsScreenWidget({super.key});

  @override
  State<WomensMeditationsScreenWidget> createState() =>
      _WomensMeditationsScreenWidgetState();
}

class _WomensMeditationsScreenWidgetState
    extends State<WomensMeditationsScreenWidget> {
  late WomensMeditationsScreenModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WomensMeditationsScreenModel());

    _model.switchValue1 = false;
    _model.switchValue2 = false;
    _model.switchWCValue = false;
    _model.switchValue3 = false;
    _model.switchValue4 = false;
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
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          constraints: BoxConstraints(
            maxWidth: double.infinity,
          ),
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StreamBuilder<List<CategoriesRecord>>(
                      stream: queryCategoriesRecord(
                        queryBuilder: (categoriesRecord) =>
                            categoriesRecord.where(
                          'is_subcategory',
                          isEqualTo: true,
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 32.0,
                              height: 32.0,
                              child: SpinKitHourGlass(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                size: 32.0,
                              ),
                            ),
                          );
                        }
                        List<CategoriesRecord> containerCategoriesRecordList =
                            snapshot.data!;

                        return Container(
                          decoration: BoxDecoration(),
                          child: FlutterFlowDropDown<String>(
                            multiSelectController:
                                _model.dropDownValueController ??=
                                    FormListFieldController<String>(null),
                            options: List<String>.from(
                                containerCategoriesRecordList
                                    .map((e) => e.reference.id)
                                    .toList()),
                            optionLabels: containerCategoriesRecordList
                                .map((e) => e.name)
                                .toList(),
                            width: 500.0,
                            height: 56.0,
                            searchHintTextStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Vela Sans',
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                            searchTextStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Vela Sans',
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Vela Sans',
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                            hintText: 'Категории',
                            searchHintText: 'Поиск',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 2.0,
                            borderColor: FlutterFlowTheme.of(context).alternate,
                            borderWidth: 2.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 4.0),
                            hidesUnderline: true,
                            isOverButton: true,
                            isSearchable: true,
                            isMultiSelect: true,
                            onMultiSelectChanged: (val) =>
                                safeSetState(() => _model.dropDownValue = val),
                          ),
                        );
                      },
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Подкаст',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Vela Sans',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Switch.adaptive(
                              value: _model.switchValue1!,
                              onChanged: (newValue) async {
                                safeSetState(
                                    () => _model.switchValue1 = newValue);
                              },
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              inactiveTrackColor:
                                  FlutterFlowTheme.of(context).alternate,
                              inactiveThumbColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Новое',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Vela Sans',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Switch.adaptive(
                              value: _model.switchValue2!,
                              onChanged: (newValue) async {
                                safeSetState(
                                    () => _model.switchValue2 = newValue);
                              },
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              inactiveTrackColor:
                                  FlutterFlowTheme.of(context).alternate,
                              inactiveThumbColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Без категории',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Vela Sans',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Switch.adaptive(
                              value: _model.switchWCValue!,
                              onChanged: (newValue) async {
                                safeSetState(
                                    () => _model.switchWCValue = newValue);
                              },
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              inactiveTrackColor:
                                  FlutterFlowTheme.of(context).alternate,
                              inactiveThumbColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Доп. материалы',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Vela Sans',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Switch.adaptive(
                              value: _model.switchValue3!,
                              onChanged: (newValue) async {
                                safeSetState(
                                    () => _model.switchValue3 = newValue);
                              },
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              inactiveTrackColor:
                                  FlutterFlowTheme.of(context).alternate,
                              inactiveThumbColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Популярное',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Vela Sans',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Switch.adaptive(
                              value: _model.switchValue4!,
                              onChanged: (newValue) async {
                                safeSetState(
                                    () => _model.switchValue4 = newValue);
                              },
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              inactiveTrackColor:
                                  FlutterFlowTheme.of(context).alternate,
                              inactiveThumbColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Builder(
                          builder: (context) {
                            if (_model.switchValue1! ||
                                _model.switchValue2! ||
                                _model.switchValue3! ||
                                _model.switchValue4! ||
                                _model.switchWCValue!) {
                              return FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 80.0,
                                fillColor: FlutterFlowTheme.of(context).error,
                                icon: Icon(
                                  Icons.filter_alt_off,
                                  color: Colors.white,
                                ),
                                onPressed: () async {
                                  // r
                                  safeSetState(() {
                                    _model.switchValue3 = false;
                                    _model.switchValue4 = false;
                                    _model.switchValue1 = false;
                                    _model.switchValue2 = false;
                                    _model.switchWCValue = false;
                                  });
                                  safeSetState(() {
                                    _model.dropDownValueController?.reset();
                                  });
                                },
                              );
                            } else {
                              return Container(
                                width: 80.0,
                                height: 80.0,
                                decoration: BoxDecoration(),
                              );
                            }
                          },
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 80.0,
                          fillColor: FlutterFlowTheme.of(context).primary,
                          icon: Icon(
                            Icons.add_rounded,
                            color: Colors.white,
                          ),
                          onPressed: () async {
                            _model.onboardingList =
                                await actions.getAdminOnboardingList(
                              null,
                              null,
                            );
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: CEWomensMeditationWidget(
                                    onboardingList: _model.onboardingList!,
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));

                            safeSetState(() {});
                          },
                        ),
                      ].divide(SizedBox(width: 20.0)),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    StreamBuilder<List<MeditationsRecord>>(
                      stream: queryMeditationsRecord(
                        queryBuilder: (meditationsRecord) => meditationsRecord
                            .where(
                              'is_deleted',
                              isEqualTo: false,
                            )
                            .where(
                              'for_women',
                              isEqualTo: true,
                            ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 32.0,
                              height: 32.0,
                              child: SpinKitHourGlass(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                size: 32.0,
                              ),
                            ),
                          );
                        }
                        List<MeditationsRecord> containerMeditationsRecordList =
                            snapshot.data!;

                        return Container(
                          decoration: BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              if (functions
                                  .meditationsSortByTime(functions
                                      .meditationsScreenFilter(
                                          _model.dropDownValue?.toList(),
                                          _model.switchValue2!,
                                          _model.switchValue4!,
                                          containerMeditationsRecordList
                                              .toList(),
                                          _model.switchValue1!,
                                          _model.switchValue3!,
                                          _model.switchWCValue!)
                                      .toList())
                                  .isNotEmpty) {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 60.0),
                                  child: Builder(
                                    builder: (context) {
                                      final meditations = functions
                                          .meditationsSortByTime(functions
                                              .meditationsScreenFilter(
                                                  _model.dropDownValue
                                                      ?.toList(),
                                                  _model.switchValue2!,
                                                  _model.switchValue4!,
                                                  containerMeditationsRecordList
                                                      .toList(),
                                                  _model.switchValue1!,
                                                  _model.switchValue3!,
                                                  _model.switchWCValue!)
                                              .toList())
                                          .toList();

                                      return Wrap(
                                        spacing: 10.0,
                                        runSpacing: 10.0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children:
                                            List.generate(meditations.length,
                                                (meditationsIndex) {
                                          final meditationsItem =
                                              meditations[meditationsIndex];
                                          return MeditationCardWidget(
                                            key: Key(
                                                'Keytvg_${meditationsIndex}_of_${meditations.length}'),
                                            cardType: CardType.adminBig,
                                            meditationDoc: meditationsItem,
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                );
                              } else {
                                return Container(
                                  decoration: BoxDecoration(),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 200.0, 0.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.emptyFilterModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: EmptyFilterWidget(
                                          action: () async {
                                            // r
                                            safeSetState(() {
                                              _model.switchValue4 = false;
                                              _model.switchValue3 = false;
                                              _model.switchWCValue = false;
                                              _model.switchValue2 = false;
                                              _model.switchValue1 = false;
                                            });
                                            safeSetState(() {
                                              _model.dropDownValueController
                                                  ?.reset();
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ].divide(SizedBox(height: 15.0)),
          ),
        ),
      ),
    );
  }
}
