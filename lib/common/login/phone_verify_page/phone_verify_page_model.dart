import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'phone_verify_page_widget.dart' show PhoneVerifyPageWidget;
import 'package:flutter/material.dart';

class PhoneVerifyPageModel extends FlutterFlowModel<PhoneVerifyPageWidget> {
  ///  Local state fields for this page.

  bool? dummy;

  bool incorrectCode = false;

  bool docExists = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in PhoneVerifyPage widget.
  UsersRecord? doc;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 10000;
  int timerMilliseconds = 10000;
  String timerValue = StopWatchTimer.getDisplayTime(
    10000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Stores action output result for [Custom Action - calculateSubscriptionEndTime] action in Button widget.
  DateTime? updateSubscriptionEndTime;
  // Stores action output result for [Custom Action - calculateSubscriptionEndTime] action in Button widget.
  DateTime? createSubscriptionEndTime;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();

    timerController.dispose();
  }
}
