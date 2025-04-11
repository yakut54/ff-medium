import '/flutter_flow/flutter_flow_util.dart';
import 'c_e_onboarding_item_widget.dart' show CEOnboardingItemWidget;
import 'package:flutter/material.dart';

class CEOnboardingItemModel extends FlutterFlowModel<CEOnboardingItemWidget> {
  ///  Local state fields for this component.

  String? error = '';

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обязательное поле';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
