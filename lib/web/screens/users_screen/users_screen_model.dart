import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'users_screen_widget.dart' show UsersScreenWidget;
import 'package:flutter/material.dart';

class UsersScreenModel extends FlutterFlowModel<UsersScreenWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for CheckboxListTile widget.
  Map<UsersRecord, bool> checkboxListTileValueMap = {};
  List<UsersRecord> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
