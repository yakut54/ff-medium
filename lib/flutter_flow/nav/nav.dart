import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';

import '/auth/base_auth_user_provider.dart';

import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? SplashScreenHWidget()
          : SplashScreenLWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? SplashScreenHWidget()
              : SplashScreenLWidget(),
        ),
        FFRoute(
          name: SplashScreenHWidget.routeName,
          path: SplashScreenHWidget.routePath,
          builder: (context, params) => SplashScreenHWidget(),
        ),
        FFRoute(
          name: SplashScreenLWidget.routeName,
          path: SplashScreenLWidget.routePath,
          builder: (context, params) => SplashScreenLWidget(),
        ),
        FFRoute(
          name: RegistrationPageWidget.routeName,
          path: RegistrationPageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => RegistrationPageWidget(),
        ),
        FFRoute(
          name: OnboardingPageWidget.routeName,
          path: OnboardingPageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => OnboardingPageWidget(
            username: params.getParam(
              'username',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: WebHomePageWidget.routeName,
          path: WebHomePageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => WebHomePageWidget(),
        ),
        FFRoute(
          name: HomePageWidget.routeName,
          path: HomePageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => HomePageWidget(),
        ),
        FFRoute(
          name: WebAccessDeniedWidget.routeName,
          path: WebAccessDeniedWidget.routePath,
          requireAuth: true,
          builder: (context, params) => WebAccessDeniedWidget(),
        ),
        FFRoute(
          name: NavBarPageWidget.routeName,
          path: NavBarPageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => NavBarPageWidget(),
        ),
        FFRoute(
          name: ProfilePageWidget.routeName,
          path: ProfilePageWidget.routePath,
          builder: (context, params) => ProfilePageWidget(),
        ),
        FFRoute(
          name: CatalogPageWidget.routeName,
          path: CatalogPageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => CatalogPageWidget(),
        ),
        FFRoute(
          name: CategoriesPageWidget.routeName,
          path: CategoriesPageWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'meditationDocs':
                getDocList(['meditations'], MeditationsRecord.fromSnapshot),
            'categoryDoc':
                getDoc(['categories'], CategoriesRecord.fromSnapshot),
            'coursesDocs': getDocList(['courses'], CoursesRecord.fromSnapshot),
          },
          builder: (context, params) => CategoriesPageWidget(
            meditationDocs: params.getParam<MeditationsRecord>(
              'meditationDocs',
              ParamType.Document,
              isList: true,
            ),
            categoryDoc: params.getParam(
              'categoryDoc',
              ParamType.Document,
            ),
            coursesDocs: params.getParam<CoursesRecord>(
              'coursesDocs',
              ParamType.Document,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: MeditationPageWidget.routeName,
          path: MeditationPageWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'meditationDoc':
                getDoc(['meditations'], MeditationsRecord.fromSnapshot),
            'categoryDocs':
                getDocList(['categories'], CategoriesRecord.fromSnapshot),
          },
          builder: (context, params) => MeditationPageWidget(
            meditationDoc: params.getParam(
              'meditationDoc',
              ParamType.Document,
            ),
            categoryDocs: params.getParam<CategoriesRecord>(
              'categoryDocs',
              ParamType.Document,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: AdminVideoPageWidget.routeName,
          path: AdminVideoPageWidget.routePath,
          builder: (context, params) => AdminVideoPageWidget(
            videoUrl: params.getParam(
              'videoUrl',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: CoursePageWidget.routeName,
          path: CoursePageWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'courseDoc': getDoc(['courses'], CoursesRecord.fromSnapshot),
            'categoryDocs':
                getDocList(['categories'], CategoriesRecord.fromSnapshot),
          },
          builder: (context, params) => CoursePageWidget(
            courseDoc: params.getParam(
              'courseDoc',
              ParamType.Document,
            ),
            categoryDocs: params.getParam<CategoriesRecord>(
              'categoryDocs',
              ParamType.Document,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: TermsPageWidget.routeName,
          path: TermsPageWidget.routePath,
          builder: (context, params) => TermsPageWidget(),
        ),
        FFRoute(
          name: ProfileSettingsPageWidget.routeName,
          path: ProfileSettingsPageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ProfileSettingsPageWidget(),
        ),
        FFRoute(
          name: AboutAppPageWidget.routeName,
          path: AboutAppPageWidget.routePath,
          builder: (context, params) => AboutAppPageWidget(),
        ),
        FFRoute(
          name: DebugPageWidget.routeName,
          path: DebugPageWidget.routePath,
          builder: (context, params) => DebugPageWidget(),
        ),
        FFRoute(
          name: VideoPlayerPageWidget.routeName,
          path: VideoPlayerPageWidget.routePath,
          builder: (context, params) => VideoPlayerPageWidget(
            videoPath: params.getParam(
              'videoPath',
              ParamType.String,
            ),
            title: params.getParam(
              'title',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: PDFViewPageWidget.routeName,
          path: PDFViewPageWidget.routePath,
          builder: (context, params) => PDFViewPageWidget(
            docPath: params.getParam(
              'docPath',
              ParamType.String,
            ),
            title: params.getParam(
              'title',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: AudioPlayerWidget.routeName,
          path: AudioPlayerWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'meditationDoc':
                getDoc(['meditations'], MeditationsRecord.fromSnapshot),
            'courseDoc': getDoc(['courses'], CoursesRecord.fromSnapshot),
          },
          builder: (context, params) => AudioPlayerWidget(
            meditationDoc: params.getParam(
              'meditationDoc',
              ParamType.Document,
            ),
            courseDoc: params.getParam(
              'courseDoc',
              ParamType.Document,
            ),
            lessonIndex: params.getParam(
              'lessonIndex',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: LoginPageWidget.routeName,
          path: LoginPageWidget.routePath,
          builder: (context, params) => LoginPageWidget(
            showAnonLogin: params.getParam(
              'showAnonLogin',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: PhoneVerifyPageWidget.routeName,
          path: PhoneVerifyPageWidget.routePath,
          builder: (context, params) => PhoneVerifyPageWidget(
            phoneNumber: params.getParam(
              'phoneNumber',
              ParamType.String,
            ),
            timer: params.getParam(
              'timer',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: PrivacyPolicyPageWidget.routeName,
          path: PrivacyPolicyPageWidget.routePath,
          builder: (context, params) => PrivacyPolicyPageWidget(),
        ),
        FFRoute(
          name: WebLoginPageWidget.routeName,
          path: WebLoginPageWidget.routePath,
          builder: (context, params) => WebLoginPageWidget(),
        ),
        FFRoute(
          name: SubscriptionsPageWidget.routeName,
          path: SubscriptionsPageWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'appRecord': getDoc(['app'], AppRecord.fromSnapshot),
          },
          builder: (context, params) => SubscriptionsPageWidget(
            appRecord: params.getParam(
              'appRecord',
              ParamType.Document,
            ),
            showCloseIcon: params.getParam(
              'showCloseIcon',
              ParamType.bool,
            ),
            showPopUp: params.getParam(
              'showPopUp',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: DebugSnackbarPageWidget.routeName,
          path: DebugSnackbarPageWidget.routePath,
          builder: (context, params) => DebugSnackbarPageWidget(),
        ),
        FFRoute(
          name: DebugInternetConnectionCheckerWidget.routeName,
          path: DebugInternetConnectionCheckerWidget.routePath,
          builder: (context, params) => DebugInternetConnectionCheckerWidget(),
        ),
        FFRoute(
          name: DebugLoadingIndicatorWidget.routeName,
          path: DebugLoadingIndicatorWidget.routePath,
          builder: (context, params) => DebugLoadingIndicatorWidget(),
        ),
        FFRoute(
          name: HomeContentPageWidget.routeName,
          path: HomeContentPageWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'meditationDocs':
                getDocList(['meditations'], MeditationsRecord.fromSnapshot),
            'coursesDocs': getDocList(['courses'], CoursesRecord.fromSnapshot),
          },
          builder: (context, params) => HomeContentPageWidget(
            meditationDocs: params.getParam<MeditationsRecord>(
              'meditationDocs',
              ParamType.Document,
              isList: true,
            ),
            coursesDocs: params.getParam<CoursesRecord>(
              'coursesDocs',
              ParamType.Document,
              isList: true,
            ),
            type: params.getParam<HomePageBlockType>(
              'type',
              ParamType.Enum,
            ),
            initialIndex: params.getParam(
              'initialIndex',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: CloudpaymentsWebViewWidget.routeName,
          path: CloudpaymentsWebViewWidget.routePath,
          builder: (context, params) => CloudpaymentsWebViewWidget(
            tier: params.getParam(
              'tier',
              ParamType.DataStruct,
              isList: false,
              structBuilder: TierStruct.fromSerializableMap,
            ),
            cloudpaymentsKeys: params.getParam(
              'cloudpaymentsKeys',
              ParamType.DataStruct,
              isList: false,
              structBuilder: CloudpaymentsKeysStruct.fromSerializableMap,
            ),
            index: params.getParam(
              'index',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: SubcategoriesPageWidget.routeName,
          path: SubcategoriesPageWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'subcategoryDocs':
                getDocList(['categories'], CategoriesRecord.fromSnapshot),
          },
          builder: (context, params) => SubcategoriesPageWidget(
            title: params.getParam(
              'title',
              ParamType.String,
            ),
            subcategoryDocs: params.getParam<CategoriesRecord>(
              'subcategoryDocs',
              ParamType.Document,
              isList: true,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/splashScreenL';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? isWeb
                  ? Container()
                  : Container(
                      color: Color(0xFFF2F6F7),
                      child: Center(
                        child: Image.asset(
                          'assets/images/96lem_.gif',
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
