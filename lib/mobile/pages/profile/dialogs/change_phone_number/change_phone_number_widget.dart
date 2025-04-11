import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'change_phone_number_model.dart';
export 'change_phone_number_model.dart';

class ChangePhoneNumberWidget extends StatefulWidget {
  const ChangePhoneNumberWidget({super.key});

  @override
  State<ChangePhoneNumberWidget> createState() =>
      _ChangePhoneNumberWidgetState();
}

class _ChangePhoneNumberWidgetState extends State<ChangePhoneNumberWidget> {
  late ChangePhoneNumberModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangePhoneNumberModel());

    _model.textController ??= TextEditingController(
        text: functions.formattingPhoneForChange(currentPhoneNumber));
    _model.textFieldFocusNode ??= FocusNode();

    _model.pinCodeFocusNode ??= FocusNode();

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: Builder(
            builder: (context) {
              if (!_model.next) {
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 16.0, 0.0),
                          child: Container(
                            width: 48.0,
                            height: 4.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).accent2,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 40.0, 16.0, 20.0),
                            child: Text(
                              'Изменить номер',
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
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Container(
                            height: 40.0,
                            decoration: BoxDecoration(),
                            child: Stack(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textController',
                                        Duration(milliseconds: 100),
                                        () async {
                                          safeSetState(() {});
                                        },
                                      ),
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Введите номер телефона',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Vela Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: false,
                                            ),
                                        errorStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Vela Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: false,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                15.0, 0.0, 0.0, 0.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Vela Sans',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                      maxLength: 10,
                                      maxLengthEnforcement:
                                          MaxLengthEnforcement.none,
                                      buildCounter: (context,
                                              {required currentLength,
                                              required isFocused,
                                              maxLength}) =>
                                          null,
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              decimal: true),
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                      inputFormatters: [_model.textFieldMask],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 2.0),
                                    child: Text(
                                      '+7',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Vela Sans',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 1.0,
                            decoration: BoxDecoration(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: FFButtonWidget(
                            onPressed: functions.isTextLessThen(
                                    _model.textController.text, 10)
                                ? null
                                : () async {
                                    var _shouldSetState = false;
                                    if (FFAppState().hasInternetConnection) {
                                      _model.doc = await queryUsersRecordOnce(
                                        queryBuilder: (usersRecord) =>
                                            usersRecord.where(
                                          'phone_number',
                                          isEqualTo: (String phoneNumber) {
                                            return '+7${phoneNumber.replaceAll(' ', '')}';
                                          }(_model.textController.text),
                                        ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      _shouldSetState = true;
                                      if (!(_model.doc != null)) {
                                        FFAppState().updateOtpStruct(
                                          (e) => e
                                            ..code =
                                                functions.smscGenerateCode()
                                            ..createdTime = getCurrentTimestamp
                                            ..phoneNumber =
                                                _model.textController.text,
                                        );
                                        _model.sendMessage = await SmscGroup
                                            .sendMessageCall
                                            .call(
                                          message: functions.smscMessage(
                                              FFAppState().otp.code),
                                          phones: (String phoneNumber) {
                                            return '7${phoneNumber.replaceAll(' ', '')}';
                                          }(_model.textController.text),
                                        );

                                        _shouldSetState = true;
                                        _model.next = true;
                                        safeSetState(() {});
                                        await Future.delayed(
                                            const Duration(milliseconds: 500));
                                        _model.timerController.timer
                                            .setPresetTime(
                                          mSec: functions
                                              .smscGetTimer(FFAppState().otp),
                                          add: false,
                                        );
                                        _model.timerController.onResetTimer();

                                        _model.timerController.onStartTimer();
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      } else {
                                        await actions.showMartaNGSnackBar(
                                          context,
                                          SnackBarType.error,
                                          'Номер уже используется!',
                                          ' ',
                                          3,
                                        );
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                    } else {
                                      await action_blocks
                                          .notConnectedSnackBar(context);
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }

                                    if (_shouldSetState) safeSetState(() {});
                                  },
                            text: 'Продолжить',
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
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 16.0, 20.0),
                          child: Container(
                            width: 48.0,
                            height: 4.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).accent2,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
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
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
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
                                          text: (String phoneNumber) {
                                            return '+7 $phoneNumber';
                                          }(FFAppState().otp.phoneNumber),
                                          style: TextStyle(
                                            color: Color(0xFF2690B8),
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              ' отправлена SMS  с 6-ти значным кодом для смены номера',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
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
                            if (kDebugMode)
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
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Vela Sans',
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                            _model.pinCodeController?.text =
                                                ('');
                                          });
                                          FFAppState().updateOtpStruct(
                                            (e) => e
                                              ..createdTime =
                                                  getCurrentTimestamp
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
                                              _model.pinCodeController?.text =
                                                  ('');
                                            });
                                            FFAppState().updateOtpStruct(
                                              (e) => e
                                                ..createdTime =
                                                    getCurrentTimestamp
                                                ..code = functions
                                                    .smscGenerateCode(),
                                            );
                                            await SmscGroup.sendMessageCall
                                                .call(
                                              message: functions.smscMessage(
                                                  FFAppState().otp.code),
                                              phones: (String phoneNumber) {
                                                return '7${phoneNumber.replaceAll(' ', '')}';
                                              }(FFAppState().otp.phoneNumber),
                                            );

                                            _model.timerController.timer
                                                .setPresetTime(
                                              mSec: functions.smscGetTimer(
                                                  FFAppState().otp),
                                              add: false,
                                            );
                                            _model.timerController
                                                .onResetTimer();

                                            _model.timerController
                                                .onStartTimer();
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
                                                color:
                                                    _model.timerMilliseconds > 0
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
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: FlutterFlowTimer(
                                            initialTime:
                                                _model.timerInitialTimeMs,
                                            getDisplayTime: (value) =>
                                                StopWatchTimer.getDisplayTime(
                                              value,
                                              hours: false,
                                              milliSecond: false,
                                            ),
                                            controller: _model.timerController,
                                            updateStateInterval:
                                                Duration(milliseconds: 1000),
                                            onChanged: (value, displayTime,
                                                shouldUpdate) {
                                              _model.timerMilliseconds = value;
                                              _model.timerValue = displayTime;
                                              if (shouldUpdate)
                                                safeSetState(() {});
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
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: FFButtonWidget(
                                onPressed: functions.isTextLessThen(
                                        _model.textController.text, 6)
                                    ? null
                                    : () async {
                                        if (FFAppState()
                                            .hasInternetConnection) {
                                          _model.incorrectCode = false;
                                          safeSetState(() {});
                                          if (functions.smscCodeChecker(
                                              _model.pinCodeController!.text,
                                              FFAppState().otp)) {
                                            await currentUserReference!
                                                .update(createUsersRecordData(
                                              phoneNumber:
                                                  (String phoneNumber) {
                                                return '+7${phoneNumber.replaceAll(' ', '')}';
                                              }(FFAppState().otp.phoneNumber),
                                              email: '${(String phoneNumber) {
                                                return '+7${phoneNumber.replaceAll(' ', '')}';
                                              }(FFAppState().otp.phoneNumber)}@martang.com',
                                            ));
                                            await Future.delayed(const Duration(
                                                milliseconds: 2000));
                                            GoRouter.of(context)
                                                .prepareAuthEvent();

                                            final user = await authManager
                                                .signInWithEmail(
                                              context,
                                              '${(String phoneNumber) {
                                                return '+7${phoneNumber.replaceAll(' ', '')}';
                                              }(FFAppState().otp.phoneNumber)}@martang.com',
                                              ((String phoneNumber) {
                                                return '+7${phoneNumber.replaceAll(' ', '')}';
                                              }(FFAppState().otp.phoneNumber)),
                                            );
                                            if (user == null) {
                                              return;
                                            }

                                            FFAppState().otp = OtpStruct();
                                            safeSetState(() {});
                                            Navigator.pop(context);
                                            await actions.showMartaNGSnackBar(
                                              context,
                                              SnackBarType.success,
                                              'Изменения сохранены',
                                              ' ',
                                              null,
                                            );
                                            return;
                                          } else {
                                            _model.incorrectCode = true;
                                            safeSetState(() {});
                                            return;
                                          }
                                        } else {
                                          Navigator.pop(context);
                                          await action_blocks
                                              .notConnectedSnackBar(context);
                                          return;
                                        }
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
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
