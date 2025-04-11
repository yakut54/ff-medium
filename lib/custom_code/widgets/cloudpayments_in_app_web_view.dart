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

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:medium/auth/firebase_auth/auth_util.dart';
import 'package:url_launcher/url_launcher.dart';

import '/flutter_flow/custom_functions.dart'
    as functions; // Imports custom functions

class CloudpaymentsInAppWebView extends StatefulWidget {
  const CloudpaymentsInAppWebView({
    super.key,
    this.width,
    this.height,
    required this.tier,
    required this.cloudpaymentsKeys,
    required this.index,
  });

  final double? width;
  final double? height;
  final TierStruct tier;
  final CloudpaymentsKeysStruct cloudpaymentsKeys;
  final int index;

  @override
  State<CloudpaymentsInAppWebView> createState() =>
      _CloudpaymentsInAppWebViewState();
}

class _CloudpaymentsInAppWebViewState extends State<CloudpaymentsInAppWebView> {
  late String html;
  InAppWebViewController? controller;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
    supportZoom: false,
    mediaPlaybackRequiresUserGesture: false,
    useShouldOverrideUrlLoading: true,
  ));

  @override
  void initState() {
    super.initState();
    html = _html(
      publicId: widget.cloudpaymentsKeys.publicId,
      description: widget.tier.name,
      amount: widget.tier.price,
      accountId: currentUserUid,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Container(
        color: const Color(0x00040a26),
        width: double.infinity,
        height: double.infinity,
        child: InAppWebView(
            shouldOverrideUrlLoading: (controller, navigationAction) async {
              var uri = navigationAction.request.url!;

              if (![
                "http",
                "https",
                "file",
                "chrome",
                "data",
                "javascript",
                "about"
              ].contains(uri.scheme)) {
                if (await canLaunchUrl(uri)) {
                  await launchUrl(
                    uri,
                  );
                  return NavigationActionPolicy.CANCEL;
                }
              }

              return NavigationActionPolicy.ALLOW;
            },
            initialOptions: options,
            initialData: InAppWebViewInitialData(
              data: html,
            ),
            onConsoleMessage: (controller, consoleMessage) {
              final msg = consoleMessage.message;
              if (msg == 'result {"type":"cancel"}') {
                context.pop();
              }
              if (msg.endsWith(',"status":"success"}')) {
                context.goNamed('NavBarPage');
              }
            }),
      ),
    );
  }
}

String _html({
  required String publicId,
  required String description,
  required int amount,
  String? invoiceId,
  required String accountId,
}) =>
    '''
<!DOCTYPE html>
<html>
  <body>
    <script>
      let script = document.createElement('script');
      script.src = 'https://widget.cloudpayments.ru/bundles/cloudpayments.js';
      document.body.appendChild(script);

      script.onload = function () {
        let payments = new cp.CloudPayments({
            language: "ru-RU",
            email: "",
            applePaySupport: false,
            googlePaySupport: false,
            yandexPaySupport: true,
            tinkoffPaySupport: true,
            tinkoffInstallmentSupport: true,
            sbpSupport: true,
        });
        payments.pay("charge", {
            publicId: "$publicId",
            description: "$description",
            amount: $amount,
            currency: "RUB",
            
            accountId: "$accountId",
            email: "",
            skin: "modern",
            requireEmail: false,
        }).then(function(widgetResult) {
            console.log('result', JSON.stringify(widgetResult));
        }).catch(function(error) {
            console.log('error', JSON.stringify(error));
        });}
    </script>
  </body>
</html>
''';
//${invoiceId != null ? 'invoiceId: "$invoiceId"' : ''}
