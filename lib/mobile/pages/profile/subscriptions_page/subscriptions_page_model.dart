import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'subscriptions_page_widget.dart' show SubscriptionsPageWidget;
import 'package:flutter/material.dart';

class SubscriptionsPageModel extends FlutterFlowModel<SubscriptionsPageWidget> {
  ///  Local state fields for this page.

  int currentIndex = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  SubscriptionsRecord? subDocCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
