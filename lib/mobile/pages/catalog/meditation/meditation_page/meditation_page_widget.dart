import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/pages/catalog/course/widgets/courses_bottom_sheet/courses_bottom_sheet_widget.dart';
import '/mobile/pages/catalog/meditation/widgets/meditation_play_button/meditation_play_button_widget.dart';
import 'dart:async';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'meditation_page_model.dart';
export 'meditation_page_model.dart';

class MeditationPageWidget extends StatefulWidget {
  const MeditationPageWidget({
    super.key,
    required this.meditationDoc,
    required this.categoryDocs,
  });

  final MeditationsRecord? meditationDoc;
  final List<CategoriesRecord>? categoryDocs;

  static String routeName = 'MeditationPage';
  static String routePath = '/meditationPage';

  @override
  State<MeditationPageWidget> createState() => _MeditationPageWidgetState();
}

class _MeditationPageWidgetState extends State<MeditationPageWidget> {
  late MeditationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeditationPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                    child: ClipRect(
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(
                          sigmaX: 15.0,
                          sigmaY: 15.0,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: CachedNetworkImage(
                              fadeInDuration: Duration(milliseconds: 250),
                              fadeOutDuration: Duration(milliseconds: 250),
                              imageUrl: widget.meditationDoc!.photo,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Opacity(
                opacity: 0.4,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 60.0,
                              decoration: BoxDecoration(),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 40.0,
                                      borderWidth: 1.0,
                                      buttonSize: 60.0,
                                      icon: Icon(
                                        Icons.arrow_back_ios_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        context.safePop();
                                      },
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      'Медитация',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Vela Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 60.0, 0.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: CachedNetworkImage(
                                  fadeInDuration: Duration(milliseconds: 250),
                                  fadeOutDuration: Duration(milliseconds: 250),
                                  imageUrl: widget.meditationDoc!.photo,
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 15.0, 16.0, 15.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.meditationDoc?.name,
                              '_',
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Vela Sans',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 30.0),
                          child: Builder(
                            builder: (context) {
                              final categoriesList =
                                  widget.categoryDocs!.toList();

                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: List.generate(categoriesList.length,
                                          (categoriesListIndex) {
                                    final categoriesListItem =
                                        categoriesList[categoriesListIndex];
                                    return Container(
                                      height: 31.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x66000000),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Text(
                                          categoriesListItem.name,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Vela Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                    );
                                  })
                                      .divide(SizedBox(width: 10.0))
                                      .addToStart(SizedBox(width: 10.0))
                                      .addToEnd(SizedBox(width: 10.0)),
                                ),
                              );
                            },
                          ),
                        ),
                        Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 26.0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 40.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (widget.meditationDoc
                                                    ?.description !=
                                                null &&
                                            widget.meditationDoc
                                                    ?.description !=
                                                '')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    widget.meditationDoc
                                                                    ?.description !=
                                                                null &&
                                                            widget.meditationDoc
                                                                    ?.description !=
                                                                ''
                                                        ? widget.meditationDoc
                                                            ?.description
                                                        : 'Описание отсутствует',
                                                    'Описание отсутствует',
                                                  ),
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Vela Sans',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                CoursesBottomSheetWidget(
                                                              lessons: widget
                                                                  .meditationDoc!
                                                                  .lessons,
                                                              description: widget
                                                                  .meditationDoc!
                                                                  .description,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  child: Text(
                                                    'Читать ещё',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Vela Sans',
                                                          color:
                                                              Color(0xFF2690B8),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 16.0)),
                                            ),
                                          ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 40.0),
                                          child:
                                              StreamBuilder<MeditationsRecord>(
                                            stream:
                                                MeditationsRecord.getDocument(
                                                    widget.meditationDoc!
                                                        .reference),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 32.0,
                                                    height: 32.0,
                                                    child: SpinKitHourGlass(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      size: 32.0,
                                                    ),
                                                  ),
                                                );
                                              }

                                              final columnMeditationsRecord =
                                                  snapshot.data!;

                                              return Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  if (Role.user ==
                                                      Role.administrator)
                                                    Text(
                                                      'Занятия',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Vela Sans',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                  Builder(
                                                    builder: (context) {
                                                      final lessonListColumn =
                                                          columnMeditationsRecord
                                                              .lessons
                                                              .toList();

                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: List.generate(
                                                            lessonListColumn
                                                                .length,
                                                            (lessonListColumnIndex) {
                                                          final lessonListColumnItem =
                                                              lessonListColumn[
                                                                  lessonListColumnIndex];
                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              var _shouldSetState =
                                                                  false;
                                                              if (FFAppState()
                                                                  .hasInternetConnection) {
                                                                await currentUserReference!
                                                                    .update(
                                                                        createUsersRecordData(
                                                                  lastPlay:
                                                                      updateLastPlayStruct(
                                                                    LastPlayStruct(
                                                                      documentType:
                                                                          DocumentType
                                                                              .meditation,
                                                                      id: widget
                                                                          .meditationDoc
                                                                          ?.reference
                                                                          .id,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                ));
                                                                if (functions
                                                                        .getContentType(
                                                                            lessonListColumnItem) ==
                                                                    ContentType
                                                                        .audio) {
                                                                  context
                                                                      .pushNamed(
                                                                    AudioPlayerWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'meditationDoc':
                                                                          serializeParam(
                                                                        columnMeditationsRecord,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                      'lessonIndex':
                                                                          serializeParam(
                                                                        functions.lessonsIndexOf(
                                                                            lessonListColumnItem,
                                                                            columnMeditationsRecord.lessons.toList()),
                                                                        ParamType
                                                                            .int,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      'meditationDoc':
                                                                          columnMeditationsRecord,
                                                                    },
                                                                  );
                                                                } else if (functions
                                                                        .getContentType(
                                                                            lessonListColumnItem) ==
                                                                    ContentType
                                                                        .video) {
                                                                  if (!lessonListColumnItem
                                                                      .views
                                                                      .contains(
                                                                          currentUserReference)) {
                                                                    _model.listVideo =
                                                                        await actions
                                                                            .userViewLesson(
                                                                      lessonListColumnItem,
                                                                      columnMeditationsRecord
                                                                          .lessons
                                                                          .toList(),
                                                                      currentUserReference!,
                                                                    );
                                                                    _shouldSetState =
                                                                        true;
                                                                    unawaited(
                                                                      () async {
                                                                        await widget
                                                                            .meditationDoc!
                                                                            .reference
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'lessons': getLessonListFirestoreData(
                                                                                _model.listVideo,
                                                                              ),
                                                                            },
                                                                          ),
                                                                        });
                                                                      }(),
                                                                    );
                                                                  }

                                                                  context
                                                                      .pushNamed(
                                                                    VideoPlayerPageWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'videoPath':
                                                                          serializeParam(
                                                                        lessonListColumnItem
                                                                            .video,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'title':
                                                                          serializeParam(
                                                                        lessonListColumnItem
                                                                            .name,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                } else if (functions
                                                                        .getContentType(
                                                                            lessonListColumnItem) ==
                                                                    ContentType
                                                                        .doc) {
                                                                  if (!lessonListColumnItem
                                                                      .views
                                                                      .contains(
                                                                          currentUserReference)) {
                                                                    _model.listPDF =
                                                                        await actions
                                                                            .userViewLesson(
                                                                      lessonListColumnItem,
                                                                      columnMeditationsRecord
                                                                          .lessons
                                                                          .toList(),
                                                                      currentUserReference!,
                                                                    );
                                                                    _shouldSetState =
                                                                        true;
                                                                    unawaited(
                                                                      () async {
                                                                        await widget
                                                                            .meditationDoc!
                                                                            .reference
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'lessons': getLessonListFirestoreData(
                                                                                _model.listPDF,
                                                                              ),
                                                                            },
                                                                          ),
                                                                        });
                                                                      }(),
                                                                    );
                                                                  }

                                                                  context
                                                                      .pushNamed(
                                                                    PDFViewPageWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'docPath':
                                                                          serializeParam(
                                                                        lessonListColumnItem
                                                                            .doc,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'title':
                                                                          serializeParam(
                                                                        lessonListColumnItem
                                                                            .name,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                } else {
                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                  return;
                                                                }

                                                                unawaited(
                                                                  () async {
                                                                    await currentUserReference!
                                                                        .update(
                                                                            createUsersRecordData(
                                                                      lastPlay:
                                                                          updateLastPlayStruct(
                                                                        LastPlayStruct(
                                                                          documentType:
                                                                              DocumentType.meditation,
                                                                          id: columnMeditationsRecord
                                                                              .reference
                                                                              .id,
                                                                        ),
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                    ));
                                                                  }(),
                                                                );
                                                              } else {
                                                                await action_blocks
                                                                    .notConnectedSnackBar(
                                                                        context);
                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              }

                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                            },
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Builder(
                                                                  builder:
                                                                      (context) {
                                                                    if (functions.convertAudioToString(lessonListColumnItem.audio) !=
                                                                            '') {
                                                                      return Icon(
                                                                        FFIcons
                                                                            .kspeakersimplehigh,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            32.0,
                                                                      );
                                                                    } else if (functions.convertVideoToString(lessonListColumnItem.video) !=
                                                                            '') {
                                                                      return Icon(
                                                                        FFIcons
                                                                            .kvideocamera,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            32.0,
                                                                      );
                                                                    } else {
                                                                      return Icon(
                                                                        FFIcons
                                                                            .ktextaa,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            32.0,
                                                                      );
                                                                    }
                                                                  },
                                                                ),
                                                                Expanded(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        lessonListColumnItem
                                                                            .name,
                                                                        maxLines:
                                                                            1,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Vela Sans',
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        functions.getContentType(lessonListColumnItem) !=
                                                                                ContentType.doc
                                                                            ? functions.convertMillisToHM(lessonListColumnItem.duration, ConverterGet.hm)
                                                                            : functions.getPageTextsEnding(lessonListColumnItem.pages.toString(), true),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Vela Sans',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ]
                                                                  .divide(SizedBox(
                                                                      width:
                                                                          20.0))
                                                                  .addToStart(
                                                                      SizedBox(
                                                                          width:
                                                                              10.0)),
                                                            ),
                                                          );
                                                        }).divide(SizedBox(
                                                            height: 12.0)),
                                                      );
                                                    },
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 16.0)),
                                              );
                                            },
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 24.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  40.0, 0.0, 40.0, 0.0),
                              child: StreamBuilder<MeditationsRecord>(
                                stream: MeditationsRecord.getDocument(
                                    widget.meditationDoc!.reference),
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

                                  final meditationPlayButtonMeditationsRecord =
                                      snapshot.data!;

                                  return wrapWithModel(
                                    model: _model.meditationPlayButtonModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: MeditationPlayButtonWidget(
                                      meditationDoc:
                                          meditationPlayButtonMeditationsRecord,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
