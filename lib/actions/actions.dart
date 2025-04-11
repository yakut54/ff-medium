import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';

Future pageFor(
  BuildContext context, {
  required Role? role,
}) async {
  if (role == Role.user) {
    context.goNamed(WebAccessDeniedWidget.routeName);

    return;
  } else {
    return;
  }
}

Future<bool?> isNewUser(BuildContext context) async {
  if ((currentUserDisplayName == '') ||
      !((currentUserDocument?.onboardingList.toList() ?? []).isNotEmpty)) {
    context.goNamed(RegistrationPageWidget.routeName);

    return true;
  } else {
    return false;
  }
}

Future login(
  BuildContext context, {
  String? phoneNumber,
}) async {}

Future notConnectedSnackBar(BuildContext context) async {
  await actions.showMartaNGSnackBar(
    context,
    SnackBarType.error,
    'Произошла ошибка загрузки',
    'Проверьте интернет-соединение',
    3,
  );
}

Future subscriptionCheck(BuildContext context) async {
  SubscriptionsRecord? sbscrptn;
  AppRecord? app;

  sbscrptn = await SubscriptionsRecord.getDocumentOnce(
      functions.userGetSubscroptionRef());
  if ((sbscrptn.subscriptionEndTime! < getCurrentTimestamp) &&
      (FFAppState().deviceInfo.countryCode == 'RU')) {
    if ((sbscrptn.status != Tier.none) ||
        (sbscrptn.subscriptionIndex != null) ||
        (sbscrptn.subscriptionId == '')) {
      await functions.userGetSubscroptionRef().update({
        ...createSubscriptionsRecordData(
          status: Tier.none,
          subscriptionId: '',
        ),
        ...mapToFirestore(
          {
            'subscription_index': FieldValue.delete(),
          },
        ),
      });
    }
    app = await AppRecord.getDocumentOnce(functions.appRecordGetReference());

    context.pushNamed(
      SubscriptionsPageWidget.routeName,
      queryParameters: {
        'appRecord': serializeParam(
          app,
          ParamType.Document,
        ),
        'showCloseIcon': serializeParam(
          false,
          ParamType.bool,
        ),
        'showPopUp': serializeParam(
          true,
          ParamType.bool,
        ),
      }.withoutNulls,
      extra: <String, dynamic>{
        'appRecord': app,
      },
    );
  }
}
