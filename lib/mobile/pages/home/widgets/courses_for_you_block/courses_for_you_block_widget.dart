import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/common/cards/course_card/course_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'courses_for_you_block_model.dart';
export 'courses_for_you_block_model.dart';

class CoursesForYouBlockWidget extends StatefulWidget {
  const CoursesForYouBlockWidget({
    super.key,
    required this.courses,
    required this.meditations,
  });

  final List<CoursesRecord>? courses;
  final List<MeditationsRecord>? meditations;

  @override
  State<CoursesForYouBlockWidget> createState() =>
      _CoursesForYouBlockWidgetState();
}

class _CoursesForYouBlockWidgetState extends State<CoursesForYouBlockWidget> {
  late CoursesForYouBlockModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CoursesForYouBlockModel());

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
      visible: valueOrDefault<bool>(currentUserDocument?.isAuthorized, false) &&
          (widget.courses != null && (widget.courses)!.isNotEmpty),
      child: AuthUserStreamWidget(
        builder: (context) => Container(
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
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Text(
                              'Курсы специально для вас',
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
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Text(
                              'Подобрано на основе ваших ответов',
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
                        ],
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
                                HomePageBlockType.isForYou,
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
                          color: FlutterFlowTheme.of(context).secondaryText,
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
                          children:
                              List.generate(courses.length, (coursesIndex) {
                            final coursesItem = courses[coursesIndex];
                            return CourseCardWidget(
                              key: Key(
                                  'Keynzg_${coursesIndex}_of_${courses.length}'),
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
              ].divide(SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}
