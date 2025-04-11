import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'onboarding_page_widget.dart' show OnboardingPageWidget;
import 'package:flutter/material.dart';

class OnboardingPageModel extends FlutterFlowModel<OnboardingPageWidget> {
  ///  Local state fields for this page.

  bool? dummy;

  List<DocumentReference> onboardingList = [];
  void addToOnboardingList(DocumentReference item) => onboardingList.add(item);
  void removeFromOnboardingList(DocumentReference item) =>
      onboardingList.remove(item);
  void removeAtIndexFromOnboardingList(int index) =>
      onboardingList.removeAt(index);
  void insertAtIndexInOnboardingList(int index, DocumentReference item) =>
      onboardingList.insert(index, item);
  void updateOnboardingListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      onboardingList[index] = updateFn(onboardingList[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for Checkbox widget.
  Map<OnboardingsRecord, bool> checkboxValueMap = {};
  List<OnboardingsRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
