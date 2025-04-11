import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/common/cards/course_card/course_card_widget.dart';
import '/common/cards/meditation_card/meditation_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'popular_and_new_block_model.dart';
export 'popular_and_new_block_model.dart';

class PopularAndNewBlockWidget extends StatefulWidget {
  const PopularAndNewBlockWidget({
    super.key,
    required this.courses,
    required this.meditations,
    required this.blockType,
  });

  final List<CoursesRecord>? courses;
  final List<MeditationsRecord>? meditations;
  final HomePageBlockType? blockType;

  @override
  State<PopularAndNewBlockWidget> createState() =>
      _PopularAndNewBlockWidgetState();
}

class _PopularAndNewBlockWidgetState extends State<PopularAndNewBlockWidget> {
  late PopularAndNewBlockModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopularAndNewBlockModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: (widget.courses != null && (widget.courses)!.isNotEmpty) ||
          (widget.meditations != null && (widget.meditations)!.isNotEmpty),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            if (widget.blockType == HomePageBlockType.isNew) {
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          'Новинки',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Vela Sans',
                                                color: Color(0xFF131316),
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                      Icon(
                                        FFIcons.knewIcon,
                                        color: Color(0xFFF0AB44),
                                        size: 16.0,
                                      ),
                                    ].divide(SizedBox(width: 10.0)),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      'Самые последние выпуски',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Vela Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 3.0)),
                              );
                            } else if (widget.blockType ==
                                HomePageBlockType.isPopural) {
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          'Популярно сейчас',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Vela Sans',
                                                color: Color(0xFF131316),
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                      Icon(
                                        FFIcons.kpopular,
                                        color: Color(0xFFF0AB44),
                                        size: 16.0,
                                      ),
                                    ].divide(SizedBox(width: 10.0)),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      'Чаще всего выбирают пользователи',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Vela Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 3.0)),
                              );
                            } else {
                              return Container(
                                width: 1.0,
                                height: 1.0,
                                decoration: BoxDecoration(),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.meditations != null &&
                  (widget.meditations)!.isNotEmpty)
                Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                'МЕДИТАЦИИ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Vela Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  HomeContentPageWidget.routeName,
                                  queryParameters: {
                                    'meditationDocs': serializeParam(
                                      widget.meditations,
                                      ParamType.Document,
                                      isList: true,
                                    ),
                                    'coursesDocs': serializeParam(
                                      widget.courses,
                                      ParamType.Document,
                                      isList: true,
                                    ),
                                    'type': serializeParam(
                                      widget.blockType,
                                      ParamType.Enum,
                                    ),
                                    'initialIndex': serializeParam(
                                      1,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'meditationDocs': widget.meditations,
                                    'coursesDocs': widget.courses,
                                  },
                                );
                              },
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final meditations = widget.meditations!.toList();

                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(meditations.length,
                                        (meditationsIndex) {
                                  final meditationsItem =
                                      meditations[meditationsIndex];
                                  return MeditationCardWidget(
                                    key: Key(
                                        'Keyfy9_${meditationsIndex}_of_${meditations.length}'),
                                    cardType: CardType.standart,
                                    meditationDoc: meditationsItem,
                                  );
                                })
                                    .divide(SizedBox(width: 8.0))
                                    .addToStart(SizedBox(width: 16.0))
                                    .addToEnd(SizedBox(width: 16.0)),
                              ),
                            );
                          },
                        ),
                      ),
                    ].divide(SizedBox(height: 10.0)),
                  ),
                ),
              if (widget.courses != null && (widget.courses)!.isNotEmpty)
                Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                'КУРСЫ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Vela Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  HomeContentPageWidget.routeName,
                                  queryParameters: {
                                    'meditationDocs': serializeParam(
                                      widget.meditations,
                                      ParamType.Document,
                                      isList: true,
                                    ),
                                    'coursesDocs': serializeParam(
                                      widget.courses,
                                      ParamType.Document,
                                      isList: true,
                                    ),
                                    'type': serializeParam(
                                      widget.blockType,
                                      ParamType.Enum,
                                    ),
                                    'initialIndex': serializeParam(
                                      0,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'meditationDocs': widget.meditations,
                                    'coursesDocs': widget.courses,
                                  },
                                );
                              },
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final courses = widget.courses!.toList();

                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(courses.length,
                                        (coursesIndex) {
                                  final coursesItem = courses[coursesIndex];
                                  return CourseCardWidget(
                                    key: Key(
                                        'Keygdm_${coursesIndex}_of_${courses.length}'),
                                    cardType: CardType.big,
                                    courseDoc: coursesItem,
                                  );
                                })
                                    .divide(SizedBox(width: 6.0))
                                    .addToStart(SizedBox(width: 16.0))
                                    .addToEnd(SizedBox(width: 16.0)),
                              ),
                            );
                          },
                        ),
                      ),
                    ].divide(SizedBox(height: 10.0)),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
