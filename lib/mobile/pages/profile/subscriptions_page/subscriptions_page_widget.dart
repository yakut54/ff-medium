import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/mobile/pages/profile/dialogs/sigh_out_dialog/sigh_out_dialog_widget.dart';
import '/mobile/pages/profile/dialogs/subscription_end_dialog/subscription_end_dialog_widget.dart';
import '/mobile/pages/profile/tier_button/tier_button_widget.dart';
import '/mobile/pages/profile/tier_button_component/tier_button_component_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'subscriptions_page_model.dart';
export 'subscriptions_page_model.dart';

class SubscriptionsPageWidget extends StatefulWidget {
  const SubscriptionsPageWidget({
    super.key,
    required this.appRecord,
    required this.showCloseIcon,
    required this.showPopUp,
  });

  final AppRecord? appRecord;
  final bool? showCloseIcon;
  final bool? showPopUp;

  static String routeName = 'SubscriptionsPage';
  static String routePath = '/subscriptionsPage';

  @override
  State<SubscriptionsPageWidget> createState() =>
      _SubscriptionsPageWidgetState();
}

class _SubscriptionsPageWidgetState extends State<SubscriptionsPageWidget> {
  late SubscriptionsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubscriptionsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.showPopUp!) {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder: (context) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: SubscriptionEndDialogWidget(),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));

        return;
      } else {
        return;
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, _) => [
              SliverAppBar(
                pinned: false,
                floating: false,
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: true,
                leading: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondary,
                  ),
                ),
                title: Container(
                  constraints: BoxConstraints(
                    maxHeight: 16.0,
                  ),
                  decoration: BoxDecoration(),
                  child: Image.asset(
                    'assets/images/fddee633b0e3978550f9af717cabba0d.png',
                    fit: BoxFit.cover,
                  ),
                ),
                actions: [
                  Builder(
                    builder: (context) {
                      if (widget.showCloseIcon ?? false) {
                        return FlutterFlowIconButton(
                          borderRadius: 100.0,
                          borderWidth: 0.0,
                          buttonSize: 60.0,
                          fillColor: FlutterFlowTheme.of(context).accent1,
                          icon: Icon(
                            Icons.close_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            context.safePop();
                          },
                        );
                      } else {
                        return FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 100.0,
                          borderWidth: 0.0,
                          buttonSize: 60.0,
                          fillColor: FlutterFlowTheme.of(context).accent1,
                          icon: Icon(
                            Icons.logout_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: SighOutDialogWidget(),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                        );
                      }
                    },
                  ),
                ],
                centerTitle: true,
                elevation: 0.0,
              )
            ],
            body: Builder(
              builder: (context) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          'Регулярно пополняемая платформа\nисключительно для женщин:',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Vela Sans',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.play_arrow,
                                            color: Color(0xFFD9D9D9),
                                            size: 12.0,
                                          ),
                                          Text(
                                            'Здоровье',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Vela Sans',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.play_arrow,
                                            color: Color(0xFFD9D9D9),
                                            size: 12.0,
                                          ),
                                          Text(
                                            'Сон',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Vela Sans',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.play_arrow,
                                            color: Color(0xFFD9D9D9),
                                            size: 12.0,
                                          ),
                                          Text(
                                            'Вес',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Vela Sans',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.play_arrow,
                                            color: Color(0xFFD9D9D9),
                                            size: 12.0,
                                          ),
                                          Text(
                                            'Красота',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Vela Sans',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.play_arrow,
                                            color: Color(0xFFD9D9D9),
                                            size: 12.0,
                                          ),
                                          Text(
                                            'Отношения',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Vela Sans',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.play_arrow,
                                            color: Color(0xFFD9D9D9),
                                            size: 12.0,
                                          ),
                                          Text(
                                            'Эмоциональное состояние',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Vela Sans',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.play_arrow,
                                            color: Color(0xFFD9D9D9),
                                            size: 12.0,
                                          ),
                                          Text(
                                            'Самореализация',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Vela Sans',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.play_arrow,
                                            color: Color(0xFFD9D9D9),
                                            size: 12.0,
                                          ),
                                          Text(
                                            'Деньги',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Vela Sans',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.play_arrow,
                                            color: Color(0xFFD9D9D9),
                                            size: 12.0,
                                          ),
                                          Text(
                                            'SOS-программы',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Vela Sans',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.play_arrow,
                                            color: Color(0xFFD9D9D9),
                                            size: 12.0,
                                          ),
                                          Text(
                                            'Женские медитации',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Vela Sans',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.play_arrow,
                                            color: Color(0xFFD9D9D9),
                                            size: 12.0,
                                          ),
                                          Text(
                                            'Подкасты',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Vela Sans',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                    ].divide(SizedBox(height: 5.0)),
                                  ),
                                ),
                              ),
                              Text(
                                'Выберите тариф',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'PF Regal Stencil Pro',
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ].divide(SizedBox(height: 32.0)),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 32.0, 0.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final listInRow =
                                    widget.appRecord?.tiers.toList() ?? [];

                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(listInRow.length,
                                      (listInRowIndex) {
                                    final listInRowItem =
                                        listInRow[listInRowIndex];
                                    return Visibility(
                                      visible: listInRowItem.isPrimary,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 5.0, 0.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.currentIndex =
                                                  listInRowIndex;
                                              safeSetState(() {});
                                            },
                                            child: TierButtonComponentWidget(
                                              key: Key(
                                                  'Keys0s_${listInRowIndex}_of_${listInRow.length}'),
                                              buttonType: () {
                                                if (!valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.isAuthorized,
                                                        false) ||
                                                    (functions
                                                                .subscriptionFromJson(
                                                                    FFAppState()
                                                                        .subscriptionSnapshot)
                                                                ?.subscriptionId !=
                                                            null &&
                                                        functions
                                                                .subscriptionFromJson(
                                                                    FFAppState()
                                                                        .subscriptionSnapshot)
                                                                ?.subscriptionId !=
                                                            '')) {
                                                  return TierButtonType
                                                      .disabled;
                                                } else if (listInRowIndex ==
                                                    _model.currentIndex) {
                                                  return TierButtonType.select;
                                                } else {
                                                  return TierButtonType
                                                      .unselect;
                                                }
                                              }(),
                                              tier: listInRowItem,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).addToStart(SizedBox(width: 7.0)),
                                );
                              },
                            ),
                          ),
                          if (functions
                                  .subscriptionFromJson(
                                      FFAppState().subscriptionSnapshot)
                                  ?.status ==
                              Tier.guest)
                            Builder(
                              builder: (context) {
                                final listInColumn =
                                    widget.appRecord?.tiers.toList() ?? [];

                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(listInColumn.length,
                                      (listInColumnIndex) {
                                    final listInColumnItem =
                                        listInColumn[listInColumnIndex];
                                    return Visibility(
                                      visible: !listInColumnItem.isPrimary &&
                                          valueOrDefault<bool>(
                                              currentUserDocument?.isAuthorized,
                                              false),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 5.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.currentIndex =
                                                  listInColumnIndex;
                                              safeSetState(() {});
                                            },
                                            child: TierButtonWidget(
                                              key: Key(
                                                  'Key6j8_${listInColumnIndex}_of_${listInColumn.length}'),
                                              buttonType: listInColumnIndex ==
                                                      _model.currentIndex
                                                  ? TierButtonType.select
                                                  : TierButtonType.unselect,
                                              tier: listInColumnItem,
                                              amountAfter: valueOrDefault<int>(
                                                widget.appRecord?.tiers
                                                    .firstOrNull?.price,
                                                299,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).divide(
                                    SizedBox(height: 5.0),
                                    filterFn: (listInColumnIndex) {
                                      final listInColumnItem =
                                          listInColumn[listInColumnIndex];
                                      return !listInColumnItem.isPrimary &&
                                          valueOrDefault<bool>(
                                              currentUserDocument?.isAuthorized,
                                              false);
                                    },
                                  ).addToStart(SizedBox(height: 30.0)),
                                );
                              },
                            ),
                          if (functions
                                  .subscriptionFromJson(
                                      FFAppState().subscriptionSnapshot)
                                  ?.status !=
                              Tier.premium)
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 20.0),
                                child: Text(
                                  'Отписаться можно в любой момент',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Vela Sans',
                                        fontSize: 10.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            visualDensity:
                                                VisualDensity.compact,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              Color(0xFF595A75),
                                        ),
                                        child: Checkbox(
                                          value: _model
                                              .checkboxValue1 ??= functions
                                                      .subscriptionFromJson(
                                                          FFAppState()
                                                              .subscriptionSnapshot)
                                                      ?.subscriptionId !=
                                                  null &&
                                              functions
                                                      .subscriptionFromJson(
                                                          FFAppState()
                                                              .subscriptionSnapshot)
                                                      ?.subscriptionId !=
                                                  '',
                                          onChanged: (functions
                                                          .subscriptionFromJson(
                                                              FFAppState()
                                                                  .subscriptionSnapshot)
                                                          ?.subscriptionId !=
                                                      null &&
                                                  functions
                                                          .subscriptionFromJson(
                                                              FFAppState()
                                                                  .subscriptionSnapshot)
                                                          ?.subscriptionId !=
                                                      '')
                                              ? null
                                              : (newValue) async {
                                                  safeSetState(() =>
                                                      _model.checkboxValue1 =
                                                          newValue!);
                                                },
                                          side: BorderSide(
                                            width: 2,
                                            color: Color(0xFF595A75),
                                          ),
                                          activeColor: Color(0xFF595A75),
                                          checkColor: (functions
                                                          .subscriptionFromJson(
                                                              FFAppState()
                                                                  .subscriptionSnapshot)
                                                          ?.subscriptionId !=
                                                      null &&
                                                  functions
                                                          .subscriptionFromJson(
                                                              FFAppState()
                                                                  .subscriptionSnapshot)
                                                          ?.subscriptionId !=
                                                      '')
                                              ? null
                                              : FlutterFlowTheme.of(context)
                                                  .info,
                                        ),
                                      ),
                                      Flexible(
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Я даю согласие на ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Vela Sans',
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                              TextSpan(
                                                text:
                                                    'совершение рекурентных платежей',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13.0,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                                mouseCursor:
                                                    SystemMouseCursors.click,
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () async {
                                                        await launchURL(
                                                            'https://drive.google.com/file/d/1_6MuuV-qfchCCATJZW0Y9ryZy4gaiM6V/view');
                                                      },
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Vela Sans',
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            visualDensity:
                                                VisualDensity.compact,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              Color(0xFF595A75),
                                        ),
                                        child: Checkbox(
                                          value: _model
                                              .checkboxValue2 ??= functions
                                                      .subscriptionFromJson(
                                                          FFAppState()
                                                              .subscriptionSnapshot)
                                                      ?.subscriptionId !=
                                                  null &&
                                              functions
                                                      .subscriptionFromJson(
                                                          FFAppState()
                                                              .subscriptionSnapshot)
                                                      ?.subscriptionId !=
                                                  '',
                                          onChanged: (functions
                                                          .subscriptionFromJson(
                                                              FFAppState()
                                                                  .subscriptionSnapshot)
                                                          ?.subscriptionId !=
                                                      null &&
                                                  functions
                                                          .subscriptionFromJson(
                                                              FFAppState()
                                                                  .subscriptionSnapshot)
                                                          ?.subscriptionId !=
                                                      '')
                                              ? null
                                              : (newValue) async {
                                                  safeSetState(() =>
                                                      _model.checkboxValue2 =
                                                          newValue!);
                                                },
                                          side: BorderSide(
                                            width: 2,
                                            color: Color(0xFF595A75),
                                          ),
                                          activeColor: Color(0xFF595A75),
                                          checkColor: (functions
                                                          .subscriptionFromJson(
                                                              FFAppState()
                                                                  .subscriptionSnapshot)
                                                          ?.subscriptionId !=
                                                      null &&
                                                  functions
                                                          .subscriptionFromJson(
                                                              FFAppState()
                                                                  .subscriptionSnapshot)
                                                          ?.subscriptionId !=
                                                      '')
                                              ? null
                                              : FlutterFlowTheme.of(context)
                                                  .info,
                                        ),
                                      ),
                                      Flexible(
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Я принимаю условия ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Vela Sans',
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                              TextSpan(
                                                text:
                                                    'договора публичной оферты',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13.0,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                                mouseCursor:
                                                    SystemMouseCursors.click,
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () async {
                                                        await launchURL(
                                                            'https://drive.google.com/file/d/1vDBHrUDmkbE87f_RlNx6_yZ8MxPRxw2y/view');
                                                      },
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Vela Sans',
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 16.0),
                            child: Container(
                              width: 343.0,
                              height: 44.0,
                              decoration: BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  if (valueOrDefault<bool>(
                                      currentUserDocument?.isAuthorized,
                                      false)) {
                                    return FFButtonWidget(
                                      onPressed:
                                          (functions
                                                              .subscriptionFromJson(
                                                                  FFAppState()
                                                                      .subscriptionSnapshot)
                                                              ?.subscriptionId !=
                                                          null &&
                                                      functions
                                                              .subscriptionFromJson(
                                                                  FFAppState()
                                                                      .subscriptionSnapshot)
                                                              ?.subscriptionId !=
                                                          ''
                                                  ? (functions
                                                              .subscriptionFromJson(
                                                                  FFAppState()
                                                                      .subscriptionSnapshot)
                                                              ?.subscriptionId !=
                                                          null &&
                                                      functions
                                                              .subscriptionFromJson(
                                                                  FFAppState()
                                                                      .subscriptionSnapshot)
                                                              ?.subscriptionId !=
                                                          '')
                                                  : !(_model.checkboxValue1! &&
                                                      _model.checkboxValue2!))
                                              ? null
                                              : () async {
                                                  if (Navigator.of(context)
                                                      .canPop()) {
                                                    context.pop();
                                                  }
                                                  context.pushNamed(
                                                    CloudpaymentsWebViewWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'tier': serializeParam(
                                                        widget.appRecord?.tiers
                                                            .elementAtOrNull(
                                                                _model
                                                                    .currentIndex),
                                                        ParamType.DataStruct,
                                                      ),
                                                      'cloudpaymentsKeys':
                                                          serializeParam(
                                                        widget.appRecord?.keys
                                                            .cloudpayments,
                                                        ParamType.DataStruct,
                                                      ),
                                                      'index': serializeParam(
                                                        _model.currentIndex,
                                                        ParamType.int,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                      text: widget.appRecord!.tiers
                                              .elementAtOrNull(
                                                  _model.currentIndex)!
                                              .isPrimary
                                          ? 'Оплатить подписку'
                                          : 'Начать 7-дневный пробный период',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Vela Sans',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                        disabledColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                    );
                                  } else {
                                    return FFButtonWidget(
                                      onPressed: () async {
                                        GoRouter.of(context).prepareAuthEvent();
                                        await authManager.signOut();
                                        GoRouter.of(context)
                                            .clearRedirectLocation();

                                        context.goNamedAuth(
                                            SplashScreenLWidget.routeName,
                                            context.mounted);
                                      },
                                      text: 'Войти или зарегистрироваться',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Vela Sans',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                          if ((functions
                                          .subscriptionFromJson(
                                              FFAppState().subscriptionSnapshot)
                                          ?.subscriptionId !=
                                      null &&
                                  functions
                                          .subscriptionFromJson(
                                              FFAppState().subscriptionSnapshot)
                                          ?.subscriptionId !=
                                      '') &&
                              (functions
                                      .subscriptionFromJson(
                                          FFAppState().subscriptionSnapshot)
                                      ?.status ==
                                  Tier.premium))
                            FFButtonWidget(
                              onPressed: () async {
                                _model.subDocCopy =
                                    await SubscriptionsRecord.getDocumentOnce(
                                        functions.userGetSubscroptionRef());
                                await actions.cancelSubscriptionCall(
                                  _model.subDocCopy!.subscriptionId,
                                );

                                await functions
                                    .userGetSubscroptionRef()
                                    .update({
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
                                context.safePop();
                                await action_blocks.subscriptionCheck(context);
                                await actions.showMartaNGSnackBar(
                                  context,
                                  SnackBarType.success,
                                  'Подписка отменена',
                                  ' ',
                                  5,
                                );

                                safeSetState(() {});
                              },
                              text: 'Отменить подписку',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Vela Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                            ),
                        ].addToEnd(SizedBox(height: 40.0)),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
