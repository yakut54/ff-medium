import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _debugWebToMobile =
          prefs.getBool('ff_debugWebToMobile') ?? _debugWebToMobile;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_otp')) {
        try {
          final serializedData = prefs.getString('ff_otp') ?? '{}';
          _otp = OtpStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _isRelease = true;
  bool get isRelease => _isRelease;
  set isRelease(bool value) {
    _isRelease = value;
  }

  bool _debugWebToMobile = false;
  bool get debugWebToMobile => _debugWebToMobile;
  set debugWebToMobile(bool value) {
    _debugWebToMobile = value;
    prefs.setBool('ff_debugWebToMobile', value);
  }

  DeviceInfoStruct _deviceInfo = DeviceInfoStruct.fromSerializableMap(
      jsonDecode('{\"height\":\"0\",\"width\":\"0\"}'));
  DeviceInfoStruct get deviceInfo => _deviceInfo;
  set deviceInfo(DeviceInfoStruct value) {
    _deviceInfo = value;
  }

  void updateDeviceInfoStruct(Function(DeviceInfoStruct) updateFn) {
    updateFn(_deviceInfo);
  }

  OtpStruct _otp = OtpStruct();
  OtpStruct get otp => _otp;
  set otp(OtpStruct value) {
    _otp = value;
    prefs.setString('ff_otp', value.serialize());
  }

  void updateOtpStruct(Function(OtpStruct) updateFn) {
    updateFn(_otp);
    prefs.setString('ff_otp', _otp.serialize());
  }

  bool _hasInternetConnection = false;
  bool get hasInternetConnection => _hasInternetConnection;
  set hasInternetConnection(bool value) {
    _hasInternetConnection = value;
  }

  bool _hasLastPlay = false;
  bool get hasLastPlay => _hasLastPlay;
  set hasLastPlay(bool value) {
    _hasLastPlay = value;
  }

  bool _isForceDebug = false;
  bool get isForceDebug => _isForceDebug;
  set isForceDebug(bool value) {
    _isForceDebug = value;
  }

  dynamic _subscriptionSnapshot;
  dynamic get subscriptionSnapshot => _subscriptionSnapshot;
  set subscriptionSnapshot(dynamic value) {
    _subscriptionSnapshot = value;
  }

  bool _hasVpnConnection = false;
  bool get hasVpnConnection => _hasVpnConnection;
  set hasVpnConnection(bool value) {
    _hasVpnConnection = value;
  }

  bool _isSnackbarVisible = false;
  bool get isSnackbarVisible => _isSnackbarVisible;
  set isSnackbarVisible(bool value) {
    _isSnackbarVisible = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
