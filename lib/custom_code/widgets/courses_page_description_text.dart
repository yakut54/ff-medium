// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class CoursesPageDescriptionText extends StatefulWidget {
  const CoursesPageDescriptionText({
    super.key,
    this.width,
    this.height,
    required this.description,
  });

  final double? width;
  final double? height;
  final String description;

  @override
  State<CoursesPageDescriptionText> createState() =>
      _CoursesPageDescriptionTextState();
}

class _CoursesPageDescriptionTextState
    extends State<CoursesPageDescriptionText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.description,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Vela Sans',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            useGoogleFonts: false,
          ),
    );
  }
}
