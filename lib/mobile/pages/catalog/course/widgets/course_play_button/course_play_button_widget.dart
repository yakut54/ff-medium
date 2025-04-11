import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'course_play_button_model.dart';
export 'course_play_button_model.dart';

class CoursePlayButtonWidget extends StatefulWidget {
  const CoursePlayButtonWidget({
    super.key,
    required this.courseDoc,
  });

  final CoursesRecord? courseDoc;

  @override
  State<CoursePlayButtonWidget> createState() => _CoursePlayButtonWidgetState();
}

class _CoursePlayButtonWidgetState extends State<CoursePlayButtonWidget> {
  late CoursePlayButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CoursePlayButtonModel());

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

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        constraints: BoxConstraints(
          minWidth: 200.0,
        ),
        decoration: BoxDecoration(),
        child: Builder(
          builder: (context) {
            if (true) {
              return Builder(
                builder: (context) {
                  if (functions.getNextContentType(
                          widget.courseDoc!.lessons.toList(),
                          currentUserReference!) ==
                      ContentType.audio) {
                    return FFButtonWidget(
                      onPressed: () async {
                        if (FFAppState().hasInternetConnection) {
                          context.pushNamed(
                            AudioPlayerWidget.routeName,
                            queryParameters: {
                              'courseDoc': serializeParam(
                                widget.courseDoc,
                                ParamType.Document,
                              ),
                              'lessonIndex': serializeParam(
                                functions.lessonsIndexOf(
                                    functions.getNextLesson(
                                        widget.courseDoc!.lessons.toList(),
                                        currentUserReference!),
                                    widget.courseDoc!.lessons.toList()),
                                ParamType.int,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'courseDoc': widget.courseDoc,
                            },
                          );

                          unawaited(
                            () async {
                              await currentUserReference!
                                  .update(createUsersRecordData(
                                lastPlay: updateLastPlayStruct(
                                  LastPlayStruct(
                                    documentType: DocumentType.course,
                                    id: widget.courseDoc?.reference.id,
                                  ),
                                  clearUnsetFields: false,
                                ),
                              ));
                            }(),
                          );
                          return;
                        } else {
                          await action_blocks.notConnectedSnackBar(context);
                          return;
                        }
                      },
                      text: 'Начать',
                      icon: Icon(
                        Icons.play_arrow,
                        size: 24.0,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 52.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Vela Sans',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(28.0),
                      ),
                    );
                  } else if (functions.getNextContentType(
                          widget.courseDoc!.lessons.toList(),
                          currentUserReference!) ==
                      ContentType.video) {
                    return FFButtonWidget(
                      onPressed: () async {
                        var _shouldSetState = false;
                        if (FFAppState().hasInternetConnection) {
                          context.pushNamed(
                            VideoPlayerPageWidget.routeName,
                            queryParameters: {
                              'videoPath': serializeParam(
                                functions
                                    .getNextLesson(
                                        widget.courseDoc!.lessons.toList(),
                                        currentUserReference!)
                                    .video,
                                ParamType.String,
                              ),
                              'title': serializeParam(
                                functions
                                    .getNextLesson(
                                        widget.courseDoc!.lessons.toList(),
                                        currentUserReference!)
                                    .name,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );

                          unawaited(
                            () async {
                              await currentUserReference!
                                  .update(createUsersRecordData(
                                lastPlay: updateLastPlayStruct(
                                  LastPlayStruct(
                                    documentType: DocumentType.course,
                                    id: widget.courseDoc?.reference.id,
                                  ),
                                  clearUnsetFields: false,
                                ),
                              ));
                            }(),
                          );
                          if (!functions
                              .getNextLesson(
                                  widget.courseDoc!.lessons.toList(),
                                  currentUserReference!)
                              .views
                              .contains(currentUserReference)) {
                            _model.listCopy = await actions.userViewLesson(
                              functions.getNextLesson(
                                  widget.courseDoc!.lessons.toList(),
                                  currentUserReference!),
                              widget.courseDoc?.lessons.toList(),
                              currentUserReference!,
                            );
                            _shouldSetState = true;
                            unawaited(
                              () async {
                                await widget.courseDoc!.reference.update({
                                  ...mapToFirestore(
                                    {
                                      'lessons': getLessonListFirestoreData(
                                        _model.listCopy,
                                      ),
                                    },
                                  ),
                                });
                              }(),
                            );
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          } else {
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          }
                        } else {
                          await action_blocks.notConnectedSnackBar(context);
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }

                        if (_shouldSetState) safeSetState(() {});
                      },
                      text: 'Начать',
                      icon: Icon(
                        FFIcons.kvideocamera,
                        size: 24.0,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 52.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Vela Sans',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(28.0),
                      ),
                    );
                  } else if (functions.getNextContentType(
                          widget.courseDoc!.lessons.toList(),
                          currentUserReference!) ==
                      ContentType.doc) {
                    return FFButtonWidget(
                      onPressed: () async {
                        var _shouldSetState = false;
                        if (FFAppState().hasInternetConnection) {
                          context.pushNamed(
                            PDFViewPageWidget.routeName,
                            queryParameters: {
                              'docPath': serializeParam(
                                functions
                                    .getNextLesson(
                                        widget.courseDoc!.lessons.toList(),
                                        currentUserReference!)
                                    .doc,
                                ParamType.String,
                              ),
                              'title': serializeParam(
                                functions
                                    .getNextLesson(
                                        widget.courseDoc!.lessons.toList(),
                                        currentUserReference!)
                                    .name,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );

                          unawaited(
                            () async {
                              await currentUserReference!
                                  .update(createUsersRecordData(
                                lastPlay: updateLastPlayStruct(
                                  LastPlayStruct(
                                    documentType: DocumentType.course,
                                    id: widget.courseDoc?.reference.id,
                                  ),
                                  clearUnsetFields: false,
                                ),
                              ));
                            }(),
                          );
                          if (!functions
                              .getNextLesson(
                                  widget.courseDoc!.lessons.toList(),
                                  currentUserReference!)
                              .views
                              .contains(currentUserReference)) {
                            _model.list = await actions.userViewLesson(
                              functions.getNextLesson(
                                  widget.courseDoc!.lessons.toList(),
                                  currentUserReference!),
                              widget.courseDoc?.lessons.toList(),
                              currentUserReference!,
                            );
                            _shouldSetState = true;
                            unawaited(
                              () async {
                                await widget.courseDoc!.reference.update({
                                  ...mapToFirestore(
                                    {
                                      'lessons': getLessonListFirestoreData(
                                        _model.list,
                                      ),
                                    },
                                  ),
                                });
                              }(),
                            );
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          } else {
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          }
                        } else {
                          await action_blocks.notConnectedSnackBar(context);
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }

                        if (_shouldSetState) safeSetState(() {});
                      },
                      text: 'Начать',
                      icon: Icon(
                        FFIcons.ktextaa,
                        size: 24.0,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 52.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Vela Sans',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(28.0),
                      ),
                    );
                  } else {
                    return Visibility(
                      visible: false,
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Начать',
                        icon: Icon(
                          Icons.play_arrow,
                          size: 24.0,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 52.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Vela Sans',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(28.0),
                        ),
                      ),
                    );
                  }
                },
              );
            } else {
              return Builder(
                builder: (context) {
                  if (functions.getNextContentType(
                          widget.courseDoc!.lessons.toList(),
                          currentUserReference!) ==
                      ContentType.audio) {
                    return FFButtonWidget(
                      onPressed: () async {
                        if (FFAppState().hasInternetConnection) {
                          context.pushNamed(
                            AudioPlayerWidget.routeName,
                            queryParameters: {
                              'courseDoc': serializeParam(
                                widget.courseDoc,
                                ParamType.Document,
                              ),
                              'lessonIndex': serializeParam(
                                functions.lessonsIndexOf(
                                    functions.getNextLesson(
                                        widget.courseDoc!.lessons.toList(),
                                        currentUserReference!),
                                    widget.courseDoc!.lessons.toList()),
                                ParamType.int,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'courseDoc': widget.courseDoc,
                            },
                          );

                          unawaited(
                            () async {
                              await currentUserReference!
                                  .update(createUsersRecordData(
                                lastPlay: updateLastPlayStruct(
                                  LastPlayStruct(
                                    documentType: DocumentType.course,
                                    id: widget.courseDoc?.reference.id,
                                  ),
                                  clearUnsetFields: false,
                                ),
                              ));
                            }(),
                          );
                          return;
                        } else {
                          await action_blocks.notConnectedSnackBar(context);
                          return;
                        }
                      },
                      text: functions
                          .getNextLesson(widget.courseDoc!.lessons.toList(),
                              currentUserReference!)
                          .name,
                      icon: Icon(
                        Icons.play_arrow,
                        size: 24.0,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 52.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Vela Sans',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(28.0),
                      ),
                    );
                  } else if (functions.getNextContentType(
                          widget.courseDoc!.lessons.toList(),
                          currentUserReference!) ==
                      ContentType.video) {
                    return FFButtonWidget(
                      onPressed: () async {
                        var _shouldSetState = false;
                        if (FFAppState().hasInternetConnection) {
                          context.pushNamed(
                            VideoPlayerPageWidget.routeName,
                            queryParameters: {
                              'videoPath': serializeParam(
                                functions
                                    .getNextLesson(
                                        widget.courseDoc!.lessons.toList(),
                                        currentUserReference!)
                                    .video,
                                ParamType.String,
                              ),
                              'title': serializeParam(
                                functions
                                    .getNextLesson(
                                        widget.courseDoc!.lessons.toList(),
                                        currentUserReference!)
                                    .name,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );

                          unawaited(
                            () async {
                              await currentUserReference!
                                  .update(createUsersRecordData(
                                lastPlay: updateLastPlayStruct(
                                  LastPlayStruct(
                                    documentType: DocumentType.course,
                                    id: widget.courseDoc?.reference.id,
                                  ),
                                  clearUnsetFields: false,
                                ),
                              ));
                            }(),
                          );
                          if (!functions
                              .getNextLesson(
                                  widget.courseDoc!.lessons.toList(),
                                  currentUserReference!)
                              .views
                              .contains(currentUserReference)) {
                            _model.listCopy11 = await actions.userViewLesson(
                              functions.getNextLesson(
                                  widget.courseDoc!.lessons.toList(),
                                  currentUserReference!),
                              widget.courseDoc?.lessons.toList(),
                              currentUserReference!,
                            );
                            _shouldSetState = true;
                            unawaited(
                              () async {
                                await widget.courseDoc!.reference.update({
                                  ...mapToFirestore(
                                    {
                                      'lessons': getLessonListFirestoreData(
                                        _model.listCopy11,
                                      ),
                                    },
                                  ),
                                });
                              }(),
                            );
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          } else {
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          }
                        } else {
                          await action_blocks.notConnectedSnackBar(context);
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }

                        if (_shouldSetState) safeSetState(() {});
                      },
                      text: functions
                          .getNextLesson(widget.courseDoc!.lessons.toList(),
                              currentUserReference!)
                          .name,
                      icon: Icon(
                        FFIcons.kvideocamera,
                        size: 24.0,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 52.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Vela Sans',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(28.0),
                      ),
                    );
                  } else if (functions.getNextContentType(
                          widget.courseDoc!.lessons.toList(),
                          currentUserReference!) ==
                      ContentType.doc) {
                    return FFButtonWidget(
                      onPressed: () async {
                        var _shouldSetState = false;
                        if (FFAppState().hasInternetConnection) {
                          context.pushNamed(
                            PDFViewPageWidget.routeName,
                            queryParameters: {
                              'docPath': serializeParam(
                                functions
                                    .getNextLesson(
                                        widget.courseDoc!.lessons.toList(),
                                        currentUserReference!)
                                    .doc,
                                ParamType.String,
                              ),
                              'title': serializeParam(
                                functions
                                    .getNextLesson(
                                        widget.courseDoc!.lessons.toList(),
                                        currentUserReference!)
                                    .name,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );

                          unawaited(
                            () async {
                              await currentUserReference!
                                  .update(createUsersRecordData(
                                lastPlay: updateLastPlayStruct(
                                  LastPlayStruct(
                                    documentType: DocumentType.course,
                                    id: widget.courseDoc?.reference.id,
                                  ),
                                  clearUnsetFields: false,
                                ),
                              ));
                            }(),
                          );
                          if (!functions
                              .getNextLesson(
                                  widget.courseDoc!.lessons.toList(),
                                  currentUserReference!)
                              .views
                              .contains(currentUserReference)) {
                            _model.listone = await actions.userViewLesson(
                              functions.getNextLesson(
                                  widget.courseDoc!.lessons.toList(),
                                  currentUserReference!),
                              widget.courseDoc?.lessons.toList(),
                              currentUserReference!,
                            );
                            _shouldSetState = true;
                            unawaited(
                              () async {
                                await widget.courseDoc!.reference.update({
                                  ...mapToFirestore(
                                    {
                                      'lessons': getLessonListFirestoreData(
                                        _model.listone,
                                      ),
                                    },
                                  ),
                                });
                              }(),
                            );
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          } else {
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          }
                        } else {
                          await action_blocks.notConnectedSnackBar(context);
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }

                        if (_shouldSetState) safeSetState(() {});
                      },
                      text: functions
                          .getNextLesson(widget.courseDoc!.lessons.toList(),
                              currentUserReference!)
                          .name,
                      icon: Icon(
                        FFIcons.ktextaa,
                        size: 24.0,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 52.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Vela Sans',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(28.0),
                      ),
                    );
                  } else {
                    return Visibility(
                      visible: false,
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Повторить курс',
                        icon: Icon(
                          Icons.play_arrow,
                          size: 24.0,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 52.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Vela Sans',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(28.0),
                        ),
                      ),
                    );
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }
}
