import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'phone_verify_page_model.dart';
export 'phone_verify_page_model.dart';

class PhoneVerifyPageWidget extends StatefulWidget {
  const PhoneVerifyPageWidget({
    super.key,
    required this.phoneNumber,
    int? timer,
  }) : this.timer = timer ?? 120999;

  final String? phoneNumber;
  final int timer;

  static String routeName = 'PhoneVerifyPage';
  static String routePath = '/phoneVerifyPage';

  @override
  State<PhoneVerifyPageWidget> createState() => _PhoneVerifyPageWidgetState();
}

class _PhoneVerifyPageWidgetState extends State<PhoneVerifyPageWidget> {
  late PhoneVerifyPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhoneVerifyPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStopTimer();
      _model.timerController.timer.setPresetTime(
        mSec: functions.smscGetTimer(FFAppState().otp),
        add: false,
      );
      _model.timerController.onResetTimer();

      _model.timerController.onStartTimer();
      _model.doc = await queryUsersRecordOnce(
        queryBuilder: (usersRecord) => usersRecord.where(
          'phone_number',
          isEqualTo: (String phoneNumber) {
            return '${phoneNumber.replaceAll(' ', '')}';
          }(widget.phoneNumber!),
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.docExists = _model.doc != null;
      safeSetState(() {});
    });

