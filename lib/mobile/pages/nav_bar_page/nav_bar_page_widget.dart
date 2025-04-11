import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'nav_bar_page_model.dart';
export 'nav_bar_page_model.dart';

class NavBarPageWidget extends StatefulWidget {
  const NavBarPageWidget({super.key});

  static String routeName = 'NavBarPage';
  static String routePath = '/navBarPage';

  @override
  State<NavBarPageWidget> createState() => _NavBarPageWidgetState();
}

class _NavBarPageWidgetState extends State<NavBarPageWidget> {
  late NavBarPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarPageModel());

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: custom_widgets.MartaNGNavBar(
            width: 0.0,
            height: 0.0,
          ),
        ),
      ),
    );
  }
}
