// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_udid/flutter_udid.dart';

import 'package:package_info_plus/package_info_plus.dart';

Future setDeviceInfo(BuildContext context) async {
  // Add your function code here!
  final deviceHeight = MediaQuery.of(context).size.height;
  final deviceWidth = MediaQuery.of(context).size.width;
  String? udid;
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  if (!isWeb) {
    udid = await FlutterUdid.udid;
  }
  print(udid);
  final appVersion = packageInfo.version;
  final appBuildNumber = packageInfo.buildNumber;
  final appPackageName = packageInfo.packageName;

  FFAppState().update(() {
    if (!isWeb) {
      FFAppState().deviceInfo.udid = udid;
    }
    FFAppState().deviceInfo.height = deviceHeight;
    FFAppState().deviceInfo.width = deviceWidth;
    FFAppState().deviceInfo.appVersion = appVersion;
    FFAppState().deviceInfo.appBuildNumber = appBuildNumber;
    FFAppState().deviceInfo.appPackageName = appPackageName;
  });
}