    _model.pinCodeFocusNode ??= FocusNode();

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
        backgroundColor: (isWeb ? !FFAppState().debugWebToMobile : false)
            ? FlutterFlowTheme.of(context).tertiary
            : FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: true,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 20.0,
            borderWidth: 0.0,
            buttonSize: 40.0,
            fillColor: Colors.transparent,
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
              size: 24.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            background: Visibility(
              visible: isWeb ? !FFAppState().debugWebToMobile : false,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.asset(
                      'assets/images/image_0_blured.jpg',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      alignment: Alignment(0.0, -1.0),
                    ),
                  ),
                  ClipRect(
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(
                        sigmaX: 2.0,
                        sigmaY: 2.0,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.network(
                          'https://picsum.photos/id/115/600',
                          fit: BoxFit.cover,
                          alignment: Alignment(0.0, -1.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            if (isWeb ? !FFAppState().debugWebToMobile : false)
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.asset(
                      'assets/images/image_0_blured.jpg',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      alignment: Alignment(0.0, -1.0),
                    ),
                  ),
                  ClipRect(
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(
                        sigmaX: 20.0,
                        sigmaY: 20.0,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.asset(
                          'assets/images/8cfe44de2feeb09753fd22ae6e2dd050.png',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          alignment: Alignment(0.0, -1.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: 400.0,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (isWeb ? !FFAppState().debugWebToMobile : false)
                      Expanded(
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 40.0, 16.0, 16.0),
                          child: Text(
                            'Введите код подтверждения',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Vela Sans',
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'На номер ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Vela Sans',
                                        color: Colors.black,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: false,
                                      ),
                                ),
                                TextSpan(
                                  text: valueOrDefault<String>(
                                    widget.phoneNumber,
                                    '_',
                                  ),
                                  style: TextStyle(
                                    color: Color(0xFF2690B8),
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      ' отправлена SMS  с 6-ти значным кодом для входа',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: !isWeb ? ' или регистрации' : ' ',
                                  style: TextStyle(),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Vela Sans',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (kDebugMode || false)
                          Text(
                            FFAppState().otp.code,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Vela Sans',
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: PinCodeTextField(
                            autoDisposeControllers: false,
                            appContext: context,
                            length: 6,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Vela Sans',
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            enableActiveFill: false,
                            autoFocus: true,
                            focusNode: _model.pinCodeFocusNode,
                            enablePinAutofill: false,
                            errorTextSpace: 16.0,
                            showCursor: true,
                            cursorColor: Colors.black,
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            pinTheme: PinTheme(
                              fieldHeight: 44.0,
                              fieldWidth: 44.0,
                              borderWidth: 2.0,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12.0),
                                bottomRight: Radius.circular(12.0),
                                topLeft: Radius.circular(12.0),
                                topRight: Radius.circular(12.0),
                              ),
                              shape: PinCodeFieldShape.box,
                              activeColor: _model.incorrectCode
                                  ? FlutterFlowTheme.of(context).error
                                  : FlutterFlowTheme.of(context).primary,
                              inactiveColor: _model.incorrectCode
                                  ? FlutterFlowTheme.of(context).error
                                  : FlutterFlowTheme.of(context).primary,
                              selectedColor: _model.incorrectCode
                                  ? FlutterFlowTheme.of(context).error
                                  : FlutterFlowTheme.of(context).primary,
                            ),
                            controller: _model.pinCodeController,
                            onChanged: (_) async {
                              _model.incorrectCode = false;
                              safeSetState(() {});
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: _model.pinCodeControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (_model.timerMilliseconds == 0) {
                                      safeSetState(() {
                                        _model.pinCodeController?.text = ('');
                                      });
                                      FFAppState().updateOtpStruct(
                                        (e) => e
                                          ..createdTime = getCurrentTimestamp
                                          ..code = functions.smscGenerateCode(),
                                      );
                                      await SmscGroup.sendMessageCall.call(
                                        message: functions
                                            .smscMessage(FFAppState().otp.code),
                                        phones: (String phoneNumber) {
                                          return '7${phoneNumber.replaceAll(' ', '')}';
                                        }(FFAppState().otp.phoneNumber),
                                      );

                                      _model.timerController.timer
                                          .setPresetTime(
                                              mSec: 120999, add: false);
                                      _model.timerController.onResetTimer();

                                      _model.timerController.onStartTimer();
                                      return;
                                    } else {
                                      return;
                                    }
                                  },
                                  child: Text(
                                    'Неверный код подтверждения',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Vela Sans',
                                          color: _model.incorrectCode
                                              ? FlutterFlowTheme.of(context)
                                                  .error
                                              : Colors.transparent,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (_model.timerMilliseconds == 0) {
                                        safeSetState(() {
                                          _model.pinCodeController?.text = ('');
                                        });
                                        FFAppState().updateOtpStruct(
                                          (e) => e
                                            ..createdTime = getCurrentTimestamp
                                            ..code =
                                                functions.smscGenerateCode(),
                                        );
                                        await SmscGroup.sendMessageCall.call(
                                          message: functions.smscMessage(
                                              FFAppState().otp.code),
                                          phones: (String phoneNumber) {
                                            return '7${phoneNumber.replaceAll(' ', '')}';
                                          }(FFAppState().otp.phoneNumber),
                                        );

                                        _model.timerController.timer
                                            .setPresetTime(
                                          mSec: functions
                                              .smscGetTimer(FFAppState().otp),
                                          add: false,
                                        );
                                        _model.timerController.onResetTimer();

                                        _model.timerController.onStartTimer();
                                        return;
                                      } else {
                                        return;
                                      }
                                    },
                                    child: Text(
                                      _model.timerMilliseconds > 1000
                                          ? 'Отправить код повторно через'
                                          : 'Отправить код повторно',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Vela Sans',
                                            color: _model.timerMilliseconds > 0
                                                ? Color(0xFF919191)
                                                : Colors.black,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                  if (_model.timerMilliseconds > 1000)
                                    Container(
                                      width: 50.0,
                                      decoration: BoxDecoration(),
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: FlutterFlowTimer(
                                        initialTime: _model.timerInitialTimeMs,
                                        getDisplayTime: (value) =>
                                            StopWatchTimer.getDisplayTime(
                                          value,
                                          hours: false,
                                          milliSecond: false,
                                        ),
                                        controller: _model.timerController,
                                        updateStateInterval:
                                            Duration(milliseconds: 1000),
                                        onChanged:
                                            (value, displayTime, shouldUpdate) {
                                          _model.timerMilliseconds = value;
                                          _model.timerValue = displayTime;
                                          if (shouldUpdate) safeSetState(() {});
                                        },
                                        onEnded: () async {
                                          safeSetState(() {});
                                        },
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Vela Sans',
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                            ),
                          ].divide(SizedBox(height: 10.0)),
                        ),
                      ],
                    ),
                    Builder(
                      builder: (context) {
                        if (_model.docExists) {
                          return Padding(
                            padding: EdgeInsets.all(16.0),
                            child: FFButtonWidget(
                              onPressed: functions.isTextLessThen(
                                      _model.pinCodeController!.text, 6)
                                  ? null
                                  : () async {
                                      var _shouldSetState = false;
                                      _model.incorrectCode = false;
                                      safeSetState(() {});
                                      if (functions.smscCodeChecker(
                                              _model.pinCodeController!.text,
                                              FFAppState().otp) ||
                                          (_model.doc?.role ==
                                              Role.developer)) {
                                        GoRouter.of(context).prepareAuthEvent();

                                        final user =
                                            await authManager.signInWithEmail(
                                          context,
                                          ((String phoneNumber) {
                                            return '${phoneNumber.replaceAll(' ', '')}@martang.com';
                                          }(widget.phoneNumber!)),
                                          ((String phoneNumber) {
                                            return '${phoneNumber.replaceAll(' ', '')}';
                                          }(widget.phoneNumber!)),
                                        );
                                        if (user == null) {
                                          return;
                                        }

                                        FFAppState().otp = OtpStruct();
                                        safeSetState(() {});
                                        if (isWeb &&
                                            !FFAppState().debugWebToMobile) {
                                          context.goNamedAuth(
                                              WebHomePageWidget.routeName,
                                              context.mounted);
                                        } else {
                                          await currentUserReference!
                                              .update(createUsersRecordData(
                                            udid: FFAppState().deviceInfo.udid,
                                          ));
                                          if (currentUserDisplayName == '') {
                                            _model.updateSubscriptionEndTime =
                                                await actions
                                                    .calculateSubscriptionEndTime();
                                            _shouldSetState = true;

                                            await functions
                                                .userGetSubscroptionRef()
                                                .update(
                                                    createSubscriptionsRecordData(
                                                  status: Tier.guest,
                                                  createdTime:
                                                      getCurrentTimestamp,
                                                  subscriptionEndTime: _model
                                                      .updateSubscriptionEndTime,
                                                ));
                                          }

                                          context.goNamedAuth(
                                              NavBarPageWidget.routeName,
                                              context.mounted);
                                        }

                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      } else {
                                        _model.incorrectCode = true;
                                        safeSetState(() {});
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }

                                      if (_shouldSetState) safeSetState(() {});
                                    },
                              text: 'Подтвердить',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFF1C1C1C),
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
                                borderRadius: BorderRadius.circular(14.0),
                                disabledTextColor: Color(0xFF919191),
                              ),
                            ),
                          );
                        } else {
                          return Padding(
                            padding: EdgeInsets.all(16.0),
                            child: FFButtonWidget(
                              onPressed: functions.isTextLessThen(
                                      _model.pinCodeController!.text, 6)
                                  ? null
                                  : () async {
                                      var _shouldSetState = false;
                                      if (FFAppState().hasInternetConnection) {
                                        _model.incorrectCode = false;
                                        safeSetState(() {});
                                        if (functions.smscCodeChecker(
                                            _model.pinCodeController!.text,
                                            FFAppState().otp)) {
                                          GoRouter.of(context)
                                              .prepareAuthEvent();
                                          if (((String phoneNumber) {
                                                return '${phoneNumber.replaceAll(' ', '')}';
                                              }(widget.phoneNumber!)) !=
                                              ((String phoneNumber) {
                                                return '${phoneNumber.replaceAll(' ', '')}';
                                              }(widget.phoneNumber!))) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Passwords don\'t match!',
                                                ),
                                              ),
                                            );
                                            return;
                                          }

                                          final user = await authManager
                                              .createAccountWithEmail(
                                            context,
                                            ((String phoneNumber) {
                                              return '${phoneNumber.replaceAll(' ', '')}@martang.com';
                                            }(widget.phoneNumber!)),
                                            ((String phoneNumber) {
                                              return '${phoneNumber.replaceAll(' ', '')}';
                                            }(widget.phoneNumber!)),
                                          );
                                          if (user == null) {
                                            return;
                                          }

                                          await UsersRecord.collection
                                              .doc(user.uid)
                                              .update(createUsersRecordData(
                                                phoneNumber:
                                                    (String phoneNumber) {
                                                  return '${phoneNumber.replaceAll(' ', '')}';
                                                }(widget.phoneNumber!),
                                                isDeleted: false,
                                                role: Role.user,
                                                isAuthorized: true,
                                                udid: FFAppState()
                                                    .deviceInfo
                                                    .udid,
                                              ));

                                          _model.createSubscriptionEndTime =
                                              await actions
                                                  .calculateSubscriptionEndTime();
                                          _shouldSetState = true;

                                          await SubscriptionsRecord.collection
                                              .doc(currentUserReference!.id)
                                              .set(
                                                  createSubscriptionsRecordData(
                                                createdTime: currentUserDocument
                                                    ?.createdTime,
                                                subscriptionEndTime: _model
                                                    .createSubscriptionEndTime,
                                                status: Tier.guest,
                                              ));
                                          FFAppState().otp = OtpStruct();
                                          safeSetState(() {});
                                          if (isWeb &&
                                              !FFAppState().debugWebToMobile) {
                                            context.goNamedAuth(
                                                WebHomePageWidget.routeName,
                                                context.mounted);
                                          } else {
                                            context.goNamedAuth(
                                                NavBarPageWidget.routeName,
                                                context.mounted);
                                          }

                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        } else {
                                          _model.incorrectCode = true;
                                          safeSetState(() {});
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                      } else {
                                        await action_blocks
                                            .notConnectedSnackBar(context);
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }

                                      if (_shouldSetState) safeSetState(() {});
                                    },
                              text: 'Подтвердить',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFF1C1C1C),
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
                                borderRadius: BorderRadius.circular(14.0),
                                disabledTextColor: Color(0xFF919191),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    if (isWeb ? !FFAppState().debugWebToMobile : false)
                      Expanded(
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                  ].divide(SizedBox(height: 20.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
