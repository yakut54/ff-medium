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

import 'package:http/http.dart' as http;

Future<bool> linkIsAvalible(String link) async {
  // Add your function code here!
  final url = Uri.parse('https://proxy-vicbgmagaa-lm.a.run.app/?url=$link');
  final response = await http.get(url).timeout(
        Duration(seconds: 5),
      );
  debugPrint('linkIsAvalible: ${response.statusCode}');
  return response.statusCode == 200;
}
