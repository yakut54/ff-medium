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

import 'dart:io';

import 'package:syncfusion_flutter_pdf/pdf.dart';

Future<int> lessonsGetPdfPageCount(String filePath) async {
  debugPrint(
      'lessonsGetPdfPageCount: Create a new instance of the PdfDocument class');
  // Create a new instance of the PdfDocument class
  PdfDocument document =
      PdfDocument(inputBytes: await File(filePath).readAsBytes());

  // Get the number of pages in the PDF document
  debugPrint(
      'lessonsGetPdfPageCount: Get the number of pages in the PDF document');
  int pageCount = document.pages.count;
  debugPrint('lessonsGetPdfPageCount: pages: $pageCount');

  // Close the document
  debugPrint('lessonsGetPdfPageCount: Close the document');
  document.dispose();

  // Return the page count
  debugPrint('lessonsGetPdfPageCount: return');
  return pageCount;
}
