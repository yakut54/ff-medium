import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/common/loading_component/loading_component_widget.dart';
import '/components/not_connected_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/mobile/pages/home/widgets/courses_for_you_block/courses_for_you_block_widget.dart';
import '/mobile/pages/home/widgets/hits_block/hits_block_widget.dart';
import '/mobile/pages/home/widgets/last_course_component/last_course_component_widget.dart';
import '/mobile/pages/home/widgets/last_meditation_component/last_meditation_component_widget.dart';
import '/mobile/pages/home/widgets/meditations_for_you_block/meditations_for_you_block_widget.dart';
import '/mobile/pages/home/widgets/podcasts_block/podcasts_block_widget.dart';
import '/mobile/pages/home/widgets/popular_and_new_block/popular_and_new_block_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().hasInternetConnection &&
          !FFAppState().hasVpnConnection) {
        if (valueOrDefault<bool>(currentUserDocument?.isAuthorized, false)) {
          _model.isNew = await action_blocks.isNewUser(context);
          if (_model.isNew!) {
            return;
          }
        }
        await Future.wait([
          Future(() async {
            _model.meditations = await queryMeditationsRecordOnce(
              queryBuilder: (meditationsRecord) => meditationsRecord.where(
                'is_deleted',
                isEqualTo: false,
              ),
            );
          }),
          Future(() async {}),
          Future(() async {
            _model.courses = await queryCoursesRecordOnce(
              queryBuilder: (coursesRecord) => coursesRecord.where(
                'is_deleted',
                isEqualTo: false,
              ),
            );
          }),
          Future(() async {
            _model.sub = await SubscriptionsRecord.getDocumentOnce(
                functions.userGetSubscroptionRef());
            _model.json = await actions.subscriptionToJson(
              _model.sub,
            );
            FFAppState().subscriptionSnapshot = _model.json!;
            safeSetState(() {});
          }),
        ]);
        _model.courseDocs = _model.courses!.toList().cast<CoursesRecord>();
        _model.meditationDocs =
            _model.meditations!.toList().cast<MeditationsRecord>();
        _model.pageState = LoadingState.loaded;
        safeSetState(() {});
        return;
      } else {
        _model.pageState = LoadingState.failure;
        safeSetState(() {});
        return;
      }
    });

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
        body: Builder(
          builder: (context) {
            if (_model.pageState == LoadingState.loaded) {
              return ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            height: 400.0,
                            decoration: BoxDecoration(),
                            child: Stack(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                    ),
                                    child: Opacity(
                                      opacity: 0.7,
                                      child: Image.asset(
                                        'assets/images/8cfe44de2feeb09753fd22ae6e2dd050.png',
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                if (!valueOrDefault<bool>(
                                    currentUserDocument?.isAuthorized, false))
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 7.0, 0.0, 32.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => FFButtonWidget(
                                          onPressed: () async {
                                            GoRouter.of(context)
                                                .prepareAuthEvent();
                                            await authManager.signOut();
                                            GoRouter.of(context)
                                                .clearRedirectLocation();

                                            context.goNamedAuth(
                                                SplashScreenLWidget.routeName,
                                                context.mounted);
                                          },
                                          text: 'Войти или зарегистрироваться',
                                          options: FFButtonOptions(
                                            width: 265.0,
                                            height: 44.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Vela Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: false,
                                                ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(14.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/a414e4835acebf77f38249ec28072df4.png',
                                      width: 240.0,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0,
                                valueOrDefault<double>(
                                  valueOrDefault<bool>(
                                              currentUserDocument?.isAuthorized,
                                              false) &&
                                          FFAppState().hasLastPlay
                                      ? 40.0
                                      : 0.0,
                                  0.0,
                                ),
                                0.0,
                                0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  wrapWithModel(
                                    model: _model.coursesForYouBlockModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: CoursesForYouBlockWidget(
                                      courses: functions.homeGetCoursesForYou(
                                          _model.courseDocs.toList(), true),
                                      meditations:
                                          functions.homeGetMeditationsForYou(
                                              _model.meditationDocs.toList(),
                                              true),
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.meditationsForYouBlockModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: MeditationsForYouBlockWidget(
                                      meditations:
                                          functions.homeGetMeditationsForYou(
                                              _model.meditationDocs.toList(),
                                              true),
                                      courses: functions.homeGetCoursesForYou(
                                          _model.courseDocs.toList(), true),
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.popularAndNewBlockModel1,
                                    updateCallback: () => safeSetState(() {}),
                                    child: PopularAndNewBlockWidget(
                                      meditations:
                                          functions.homeGetPopularMeditations(
                                              _model.meditationDocs.toList(),
                                              false,
                                              true),
                                      blockType: HomePageBlockType.isPopural,
                                      courses: functions.homeGetPopularCourses(
                                          _model.courseDocs.toList(),
                                          false,
                                          true),
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.podcastsBlockModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: PodcastsBlockWidget(
                                      meditations:
                                          functions.homeGetPodcastMeditatation(
                                              _model.meditationDocs.toList(),
                                              true)!,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.popularAndNewBlockModel2,
                                    updateCallback: () => safeSetState(() {}),
                                    child: PopularAndNewBlockWidget(
                                      meditations:
                                          functions.homeGetNewMeditations(
                                              _model.meditationDocs.toList()),
                                      blockType: HomePageBlockType.isNew,
                                      courses: functions.homeGetNewCourses(
                                          _model.courseDocs.toList()),
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.hitsBlockModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: HitsBlockWidget(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      StreamBuilder<UsersRecord>(
                        stream: UsersRecord.getDocument(currentUserReference!),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 4.0,
                                height: 4.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.transparent,
                                  ),
                                ),
                              ),
                            );
                          }

                          final containerUsersRecord = snapshot.data!;

                          return Container(
                            decoration: BoxDecoration(),
                            child: Visibility(
                              visible: containerUsersRecord.isAuthorized &&
                                  containerUsersRecord.lastPlay
                                      .hasDocumentType(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 350.0, 16.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    if (containerUsersRecord
                                            .lastPlay.documentType ==
                                        DocumentType.meditation) {
                                      return wrapWithModel(
                                        model:
                                            _model.lastMeditationComponentModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: LastMeditationComponentWidget(
                                          userDoc: containerUsersRecord,
                                        ),
                                      );
                                    } else if (containerUsersRecord
                                            .lastPlay.documentType ==
                                        DocumentType.course) {
                                      return wrapWithModel(
                                        model: _model.lastCourseComponentModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: LastCourseComponentWidget(
                                          userDoc: containerUsersRecord,
                                        ),
                                      );
                                    } else {
                                      return Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          width: 1.0,
                                          height: 1.0,
                                          decoration: BoxDecoration(
                                            color: Color(0x00FFFFFF),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              );
            } else if (_model.pageState == LoadingState.loading) {
              return wrapWithModel(
                model: _model.loadingComponentModel,
                updateCallback: () => safeSetState(() {}),
                child: LoadingComponentWidget(
                  message: 'Идет загрузка...',
                ),
              );
            } else {
              return Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: wrapWithModel(
                  model: _model.notConnectedComponentModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NotConnectedComponentWidget(
                    action: () async {
                      var _shouldSetState = false;
                      if (FFAppState().hasInternetConnection &&
                          !FFAppState().hasVpnConnection) {
                        _model.pageState = LoadingState.loading;
                        safeSetState(() {});
                        if (valueOrDefault<bool>(
                            currentUserDocument?.isAuthorized, false)) {
                          _model.isNewCopy =
                              await action_blocks.isNewUser(context);
                          _shouldSetState = true;
                          if (_model.isNewCopy!) {
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          }
                        }
                        await Future.wait([
                          Future(() async {
                            _model.forceMeditations =
                                await queryMeditationsRecordOnce(
                              queryBuilder: (meditationsRecord) =>
                                  meditationsRecord.where(
                                'is_deleted',
                                isEqualTo: false,
                              ),
                            );
                            _shouldSetState = true;
                          }),
                          Future(() async {
                            if (FFAppState().deviceInfo.countryCode == '') {
                              _model.forceWhoIsResponse =
                                  await WhoisCall.call();

                              _shouldSetState = true;
                              FFAppState().updateDeviceInfoStruct(
                                (e) => e
                                  ..countryCode = WhoisCall.countryCode(
                                    (_model.forceWhoIsResponse?.jsonBody ?? ''),
                                  ),
                              );

                              await currentUserReference!
                                  .update(createUsersRecordData(
                                countryCode: WhoisCall.countryCode(
                                  (_model.forceWhoIsResponse?.jsonBody ?? ''),
                                ),
                              ));
                            }
                          }),
                          Future(() async {
                            _model.forceCourses = await queryCoursesRecordOnce(
                              queryBuilder: (coursesRecord) =>
                                  coursesRecord.where(
                                'is_deleted',
                                isEqualTo: false,
                              ),
                            );
                            _shouldSetState = true;
                          }),
                          Future(() async {
                            _model.forceSub =
                                await SubscriptionsRecord.getDocumentOnce(
                                    functions.userGetSubscroptionRef());
                            _shouldSetState = true;
                            _model.forceJson = await actions.subscriptionToJson(
                              _model.forceSub,
                            );
                            _shouldSetState = true;
                            FFAppState().subscriptionSnapshot =
                                _model.forceJson!;
                            safeSetState(() {});
                          }),
                        ]);
                        _model.courseDocs =
                            _model.forceCourses!.toList().cast<CoursesRecord>();
                        _model.meditationDocs = _model.forceMeditations!
                            .toList()
                            .cast<MeditationsRecord>();
                        _model.pageState = LoadingState.loaded;
                        safeSetState(() {});
                        if (_shouldSetState) safeSetState(() {});
                        return;
                      } else {
                        _model.pageState = LoadingState.failure;
                        safeSetState(() {});
                        if (_shouldSetState) safeSetState(() {});
                        return;
                      }

                      if (_shouldSetState) safeSetState(() {});
                    },
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
