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
import 'meditation_play_button_model.dart';
export 'meditation_play_button_model.dart';

class MeditationPlayButtonWidget extends StatefulWidget {
  const MeditationPlayButtonWidget({
    super.key,
    required this.meditationDoc,
  });

  final MeditationsRecord? meditationDoc;

  @override
  State<MeditationPlayButtonWidget> createState() =>
      _MeditationPlayButtonWidgetState();
}

class _MeditationPlayButtonWidgetState
    extends State<MeditationPlayButtonWidget> {
  late MeditationPlayButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeditationPlayButtonModel());

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
            if (functions.getContentType(functions.getNextLesson(
                    widget.meditationDoc!.lessons.toList(),
                    currentUserReference!)) ==
                ContentType.audio) {
              return FFButtonWidget(
                onPressed: () async {
                  if (FFAppState().hasInternetConnection) {
                    context.pushNamed(
                      AudioPlayerWidget.routeName,
                      queryParameters: {
                        'meditationDoc': serializeParam(
                          widget.meditationDoc,
                          ParamType.Document,
                        ),
                        'lessonIndex': serializeParam(
                          functions.lessonsIndexOf(
                              functions.getNextLesson(
                                  widget.meditationDoc!.lessons.toList(),
                                  currentUserReference!),
                              widget.meditationDoc!.lessons.toList()),
                          ParamType.int,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        'meditationDoc': widget.meditationDoc,
                      },
                    );

                    unawaited(
                      () async {
                        await currentUserReference!
                            .update(createUsersRecordData(
                          lastPlay: updateLastPlayStruct(
                            LastPlayStruct(
                              documentType: DocumentType.meditation,
                              id: widget.meditationDoc?.reference.id,
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
                text: 'Начать медитацию',
                icon: Icon(
                  Icons.play_arrow,
                  size: 24.0,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 52.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
            } else if (functions.getContentType(functions.getNextLesson(
                    widget.meditationDoc!.lessons.toList(),
                    currentUserReference!)) ==
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
                                  widget.meditationDoc!.lessons.toList(),
                                  currentUserReference!)
                              .video,
                          ParamType.String,
                        ),
                        'title': serializeParam(
                          functions
                              .getNextLesson(
                                  widget.meditationDoc!.lessons.toList(),
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
                              documentType: DocumentType.meditation,
                              id: widget.meditationDoc?.reference.id,
                            ),
                            clearUnsetFields: false,
                          ),
                        ));
                      }(),
                    );
                    if (!functions
                        .getNextLesson(widget.meditationDoc!.lessons.toList(),
                            currentUserReference!)
                        .views
                        .contains(currentUserReference)) {
                      _model.listVideo = await actions.userViewLesson(
                        functions.getNextLesson(
                            widget.meditationDoc!.lessons.toList(),
                            currentUserReference!),
                        widget.meditationDoc?.lessons.toList(),
                        currentUserReference!,
                      );
                      _shouldSetState = true;
                      unawaited(
                        () async {
                          await widget.meditationDoc!.reference.update({
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
                text: 'Начать медитацию',
                icon: Icon(
                  Icons.play_arrow,
                  size: 24.0,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 52.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
            } else if (functions.getContentType(functions.getNextLesson(
                    widget.meditationDoc!.lessons.toList(),
                    currentUserReference!)) ==
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
                                  widget.meditationDoc!.lessons.toList(),
                                  currentUserReference!)
                              .doc,
                          ParamType.String,
                        ),
                        'title': serializeParam(
                          functions
                              .getNextLesson(
                                  widget.meditationDoc!.lessons.toList(),
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
                              documentType: DocumentType.meditation,
                              id: widget.meditationDoc?.reference.id,
                            ),
                            clearUnsetFields: false,
                          ),
                        ));
                      }(),
                    );
                    if (!functions
                        .getNextLesson(widget.meditationDoc!.lessons.toList(),
                            currentUserReference!)
                        .views
                        .contains(currentUserReference)) {
                      _model.listDoc = await actions.userViewLesson(
                        functions.getNextLesson(
                            widget.meditationDoc!.lessons.toList(),
                            currentUserReference!),
                        widget.meditationDoc?.lessons.toList(),
                        currentUserReference!,
                      );
                      _shouldSetState = true;
                      unawaited(
                        () async {
                          await widget.meditationDoc!.reference.update({
                            ...mapToFirestore(
                              {
                                'lessons': getLessonListFirestoreData(
                                  _model.listDoc,
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
                text: 'Начать медитацию',
                icon: Icon(
                  FFIcons.ktextaa,
                  size: 24.0,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 52.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
                  text: 'Начать медитацию',
                  icon: Icon(
                    Icons.play_arrow,
                    size: 24.0,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 52.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
        ),
      ),
    );
  }
}
