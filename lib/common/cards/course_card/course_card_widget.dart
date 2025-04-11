import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/web/screens/courses/c_e_course/c_e_course_widget.dart';
import '/web/ui/delete_item/delete_item_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'course_card_model.dart';
export 'course_card_model.dart';

class CourseCardWidget extends StatefulWidget {
  const CourseCardWidget({
    super.key,
    required this.cardType,
    required this.courseDoc,
  });

  final CardType? cardType;
  final CoursesRecord? courseDoc;

  @override
  State<CourseCardWidget> createState() => _CourseCardWidgetState();
}

class _CourseCardWidgetState extends State<CourseCardWidget> {
  late CourseCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CourseCardModel());

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

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        var _shouldSetState = false;
        if (isWeb && !FFAppState().debugWebToMobile) {
          if (_shouldSetState) safeSetState(() {});
          return;
        }

        if (FFAppState().hasInternetConnection &&
            !FFAppState().hasVpnConnection) {
          _model.categories = await actions.coursesGetCategories(
            widget.courseDoc!,
          );
          _shouldSetState = true;

          context.pushNamed(
            CoursePageWidget.routeName,
            queryParameters: {
              'courseDoc': serializeParam(
                widget.courseDoc,
                ParamType.Document,
              ),
              'categoryDocs': serializeParam(
                _model.categories,
                ParamType.Document,
                isList: true,
              ),
            }.withoutNulls,
            extra: <String, dynamic>{
              'courseDoc': widget.courseDoc,
              'categoryDocs': _model.categories,
            },
          );

          if (_shouldSetState) safeSetState(() {});
          return;
        } else {
          await action_blocks.notConnectedSnackBar(context);
          if (_shouldSetState) safeSetState(() {});
          return;
        }

        if (_shouldSetState) safeSetState(() {});
      },
      child: Container(
        width: () {
          if ((widget.cardType == CardType.big) ||
              (widget.cardType == CardType.adminBig)) {
            return 274.0;
          } else if ((widget.cardType == CardType.expanded) ||
              (widget.cardType == CardType.expanded)) {
            return (double.infinity);
          } else {
            return 167.0;
          }
        }(),
        height: () {
          if ((widget.cardType == CardType.standart) ||
              (widget.cardType == CardType.adminStandart)) {
            return 167.0;
          } else if ((widget.cardType == CardType.long) ||
              (widget.cardType == CardType.adminLong)) {
            return 198.0;
          } else if ((widget.cardType == CardType.big) ||
              (widget.cardType == CardType.adminBig)) {
            return 198.0;
          } else {
            return 167.0;
          }
        }(),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: CachedNetworkImage(
                fadeInDuration: Duration(milliseconds: 250),
                fadeOutDuration: Duration(milliseconds: 250),
                imageUrl: valueOrDefault<String>(
                  widget.courseDoc != null ? widget.courseDoc?.photo : '-',
                  '-',
                ),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Opacity(
              opacity: 0.35,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryText,
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StreamBuilder<CoursesRecord>(
                        stream: CoursesRecord.getDocument(
                            widget.courseDoc!.reference),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 1.0,
                                height: 1.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0x001C1C1C),
                                  ),
                                ),
                              ),
                            );
                          }

                          final conditionalBuilderCoursesRecord =
                              snapshot.data!;

                          return Builder(
                            builder: (context) {
                              if (!((widget.cardType ==
                                      CardType.adminStandart) ||
                                  (widget.cardType == CardType.adminLong) ||
                                  (widget.cardType == CardType.adminBig) ||
                                  (widget.cardType ==
                                      CardType.adminExpanded))) {
                                return Visibility(
                                  visible: valueOrDefault<bool>(
                                      currentUserDocument?.isAuthorized, false),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      '${functions.userViews(conditionalBuilderCoursesRecord.lessons.toList(), currentUserReference!).toString()}/${conditionalBuilderCoursesRecord.lessons.length.toString()} пройдено',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Vela Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                );
                              } else {
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
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
                                        _model.onboardingList = await actions
                                            .getAdminOnboardingList(
                                          null,
                                          widget.courseDoc,
                                        );
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: CECourseWidget(
                                                courseDoc: widget.courseDoc,
                                                onboardingList:
                                                    _model.onboardingList!,
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));

                                        safeSetState(() {});
                                      },
                                    ),
                                    Builder(
                                      builder: (context) =>
                                          FlutterFlowIconButton(
                                        borderRadius: 20.0,
                                        buttonSize: 40.0,
                                        fillColor: Color(0x41FFFFFF),
                                        icon: Icon(
                                          Icons.delete_sweep,
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: DeleteItemWidget(
                                                  text:
                                                      'Вы уверены, что хотите удалить курс?',
                                                  subtitle:
                                                      'Отменить это действие будет невозможно!',
                                                  courseItem: widget.courseDoc,
                                                  action: () async {},
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 5.0)),
                                );
                              }
                            },
                          );
                        },
                      ),
                      if ((widget.cardType == CardType.adminStandart) ||
                          (widget.cardType == CardType.adminLong) ||
                          (widget.cardType == CardType.adminBig) ||
                          (widget.cardType == CardType.adminExpanded))
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Медитаций: ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Vela Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                              ),
                              TextSpan(
                                text: valueOrDefault<String>(
                                  widget.courseDoc?.lessons.length
                                      .toString(),
                                  '0',
                                ),
                                style: TextStyle(),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Vela Sans',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 80.0,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (widget.courseDoc?.categories != null &&
                                (widget.courseDoc?.categories)!.isNotEmpty)
                              Container(
                                height: 35.0,
                                decoration: BoxDecoration(),
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: FutureBuilder<CategoriesRecord>(
                                  future: CategoriesRecord.getDocumentOnce(
                                      widget
                                          .courseDoc!.categories.firstOrNull!),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              Colors.transparent,
                                            ),
                                          ),
                                        ),
                                      );
                                    }

                                    final columnCategoriesRecord =
                                        snapshot.data!;

                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${columnCategoriesRecord.name}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Vela Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        Text(
                                          '${widget.courseDoc != null ? (widget.courseDoc!.categories.length > 1 ? ((int categoriesListLength) {
                                              return 'и ещё ${categoriesListLength - 1}';
                                            }(widget.courseDoc!.categories.length)) : ('')) : ('')}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Vela Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            Container(
                              decoration: BoxDecoration(),
                              child: Text(
                                widget.courseDoc!.name,
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Vela Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if ((widget.cardType == CardType.adminStandart) ||
                          (widget.cardType == CardType.adminLong) ||
                          (widget.cardType == CardType.adminBig) ||
                          (widget.cardType == CardType.adminExpanded))
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Создано:    ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Vela Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                  TextSpan(
                                    text: dateTimeFormat(
                                      "dd.MM.y",
                                      widget.courseDoc!.createdTime!,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    style: TextStyle(),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Vela Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                            if (widget.courseDoc?.hasModifiedTime() ?? true)
                              RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Изменено: ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Vela Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    TextSpan(
                                      text: dateTimeFormat(
                                        "dd.MM.y",
                                        widget.courseDoc!.modifiedTime!,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      style: TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Vela Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
