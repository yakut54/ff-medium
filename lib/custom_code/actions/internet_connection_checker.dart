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

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

Future internetConnectionChecker() async {
  final internetConnection = InternetConnectionCheckerPlus();
  internetConnection.onStatusChange
      .listen((InternetConnectionStatus status) async {
    switch (status) {
      case InternetConnectionStatus.connected:
        FFAppState().hasInternetConnection = true;
        break;
      case InternetConnectionStatus.disconnected:
        await Future.delayed(const Duration(seconds: 5));
        FFAppState().hasInternetConnection = false;
        break;
    }
  });
}
