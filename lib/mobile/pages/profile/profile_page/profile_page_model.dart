import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/pages/profile/widgets/profile_item_component/profile_item_component_widget.dart';
import '/mobile/pages/profile/widgets/tier_status_component/tier_status_component_widget.dart';
import '/index.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:flutter/material.dart';

class ProfilePageModel extends FlutterFlowModel<ProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TierStatusComponent component.
  late TierStatusComponentModel tierStatusComponentModel;
  // Stores action output result for [Backend Call - Read Document] action in TierStatusComponent widget.
  AppRecord? appRecord;
  // Model for ProfileItemComponent component.
  late ProfileItemComponentModel profileItemComponentModel1;
  // Model for ProfileItemComponent component.
  late ProfileItemComponentModel profileItemComponentModel2;
  // Model for ProfileItemComponent component.
  late ProfileItemComponentModel profileItemComponentModel3;
  // Model for ProfileItemComponent component.
  late ProfileItemComponentModel profileItemComponentModel4;
  // Model for ProfileItemComponent component.
  late ProfileItemComponentModel profileItemComponentModel5;
  // Model for ProfileItemComponent component.
  late ProfileItemComponentModel profileItemComponentModel6;
  // Model for ProfileItemComponent component.
  late ProfileItemComponentModel profileItemComponentModel7;

  @override
  void initState(BuildContext context) {
    tierStatusComponentModel =
        createModel(context, () => TierStatusComponentModel());
    profileItemComponentModel1 =
        createModel(context, () => ProfileItemComponentModel());
    profileItemComponentModel2 =
        createModel(context, () => ProfileItemComponentModel());
    profileItemComponentModel3 =
        createModel(context, () => ProfileItemComponentModel());
    profileItemComponentModel4 =
        createModel(context, () => ProfileItemComponentModel());
    profileItemComponentModel5 =
        createModel(context, () => ProfileItemComponentModel());
    profileItemComponentModel6 =
        createModel(context, () => ProfileItemComponentModel());
    profileItemComponentModel7 =
        createModel(context, () => ProfileItemComponentModel());
  }

  @override
  void dispose() {
    tierStatusComponentModel.dispose();
    profileItemComponentModel1.dispose();
    profileItemComponentModel2.dispose();
    profileItemComponentModel3.dispose();
    profileItemComponentModel4.dispose();
    profileItemComponentModel5.dispose();
    profileItemComponentModel6.dispose();
    profileItemComponentModel7.dispose();
  }
}
