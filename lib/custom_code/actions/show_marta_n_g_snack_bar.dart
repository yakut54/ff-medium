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

import 'package:animated_snack_bar/animated_snack_bar.dart';

/// Показ уведомления (snackbar).
///
/// [type] - тип снекбара
/// [title] - сообщение
/// [durationSec] - продолжительность показа

Future showMartaNGSnackBar(BuildContext context, SnackBarType type,
    String title, String? subtitle, int? durationSec) async {
  Color errorColor = FlutterFlowTheme.of(context).error;
  Color successColor = FlutterFlowTheme.of(context).success;

  AnimatedSnackBar? snackbar;

  void _closeSnackbar() {
    snackbar!.remove();
    FFAppState().isSnackbarVisible = false;
  }

  snackbar = AnimatedSnackBar(
    duration: Duration(seconds: durationSec ?? 3),
    builder: ((context) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            color: type == SnackBarType.error ? errorColor : successColor,
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                    type == SnackBarType.error
                        ? FFIcons.kalert
                        : FFIcons.kcheckcircle,
                    color: Colors.white),
                SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Vela Sans',
                                color: Colors.white,
                                fontSize: !(subtitle != null && subtitle != ' ')
                                    ? 12.0
                                    : 14.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: false,
                              ),
                    ),
                    if (subtitle != null && subtitle != ' ')
                      Text(
                        subtitle,
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Vela Sans',
                              color: Colors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: false,
                            ),
                      ),
                  ],
                ),
              ],
            ),
            IconButton(
                icon: Icon(
                  Icons.close,
                  size: 16,
                  color: Colors.white,
                ),
                onPressed: () => _closeSnackbar())
          ],
        ),
      );
    }),
  );
  if (!FFAppState().isSnackbarVisible) {
    snackbar.show(context);
    FFAppState().isSnackbarVisible = true;
    await Future.delayed(Duration(seconds: durationSec ?? 3));
    FFAppState().isSnackbarVisible = false;
  }
}
