import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'splash_screen_l_model.dart';
export 'splash_screen_l_model.dart';

class SplashScreenLWidget extends StatefulWidget {
  const SplashScreenLWidget({super.key});

  static String routeName = 'SplashScreenL';
  static String routePath = '/splashScreenL';

  @override
  State<SplashScreenLWidget> createState() => _SplashScreenLWidgetState();
}

class _SplashScreenLWidgetState extends State<SplashScreenLWidget> {
  late SplashScreenLModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashScreenLModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.setDeviceInfo(
        context,
      );
      await actions.lockOrientation(
        true,
      );
      await Future.delayed(const Duration(milliseconds: 1000));
      if (isWeb && !FFAppState().debugWebToMobile) {
        context.goNamed(
          WebLoginPageWidget.routeName,
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
            ),
          },
        );

        return;
      } else {
        if (FFAppState().hasInternetConnection) {
          _model.docCount = await queryUsersRecordCount(
            queryBuilder: (usersRecord) => usersRecord.where(
              'udid',
              isEqualTo: FFAppState().deviceInfo.udid,
            ),
          );

          context.goNamed(
            LoginPageWidget.routeName,
            queryParameters: {
              'showAnonLogin': serializeParam(
                _model.docCount! < 1,
                ParamType.bool,
              ),
            }.withoutNulls,
            extra: <String, dynamic>{
              kTransitionInfoKey: TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
              ),
            },
          );
        } else {
          context.goNamed(
            LoginPageWidget.routeName,
            queryParameters: {
              'showAnonLogin': serializeParam(
                false,
                ParamType.bool,
              ),
            }.withoutNulls,
            extra: <String, dynamic>{
              kTransitionInfoKey: TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
              ),
            },
          );
        }

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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 2.0,
                  sigmaY: 2.0,
                ),
                child: Opacity(
                  opacity: 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/image_0_blured.jpg',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: SvgPicture.asset(
                            'assets/images/logo.svg',
                            width: double.infinity,
                            height: 32.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/8481468b9f561c6d24873cb453d130b4.png',
                            width: double.infinity,
                            height: 69.0,
                            fit: BoxFit.contain,
                          ),
                        ),
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
