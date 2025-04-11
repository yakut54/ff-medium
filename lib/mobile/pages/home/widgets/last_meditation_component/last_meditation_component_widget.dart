import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/common/loading_component/loading_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'last_meditation_component_model.dart';
export 'last_meditation_component_model.dart';

class LastMeditationComponentWidget extends StatefulWidget {
  const LastMeditationComponentWidget({
    super.key,
    required this.userDoc,
  });

  final UsersRecord? userDoc;

  @override
  State<LastMeditationComponentWidget> createState() =>
      _LastMeditationComponentWidgetState();
}

class _LastMeditationComponentWidgetState
    extends State<LastMeditationComponentWidget> {
  late LastMeditationComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LastMeditationComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: 500.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: StreamBuilder<MeditationsRecord>(
              stream: MeditationsRecord.getDocument(
                  functions.homeGetLastPlayMeditationReference(
                      widget.userDoc!.lastPlay.id))
                ..listen((containerMeditationsRecord) async {
                  if (_model.containerPreviousSnapshot != null &&
                      !MeditationsRecordDocumentEquality().equals(
                          containerMeditationsRecord,
                          _model.containerPreviousSnapshot)) {
                    if (containerMeditationsRecord.isDeleted) {
                      FFAppState().hasLastPlay = false;
                      _model.updatePage(() {});

                      await currentUserReference!.update(createUsersRecordData(
                        lastPlay: createLastPlayStruct(delete: true),
                      ));

                      safeSetState(() {});
                      return;
                    } else {
                      safeSetState(() {});
                      return;
                    }

                    safeSetState(() {});
                  }
                  _model.containerPreviousSnapshot = containerMeditationsRecord;
                }),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return LoadingComponentWidget();
                }

                final containerMeditationsRecord = snapshot.data!;

                return InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    _model.meditationCategories =
                        await actions.meditationsGetCategories(
                      containerMeditationsRecord,
                    );

                    context.pushNamed(
                      MeditationPageWidget.routeName,
                      queryParameters: {
                        'meditationDoc': serializeParam(
                          containerMeditationsRecord,
                          ParamType.Document,
                        ),
                        'categoryDocs': serializeParam(
                          _model.meditationCategories,
                          ParamType.Document,
                          isList: true,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        'meditationDoc': containerMeditationsRecord,
                        'categoryDocs': _model.meditationCategories,
                      },
                    );

                    safeSetState(() {});
                  },
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            child: Stack(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: CachedNetworkImage(
                                    fadeInDuration: Duration(milliseconds: 250),
                                    fadeOutDuration:
                                        Duration(milliseconds: 250),
                                    imageUrl: containerMeditationsRecord.photo,
                                    width: 200.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  width: 80.0,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x56000000),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                                Container(
                                  width: 20.0,
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Icon(
                                  Icons.play_circle,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 38.0,
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 16.0, 0.0),
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Vela Sans',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                            TextSpan(
                                              text: containerMeditationsRecord
                                                  .name,
                                              style: TextStyle(),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Vela Sans',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        maxLines: 2,
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) {
                                        if (functions.userViews(
                                                containerMeditationsRecord
                                                    .lessons
                                                    .toList(),
                                                currentUserReference!) ==
                                            containerMeditationsRecord
                                                .lessons.length) {
                                          return RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Пройдено ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Vela Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                      ),
                                                )
                                              ],
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Vela Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                          );
                                        } else {
                                          return RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Пройдено ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Vela Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: functions
                                                      .userViews(
                                                          containerMeditationsRecord
                                                              .lessons
                                                              .toList(),
                                                          currentUserReference!)
                                                      .toString(),
                                                  style: TextStyle(),
                                                ),
                                                TextSpan(
                                                  text: '/',
                                                  style: TextStyle(),
                                                ),
                                                TextSpan(
                                                  text:
                                                      containerMeditationsRecord
                                                          .lessons.length
                                                          .toString(),
                                                  style: TextStyle(),
                                                )
                                              ],
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Vela Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ].divide(SizedBox(height: 2.0)),
                                ),
                                if (functions.userViews(
                                        containerMeditationsRecord.lessons
                                            .toList(),
                                        currentUserReference!) !=
                                    containerMeditationsRecord.lessons.length)
                                  Text(
                                    'Нажмите чтобы продолжить',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Vela Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                              ],
                            ),
                          ),
                        ].divide(SizedBox(width: 16.0)),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
