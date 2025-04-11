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

import 'package:medium/auth/firebase_auth/auth_util.dart';
import 'package:medium/index.dart';

import '../../backend/api_requests/api_calls.dart';

class MartaNGNavBar extends StatefulWidget {
  const MartaNGNavBar({
    super.key,
    this.width,
    this.height,
    this.initPageIndex,
  });

  final double? width;
  final double? height;
  final int? initPageIndex;

  @override
  State<MartaNGNavBar> createState() => _MartaNGNavBarState();
}

class _MartaNGNavBarState extends State<MartaNGNavBar> {
  late StreamSubscription<Null> _hasLP;

  final List<Map<String, dynamic>> tabs = [
    {'page': const HomePageWidget(), 'label': 'Главная', 'icon': 0},
    //{'page': EmptyPageWidget(), 'label': 'Главная', 'icon': 0},
    {'page': const CatalogPageWidget(), 'label': 'Каталог', 'icon': 1},
    {'page': const ProfilePageWidget(), 'label': 'Профиль', 'icon': 2},
  ];

  final icons = [
    const Icon(
      FFIcons.knbLeft,
      size: 20,
    ),
    const Icon(
      FFIcons.knavbarMiddle,
      size: 20,
    ),
    const RotatedBox(
      quarterTurns: 1,
      child: Icon(
        FFIcons.knbLeft,
        size: 20,
      ),
    ),
  ];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    //internetConnectionChecker();
    _updateUdid();
    _subscriptionCheck(context);

    _currentIndex = widget.initPageIndex ?? _currentIndex;

    _hasLP = Stream.periodic(const Duration(milliseconds: 500), (_) {})
        .listen((event) {
      if (!((currentUserDocument?.isAuthorized) ?? false)) {
        final appState = FFAppState().hasLastPlay;
        final hasLastPlay = currentUserDocument?.lastPlay.hasId() ?? false;
        if (appState != hasLastPlay) {
          FFAppState().update(() {
            FFAppState().hasLastPlay = false;
          });
        }
      } else {
        final appState = FFAppState().hasLastPlay;
        final hasLastPlay = currentUserDocument?.lastPlay.hasId() ?? false;
        if (appState != hasLastPlay) {
          FFAppState().update(() {
            FFAppState().hasLastPlay = hasLastPlay;
          });
        }
      }
    });
  }

  Future<void> _updateUdid() async {
    if (FFAppState().hasInternetConnection) {
      currentUserReference!.update(createUsersRecordData(
        udid: FFAppState().deviceInfo.udid,
      ));
    }
  }

//void _subscriptionCheck() {
//  SubscriptionsRecord.getDocument(
//          FirebaseFirestore.instance.doc('subscriptions/$currentUserUid'))
//      .listen((event) async {
//    if (FFAppState().deviceInfo.countryCode == 'RU') {
//      FFAppState().update(() {
//        FFAppState().subscriptionSnapshot = event.snapshotData;
//      });
//      //final doc = subscriptionFromJson(event.snapshotData);
//      //final currentTime = DateTime.now();
//      //final subscriptionEndTime = doc?.subscriptionEndTime;
//      // if (currentTime > (subscriptionEndTime ?? currentTime) &&
//      //     currentUser != null) {
//      //   final appRecord =
//      //       await AppRecord.getDocumentOnce(appRecordGetReference());
//      //   context.replaceNamed(
//      //     'SubscriptionsPage',
//      //     queryParameters: {
//      //       'appRecord': serializeParam(
//      //         appRecord,
//      //         ParamType.Document,
//      //       ),
//      //       'showPopUp': serializeParam(
//      //         true,
//      //         ParamType.bool,
//      //       ),
//      //       'showCloseIcon': serializeParam(
//      //         false,
//      //         ParamType.bool,
//      //       ),
//      //     }.withoutNulls,
//      //     extra: <String, dynamic>{
//      //       'appRecord': appRecord,
//      //     },
//      //   );
//      // }
//    }
//  });
//}

  Future _subscriptionCheck(BuildContext context) async {
    ApiCallResponse? whoIsResponse;
    AppRecord? app;

    if (FFAppState().deviceInfo.countryCode == '') {
      whoIsResponse = await WhoisCall.call();

      FFAppState().updateDeviceInfoStruct(
        (e) => e
          ..countryCode = WhoisCall.countryCode(
            (whoIsResponse?.jsonBody ?? ''),
          ),
      );

      await currentUserReference!.update(createUsersRecordData(
        countryCode: WhoisCall.countryCode(
          (whoIsResponse.jsonBody ?? ''),
        ),
      ));
    }
    if (FFAppState().deviceInfo.countryCode == 'RU') {
      SubscriptionsRecord.getDocument(userGetSubscroptionRef())
          .listen((event) async {
        FFAppState().update(() {
          FFAppState().subscriptionSnapshot = event.snapshotData;
        });
        if ((event.subscriptionEndTime! < getCurrentTimestamp)) {
          app = await AppRecord.getDocumentOnce(appRecordGetReference());

          context.pushNamed(
            'SubscriptionsPage',
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
      });
    }
  }

  @override
  void dispose() {
    _hasLP.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: tabs[_currentIndex]['page'],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              //splashColor: const Color(0xFFFDFFFE),
              //highlightColor: const Color(0xFFFDFFFE),
              //hoverColor: const Color(0xFFFDFFFE)
              ),
          child: BottomNavigationBar(
              backgroundColor: const Color(0xFFFFFFFF),
              selectedItemColor: const Color(0xFF1C1C1C),
              unselectedItemColor: const Color(0xFFDCDBDB),
              currentIndex: _currentIndex,
              unselectedFontSize: 12,
              selectedFontSize: 12,
              onTap: (i) {
                if (currentUserDocument == null) {
                  _logOut(context);
                }
                setState(() => _currentIndex = i);
              },
              elevation: 0,
              items: List.generate(
                  tabs.length,
                  (i) => BottomNavigationBarItem(
                      icon: icons[tabs[i]['icon']], label: tabs[i]['label']))),
        ));
  }
}

Future _logOut(BuildContext context) async {
  GoRouter.of(context).prepareAuthEvent();
  await authManager.signOut();
  GoRouter.of(context).clearRedirectLocation();

  context.goNamedAuth('SplashScreenL', context.mounted);
}
