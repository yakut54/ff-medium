import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/common/loading_component/loading_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/pages/catalog/course/widgets/course_play_button/course_play_button_widget.dart';
import '/mobile/pages/catalog/course/widgets/courses_bottom_sheet/courses_bottom_sheet_widget.dart';
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
import 'course_page_model.dart';
export 'course_page_model.dart';

class CoursePageWidget extends StatefulWidget {
  const CoursePageWidget({
    super.key,
    required this.courseDoc,
    required this.categoryDocs,
  });

  final CoursesRecord? courseDoc;
  final List<CategoriesRecord>? categoryDocs;

  static String routeName = 'CoursePage';
  static String routePath = '/coursePage';

  @override
  State<CoursePageWidget> createState() => _CoursePageWidgetState();
}

class _CoursePageWidgetState extends State<CoursePageWidget> {
  late CoursePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CoursePageModel());

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
                              imageUrl: widget.courseDoc!.photo,
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
                      mainAxisSize: MainAxisSize.min,
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
                                      'Курс',
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
                                  imageUrl: widget.courseDoc!.photo,
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
                              widget.courseDoc?.name,
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
                        Flexible(
                          child: Stack(
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
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 20.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (functions
                                                              .coursesCountAudioInLessons(
                                                                  widget
                                                                      .courseDoc!
                                                                      .lessons
                                                                      .toList()) >
                                                          0)
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              FFIcons
                                                                  .kspeakersimplehigh,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 16.0,
                                                            ),
                                                            RichText(
                                                              textScaler:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: functions
                                                                        .coursesCountAudioInLessons(widget
                                                                            .courseDoc!
                                                                            .lessons
                                                                            .toList())
                                                                        .toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Vela Sans',
                                                                          color:
                                                                              Color(0xFF131316),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                  TextSpan(
                                                                    text:
                                                                        ' аудио',
                                                                    style:
                                                                        TextStyle(),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Vela Sans',
                                                                      color: Color(
                                                                          0xFF131316),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 4.0)),
                                                        ),
                                                      if (functions
                                                              .coursesCountVideoInLessons(
                                                                  widget
                                                                      .courseDoc!
                                                                      .lessons
                                                                      .toList()) >
                                                          0)
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              FFIcons
                                                                  .kvideocamera,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 16.0,
                                                            ),
                                                            RichText(
                                                              textScaler:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: functions
                                                                        .coursesCountVideoInLessons(widget
                                                                            .courseDoc!
                                                                            .lessons
                                                                            .toList())
                                                                        .toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Vela Sans',
                                                                          color:
                                                                              Color(0xFF131316),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                  TextSpan(
                                                                    text:
                                                                        ' видео',
                                                                    style:
                                                                        TextStyle(),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Vela Sans',
                                                                      color: Color(
                                                                          0xFF131316),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 4.0)),
                                                        ),
                                                      if (functions
                                                              .coursesCountPdfInLessons(
                                                                  widget
                                                                      .courseDoc!
                                                                      .lessons
                                                                      .toList()) >
                                                          0)
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              FFIcons.ktextaa,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 16.0,
                                                            ),
                                                            RichText(
                                                              textScaler:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: functions.getDocTextsEnding(functions.coursesCountPdfInLessons(widget
                                                                        .courseDoc!
                                                                        .lessons
                                                                        .toList())),
                                                                    style:
                                                                        TextStyle(),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Vela Sans',
                                                                      color: Color(
                                                                          0xFF131316),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 4.0)),
                                                        ),
                                                    ].divide(
                                                        SizedBox(width: 12.0)),
                                                  ),
                                                ),
                                                if (widget.courseDoc
                                                            ?.description !=
                                                        null &&
                                                    widget.courseDoc
                                                            ?.description !=
                                                        '')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                20.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            widget.courseDoc
                                                                ?.description,
                                                            '_',
                                                          ),
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Vela Sans',
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
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
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        CoursesBottomSheetWidget(
                                                                      lessons: widget
                                                                          .courseDoc!
                                                                          .lessons,
                                                                      description: widget
                                                                          .courseDoc!
                                                                          .description,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));
                                                          },
                                                          child: Text(
                                                            'Читать ещё',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Vela Sans',
                                                                  color: Color(
                                                                      0xFF2690B8),
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 10.0)),
                                                    ),
                                                  ),
                                              ].divide(SizedBox(height: 16.0)),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 40.0),
                                            child: StreamBuilder<CoursesRecord>(
                                              stream: CoursesRecord.getDocument(
                                                  widget.courseDoc!.reference),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child:
                                                        LoadingComponentWidget(),
                                                  );
                                                }

                                                final containerCoursesRecord =
                                                    snapshot.data!;

                                                return Container(
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          if (false)
                                                            Text(
                                                              'Занятия',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Vela Sans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    fontSize:
                                                                        18.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          Text(
                                                            'Пройдено ${functions.userViews(containerCoursesRecord.lessons.toList(), currentUserReference!).toString()}/${widget.courseDoc?.lessons.length.toString()}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Vela Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Builder(
                                                        builder: (context) {
                                                          final lessonListColumn =
                                                              containerCoursesRecord
                                                                  .lessons
                                                                  .toList();

                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
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
                                                                onTap:
                                                                    () async {
                                                                  var _shouldSetState =
                                                                      false;
                                                                  if (FFAppState()
                                                                      .hasInternetConnection) {
                                                                    unawaited(
                                                                      () async {
                                                                        await currentUserReference!
                                                                            .update(createUsersRecordData(
                                                                          lastPlay:
                                                                              updateLastPlayStruct(
                                                                            LastPlayStruct(
                                                                              documentType: DocumentType.course,
                                                                              id: containerCoursesRecord.reference.id,
                                                                            ),
                                                                            clearUnsetFields:
                                                                                false,
                                                                          ),
                                                                        ));
                                                                      }(),
                                                                    );
                                                                    if (functions.getContentType(
                                                                            lessonListColumnItem) ==
                                                                        ContentType
                                                                            .audio) {
                                                                      context
                                                                          .pushNamed(
                                                                        AudioPlayerWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'courseDoc':
                                                                              serializeParam(
                                                                            containerCoursesRecord,
                                                                            ParamType.Document,
                                                                          ),
                                                                          'lessonIndex':
                                                                              serializeParam(
                                                                            functions.lessonsIndexOf(lessonListColumnItem,
                                                                                containerCoursesRecord.lessons.toList()),
                                                                            ParamType.int,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'courseDoc':
                                                                              containerCoursesRecord,
                                                                        },
                                                                      );

                                                                      if (_shouldSetState)
                                                                        safeSetState(
                                                                            () {});
                                                                      return;
                                                                    } else if (functions.getContentType(
                                                                            lessonListColumnItem) ==
                                                                        ContentType
                                                                            .video) {
                                                                      if (!lessonListColumnItem
                                                                          .views
                                                                          .contains(
                                                                              currentUserReference)) {
                                                                        _model.listVideo =
                                                                            await actions.userViewLesson(
                                                                          lessonListColumnItem,
                                                                          containerCoursesRecord
                                                                              .lessons
                                                                              .toList(),
                                                                          currentUserReference!,
                                                                        );
                                                                        _shouldSetState =
                                                                            true;
                                                                        unawaited(
                                                                          () async {
                                                                            await widget.courseDoc!.reference.update({
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
                                                                            lessonListColumnItem.video,
                                                                            ParamType.String,
                                                                          ),
                                                                          'title':
                                                                              serializeParam(
                                                                            lessonListColumnItem.name,
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );

                                                                      if (_shouldSetState)
                                                                        safeSetState(
                                                                            () {});
                                                                      return;
                                                                    } else if (functions.getContentType(
                                                                            lessonListColumnItem) ==
                                                                        ContentType
                                                                            .doc) {
                                                                      if (!lessonListColumnItem
                                                                          .views
                                                                          .contains(
                                                                              currentUserReference)) {
                                                                        _model.listPDF =
                                                                            await actions.userViewLesson(
                                                                          lessonListColumnItem,
                                                                          containerCoursesRecord
                                                                              .lessons
                                                                              .toList(),
                                                                          currentUserReference!,
                                                                        );
                                                                        _shouldSetState =
                                                                            true;
                                                                        unawaited(
                                                                          () async {
                                                                            await widget.courseDoc!.reference.update({
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
                                                                            lessonListColumnItem.doc,
                                                                            ParamType.String,
                                                                          ),
                                                                          'title':
                                                                              serializeParam(
                                                                            lessonListColumnItem.name,
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );

                                                                      if (_shouldSetState)
                                                                        safeSetState(
                                                                            () {});
                                                                      return;
                                                                    } else {
                                                                      if (_shouldSetState)
                                                                        safeSetState(
                                                                            () {});
                                                                      return;
                                                                    }
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
                                                                            FFIcons.kspeakersimplehigh,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                32.0,
                                                                          );
                                                                        } else if (functions.convertVideoToString(lessonListColumnItem.video) !=
                                                                                '') {
                                                                          return Icon(
                                                                            FFIcons.kvideocamera,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                32.0,
                                                                          );
                                                                        } else {
                                                                          return Icon(
                                                                            FFIcons.ktextaa,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                32.0,
                                                                          );
                                                                        }
                                                                      },
                                                                    ),
                                                                    Flexible(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            lessonListColumnItem.name,
                                                                            maxLines:
                                                                                1,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Vela Sans',
                                                                                  fontSize: 16.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            functions.getContentType(lessonListColumnItem) != ContentType.doc
                                                                                ? functions.convertMillisToHM(lessonListColumnItem.duration, ConverterGet.hm)
                                                                                : functions.getPageTextsEnding(lessonListColumnItem.pages.toString(), true),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                      .addToStart(SizedBox(
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
                                                  ),
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
                              Stack(
                                children: [
                                  if (false)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            40.0, 0.0, 40.0, 0.0),
                                        child: StreamBuilder<CoursesRecord>(
                                          stream: CoursesRecord.getDocument(
                                              widget.courseDoc!.reference),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 32.0,
                                                  height: 32.0,
                                                  child: SpinKitHourGlass(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    size: 32.0,
                                                  ),
                                                ),
                                              );
                                            }

                                            final coursePlayButtonCoursesRecord =
                                                snapshot.data!;

                                            return wrapWithModel(
                                              model:
                                                  _model.coursePlayButtonModel1,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: CoursePlayButtonWidget(
                                                courseDoc:
                                                    coursePlayButtonCoursesRecord,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40.0, 0.0, 40.0, 0.0),
                                      child: StreamBuilder<CoursesRecord>(
                                        stream: CoursesRecord.getDocument(
                                            widget.courseDoc!.reference),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 32.0,
                                                height: 32.0,
                                                child: SpinKitHourGlass(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  size: 32.0,
                                                ),
                                              ),
                                            );
                                          }

                                          final coursePlayButtonCoursesRecord =
                                              snapshot.data!;

                                          return wrapWithModel(
                                            model:
                                                _model.coursePlayButtonModel2,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: CoursePlayButtonWidget(
                                              courseDoc:
                                                  coursePlayButtonCoursesRecord,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
