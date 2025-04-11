import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tiers_screen_widget.dart' show TiersScreenWidget;
import 'package:flutter/material.dart';

class TiersScreenModel extends FlutterFlowModel<TiersScreenWidget> {
  ///  Local state fields for this component.

  int currentIndex = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Bottom Sheet - CEGuestTier] action in IconButton widget.
  TierStruct? guestTier;
  // Stores action output result for [Bottom Sheet - CEPrimaryTier] action in IconButton widget.
  TierStruct? primaryTier;
  // Stores action output result for [Bottom Sheet - CESecondaryTier] action in IconButton widget.
  TierStruct? secondaryTier;
  // Stores action output result for [Bottom Sheet - CECloudPaymentsKeys] action in IconButton widget.
  CloudpaymentsKeysStruct? cpKeys;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
