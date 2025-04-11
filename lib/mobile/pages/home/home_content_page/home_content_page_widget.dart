import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/common/cards/course_card/course_card_widget.dart';
import '/common/cards/meditation_card/meditation_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/pages/catalog/widgets/no_content/no_content_widget.dart';
import 'package:flutter/material.dart';
import 'home_content_page_model.dart';
export 'home_content_page_model.dart';

class HomeContentPageWidget extends StatefulWidget {
  const HomeContentPageWidget({
    super.key,
    required this.meditationDocs,
    required this.coursesDocs,
    required this.type,
    required this.initialIndex,
  });

  final List<MeditationsRecord>? meditationDocs;
  final List<CoursesRecord>? coursesDocs;
  final HomePageBlockType? type;
  final int? initialIndex;

  static String routeName = 'HomeContentPage';
  static String routePath = '/homeContentPage';

  @override
  State<HomeContentPageWidget> createState() => _HomeContentPageWidgetState();
}

class _HomeContentPageWidgetState extends State<HomeContentPageWidget>
    with TickerProviderStateMixin {
  late HomeContentPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeContentPageModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: min(
          valueOrDefault<int>(
            widget.initialIndex,
            0,
          ),
          1),
    )..addListener(() => safeSetState(() {}));
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
              size: 24.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            () {
              if (widget.type == HomePageBlockType.isNew) {
                return 'Новинки';
              } else if (widget.type == HomePageBlockType.isPopural) {
                return 'Популярно сейчас';
              } else if (widget.type == HomePageBlockType.isForYou) {
                return 'Специально для вас';
              } else {
                return 'Курсы и медитации';
              }
            }()
                .maybeHandleOverflow(
              maxChars: 20,
              replacement: '…',
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Vela Sans',
                  color: Colors.black,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  useGoogleFonts: false,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            children: [
              Align(
                alignment: Alignment(0.0, 0),
                child: TabBar(
                  labelColor: FlutterFlowTheme.of(context).primaryText,
                  unselectedLabelColor:
                      FlutterFlowTheme.of(context).secondaryText,
                  labelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Vela Sans',
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        useGoogleFonts: false,
                      ),
                  unselectedLabelStyle: TextStyle(),
                  indicatorColor: FlutterFlowTheme.of(context).primary,
                  padding: EdgeInsets.all(4.0),
                  tabs: [
                    Tab(
                      text: 'Курсы',
                    ),
                    Tab(
                      text: 'Медитации',
                    ),
                  ],
                  controller: _model.tabBarController,
                  onTap: (i) async {
                    [() async {}, () async {}][i]();
                  },
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _model.tabBarController,
                  children: [
                    KeepAliveWidgetWrapper(
                      builder: (context) => Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Builder(
                          builder: (context) {
                            if (widget.coursesDocs != null &&
                                (widget.coursesDocs)!.isNotEmpty) {
                              return ListView(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final courses =
                                              widget.coursesDocs!.toList();

                                          return Wrap(
                                            spacing: 5.0,
                                            runSpacing: 5.0,
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            direction: Axis.horizontal,
                                            runAlignment: WrapAlignment.start,
                                            verticalDirection:
                                                VerticalDirection.down,
                                            clipBehavior: Clip.antiAlias,
                                            children: List.generate(
                                                courses.length, (coursesIndex) {
                                              final coursesItem =
                                                  courses[coursesIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0,
                                                        0.0,
                                                        0.0,
                                                        valueOrDefault<double>(
                                                          coursesIndex ==
                                                                  (widget.coursesDocs
                                                                          ?.length ??
                                                                      0 - 1)
                                                              ? 16.0
                                                              : 0.0,
                                                          0.0,
                                                        )),
                                                child: CourseCardWidget(
                                                  key: Key(
                                                      'Keyxb4_${coursesIndex}_of_${courses.length}'),
                                                  cardType: CardType.big,
                                                  courseDoc: coursesItem,
                                                ),
                                              );
                                            }),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return wrapWithModel(
                                model: _model.noContentModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: NoContentWidget(
                                  hideButton: true,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    KeepAliveWidgetWrapper(
                      builder: (context) => Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Builder(
                          builder: (context) {
                            if (widget.meditationDocs != null &&
                                (widget.meditationDocs)!.isNotEmpty) {
                              return ListView(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final meditations =
                                              widget.meditationDocs!.toList();

                                          return Wrap(
                                            spacing: 5.0,
                                            runSpacing: 5.0,
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            direction: Axis.horizontal,
                                            runAlignment: WrapAlignment.start,
                                            verticalDirection:
                                                VerticalDirection.down,
                                            clipBehavior: Clip.none,
                                            children: List.generate(
                                                meditations.length,
                                                (meditationsIndex) {
                                              final meditationsItem =
                                                  meditations[meditationsIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0,
                                                        0.0,
                                                        0.0,
                                                        valueOrDefault<double>(
                                                          meditationsIndex ==
                                                                  (widget.meditationDocs
                                                                          ?.length ??
                                                                      0 - 1)
                                                              ? 16.0
                                                              : 0.0,
                                                          0.0,
                                                        )),
                                                child: MeditationCardWidget(
                                                  key: Key(
                                                      'Key6o5_${meditationsIndex}_of_${meditations.length}'),
                                                  cardType: CardType.standart,
                                                  meditationDoc:
                                                      meditationsItem,
                                                ),
                                              );
                                            }),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return wrapWithModel(
                                model: _model.noContentModel2,
                                updateCallback: () => safeSetState(() {}),
                                child: NoContentWidget(
                                  hideButton: true,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
