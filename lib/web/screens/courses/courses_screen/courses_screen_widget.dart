import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/common/cards/course_card/course_card_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/web/screens/courses/c_e_course/c_e_course_widget.dart';
import '/web/ui/empty_filter/empty_filter_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'courses_screen_model.dart';
export 'courses_screen_model.dart';

class CoursesScreenWidget extends StatefulWidget {
  const CoursesScreenWidget({super.key});

  @override
  State<CoursesScreenWidget> createState() => _CoursesScreenWidgetState();
}

class _CoursesScreenWidgetState extends State<CoursesScreenWidget> {
  late CoursesScreenModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CoursesScreenModel());

    _model.switchValue1 = false;
    _model.switchValue2 = false;
    _model.switchValue3 = false;
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
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: 2000.0,
                ),
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    StreamBuilder<List<CategoriesRecord>>(
                      stream: queryCategoriesRecord(
                        queryBuilder: (categoriesRecord) => categoriesRecord
                            .where(
                              'undeletable',
                              isEqualTo: false,
                            )
                            .where(
                              'is_subcategory',
                              isEqualTo: false,
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
                          children: [
                            Text(
                              'Без категорий',
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
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Builder(
                          builder: (context) {
                            if ((_model.dropDownValue != null &&
                                    (_model.dropDownValue)!.isNotEmpty) ||
                                _model.switchValue2! ||
                                _model.switchValue1! ||
                                _model.switchValue3!) {
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
                                    _model.switchValue2 = false;
                                    _model.switchValue1 = false;
                                    _model.switchValue3 = false;
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
                                  child: CECourseWidget(
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
                    StreamBuilder<List<CoursesRecord>>(
                      stream: queryCoursesRecord(
                        queryBuilder: (coursesRecord) => coursesRecord.where(
                          'is_deleted',
                          isEqualTo: false,
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
                        List<CoursesRecord> containerCoursesRecordList =
                            snapshot.data!;

                        return Container(
                          decoration: BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              if (functions
                                  .coursesSortByTime(functions
                                      .coursesScreenFilter(
                                          _model.dropDownValue?.toList(),
                                          _model.switchValue2!,
                                          _model.switchValue1!,
                                          containerCoursesRecordList.toList(),
                                          _model.switchValue3!)
                                      .toList())
                                  .isNotEmpty) {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 60.0),
                                  child: Builder(
                                    builder: (context) {
                                      final courses = functions
                                          .coursesSortByTime(functions
                                              .coursesScreenFilter(
                                                  _model.dropDownValue
                                                      ?.toList(),
                                                  _model.switchValue2!,
                                                  _model.switchValue1!,
                                                  containerCoursesRecordList
                                                      .toList(),
                                                  _model.switchValue3!)
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
                                        children: List.generate(courses.length,
                                            (coursesIndex) {
                                          final coursesItem =
                                              courses[coursesIndex];
                                          return CourseCardWidget(
                                            key: Key(
                                                'Key29i_${coursesIndex}_of_${courses.length}'),
                                            cardType: CardType.adminBig,
                                            courseDoc: coursesItem,
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 200.0, 0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.emptyFilterModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: EmptyFilterWidget(
                                      action: () async {
                                        // r
                                        safeSetState(() {
                                          _model.switchValue2 = false;
                                          _model.switchValue1 = false;
                                          _model.switchValue3 = false;
                                        });
                                        safeSetState(() {
                                          _model.dropDownValueController
                                              ?.reset();
                                        });
                                      },
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
