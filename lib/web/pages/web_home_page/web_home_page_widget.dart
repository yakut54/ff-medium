import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/web/screens/categories/categories_screen/categories_screen_widget.dart';
import '/web/screens/courses/courses_screen/courses_screen_widget.dart';
import '/web/screens/hits/hits_screen/hits_screen_widget.dart';
import '/web/screens/meditations/meditations_screen/meditations_screen_widget.dart';
import '/web/screens/meditations/womens_meditations_screen/womens_meditations_screen_widget.dart';
import '/web/screens/onboarding/onboarding_screen/onboarding_screen_widget.dart';
import '/web/screens/tiers/tiers_screen/tiers_screen_widget.dart';
import '/web/screens/users_screen/users_screen_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'web_home_page_model.dart';
export 'web_home_page_model.dart';

class WebHomePageWidget extends StatefulWidget {
  const WebHomePageWidget({super.key});

  static String routeName = 'WebHomePage';
  static String routePath = '/home';

  @override
  State<WebHomePageWidget> createState() => _WebHomePageWidgetState();
}

class _WebHomePageWidgetState extends State<WebHomePageWidget>
    with TickerProviderStateMixin {
  late WebHomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WebHomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.pageState = LoadingState.loading;
      safeSetState(() {});
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          if (currentUserDocument?.role != null) {
            _model.instantTimer?.cancel();
            await action_blocks.pageFor(
              context,
              role: currentUserDocument?.role,
            );
            _model.pageState = LoadingState.loaded;
            safeSetState(() {});
            return;
          } else {
            return;
          }
        },
        startImmediately: true,
      );
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Builder(
            builder: (context) {
              if (_model.pageState == LoadingState.loaded) {
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 50.0, 10.0, 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 200.0,
                              decoration: BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  final tabItems = _model.tabs.toList();

                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List.generate(tabItems.length,
                                        (tabItemsIndex) {
                                      final tabItemsItem =
                                          tabItems[tabItemsIndex];
                                      return Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            _model.currentScreen = tabItemsItem;
                                            safeSetState(() {});
                                          },
                                          text: tabItemsItem,
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: tabItemsItem ==
                                                    _model.currentScreen
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryBackground
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Vela Sans',
                                                      color: tabItemsItem ==
                                                              _model
                                                                  .currentScreen
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: false,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(8.0),
                                              topLeft: Radius.circular(0.0),
                                              topRight: Radius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      );
                                    }).divide(SizedBox(height: 5.0)),
                                  );
                                },
                              ),
                            ),
                            Container(
                              width: 200.0,
                              decoration: BoxDecoration(),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    GoRouter.of(context).prepareAuthEvent();
                                    await authManager.signOut();
                                    GoRouter.of(context)
                                        .clearRedirectLocation();

                                    context.goNamedAuth(
                                        SplashScreenLWidget.routeName,
                                        context.mounted);
                                  },
                                  text: 'Выйти из аккаунта',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFFFF3939),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
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
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(8.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 10.0, 10.0),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                _model.currentScreen,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Vela Sans',
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                    ),
                              ),
                              Expanded(
                                child: Container(
                                  height: double.infinity,
                                  child: Stack(
                                    children: [
                                      if (_model.currentScreen == 'Категории')
                                        wrapWithModel(
                                          model: _model.categoriesScreenModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: CategoriesScreenWidget(),
                                        ),
                                      if (_model.currentScreen == 'Онбординг')
                                        wrapWithModel(
                                          model: _model.onboardingScreenModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: OnboardingScreenWidget(),
                                        ),
                                      if (_model.currentScreen ==
                                          'Курсы и медитации')
                                        Column(
                                          children: [
                                            Align(
                                              alignment: Alignment(0.0, 0),
                                              child: TabBar(
                                                labelColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                unselectedLabelColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              'Vela Sans',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                unselectedLabelStyle:
                                                    TextStyle(),
                                                indicatorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                padding: EdgeInsets.all(4.0),
                                                tabs: [
                                                  Tab(
                                                    text: 'Курсы',
                                                  ),
                                                  Tab(
                                                    text: 'Медитации',
                                                  ),
                                                ],
                                                controller:
                                                    _model.tabBarController,
                                                onTap: (i) async {
                                                  [
                                                    () async {},
                                                    () async {}
                                                  ][i]();
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: TabBarView(
                                                controller:
                                                    _model.tabBarController,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                children: [
                                                  wrapWithModel(
                                                    model: _model
                                                        .coursesScreenModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        CoursesScreenWidget(),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .meditationsScreenModel,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          MeditationsScreenWidget(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      if ((_model.currentScreen ==
                                              'Пользователи') &&
                                          false)
                                        wrapWithModel(
                                          model: _model.usersScreenModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: UsersScreenWidget(),
                                        ),
                                      if (_model.currentScreen == 'Хиты')
                                        wrapWithModel(
                                          model: _model.hitsScreenModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: HitsScreenWidget(),
                                        ),
                                      if (_model.currentScreen == 'Подписки')
                                        wrapWithModel(
                                          model: _model.tiersScreenModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: TiersScreenWidget(),
                                        ),
                                      if (_model.currentScreen ==
                                          'Женские медитации')
                                        wrapWithModel(
                                          model: _model
                                              .womensMeditationsScreenModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child:
                                              WomensMeditationsScreenWidget(),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else if (_model.pageState == LoadingState.loading) {
                return Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: custom_widgets.MartaNGLoading(
                    width: 1.0,
                    height: 1.0,
                    message: 'Идёт загрузка...',
                  ),
                );
              } else {
                return Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
