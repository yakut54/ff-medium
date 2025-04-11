import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'cloudpayments_web_view_model.dart';
export 'cloudpayments_web_view_model.dart';

class CloudpaymentsWebViewWidget extends StatefulWidget {
  const CloudpaymentsWebViewWidget({
    super.key,
    required this.tier,
    required this.cloudpaymentsKeys,
    required this.index,
  });

  final TierStruct? tier;
  final CloudpaymentsKeysStruct? cloudpaymentsKeys;
  final int? index;

  static String routeName = 'cloudpaymentsWebView';
  static String routePath = '/cloudpaymentsWebView';

  @override
  State<CloudpaymentsWebViewWidget> createState() =>
      _CloudpaymentsWebViewWidgetState();
}

class _CloudpaymentsWebViewWidgetState
    extends State<CloudpaymentsWebViewWidget> {
  late CloudpaymentsWebViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CloudpaymentsWebViewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF040A26),
        body: custom_widgets.CloudpaymentsInAppWebView(
          width: double.infinity,
          height: double.infinity,
          tier: widget.tier!,
          cloudpaymentsKeys: widget.cloudpaymentsKeys!,
          index: widget.index!,
        ),
      ),
    );
  }
}
