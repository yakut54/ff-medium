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

import 'dart:async';
import 'dart:ui' as ui;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:just_audio/just_audio.dart';
import 'package:marqueer/marqueer.dart';
import 'package:medium/auth/firebase_auth/auth_util.dart';

class MartaNGPlayerController extends StatefulWidget {
  const MartaNGPlayerController({
    super.key,
    this.width,
    this.height,
    required this.initLessonIndex,
    this.courseDoc,
    this.meditationDoc,
  });

  final double? width;
  final double? height;
  final int initLessonIndex;
  final CoursesRecord? courseDoc;
  final MeditationsRecord? meditationDoc;

  @override
  State<MartaNGPlayerController> createState() =>
      _MartaNGPlayerControllerState();
}

class _MartaNGPlayerControllerState extends State<MartaNGPlayerController> {
  late Player player;
  Duration? progress;
  late String photoUrl;
  late DocumentReference reference;
  late String title;
  late String subtitle;
  late List<LessonStruct> lessons;
  late LessonStruct currentLesson;
  bool listenAgain = false;
  late MeditationsRecord? meditationDoc;
  late CoursesRecord? courseDoc;
  final GlobalKey _marqueerKey = GlobalKey();
  bool canShowSnackBar = true;
  bool hasInternetWithoutVPN = true;

  @override
  void initState() {
    meditationDoc = widget.meditationDoc;
    courseDoc = widget.courseDoc;

    lessons =
        meditationDoc != null ? meditationDoc!.lessons : courseDoc!.lessons;
    currentLesson = lessons[widget.initLessonIndex];
    title = meditationDoc != null
        ? 'Медитация: ${meditationDoc!.name}'
        : 'Курс: ${courseDoc!.name}';
    subtitle = meditationDoc != null
        ? lessons[widget.initLessonIndex].name
        : lessons[widget.initLessonIndex].name;
    reference =
        meditationDoc != null ? meditationDoc!.reference : courseDoc!.reference;
    photoUrl = meditationDoc != null ? meditationDoc!.photo : courseDoc!.photo;
    player = PlayerImpl(AudioPlayer());
    player.currentDuration.listen((event) {
      if (mounted && progress != event) {
        setState(() {
          progress = event;
        });
      }
    });
    player.initFromLesson(currentLesson);
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
    _hasConnection().listen((hasConnection) {
      hasInternetWithoutVPN = hasConnection;
      if (!hasConnection) {
        if (canShowSnackBar) {
          setState(() {
            _showSnackBar(context);
            canShowSnackBar = false;
          });
        }
      } else {
        setState(() => canShowSnackBar = true);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) async {
        await player.stop();
        context.pop();
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
              size: 24,
            ),
            onPressed: () async {
              player.stop();
              context.pop();
            },
          ),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: photoUrl, //widget.photoUrl,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageBuilder: (context, imageProvider) => Image(
                  image: CachedNetworkImageProvider(photoUrl),
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover),
            ),
            Positioned.fill(
                child: Container(
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  color: Colors.black.withOpacity(0.34),
                  height: double.maxFinite,
                  width: double.maxFinite,
                ),
              ),
            )),
            if (!listenAgain)
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CachedNetworkImage(
                      imageUrl: photoUrl,
                      //progressIndicatorBuilder: (context, url, downloadProgress) =>
                      //    CircularProgressIndicator(
                      //        value: downloadProgress.progress),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      imageBuilder: (context, imageProvider) => ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image(
                            image: CachedNetworkImageProvider(photoUrl),
                            width: 240,
                            height: 240,
                            fit: BoxFit.cover),
                      ),
                      placeholder: (context, text) => const SizedBox(
                        height: 240,
                        width: 240,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10),
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Vela Sans',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: FlutterFlowTheme.of(context).accent2,
                            letterSpacing: 0,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: SizedBox(
                        height: 30,
                        child: LayoutBuilder(builder:
                            (BuildContext cntxt, BoxConstraints constraints) {
                          final textPainter = TextPainter(
                            text: TextSpan(
                              text: subtitle,
                              style: const TextStyle(fontSize: 16),
                            ),
                            textDirection: ui.TextDirection.ltr,
                          )..layout();

                          if (textPainter.size.width <
                              constraints.maxWidth - 120) {
                            return Text(
                              subtitle,
                              //textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(cntxt)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Vela Sans',
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: FlutterFlowTheme.of(cntxt)
                                        .secondaryBackground,
                                    letterSpacing: 0,
                                    useGoogleFonts: false,
                                  ),
                            );
                          } else {
                            return ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return LinearGradient(
                                  colors: [
                                    Colors.white.withOpacity(0),
                                    Colors.white,
                                    Colors.white,
                                    Colors.white.withOpacity(0.1)
                                  ],
                                  stops: const [0, 0.1, 0.9, 1],
                                  tileMode: TileMode.clamp,
                                ).createShader(bounds);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 1.0),
                                child: Marqueer(
                                  autoStartAfter: const Duration(seconds: 1),
                                  key: _marqueerKey,
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 120,
                                  ),
                                  padding: EdgeInsets.only(
                                      right: MediaQuery.of(context).size.width -
                                          120),
                                  pps: 50,
                                  child: Text(
                                    subtitle,
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(cntxt)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Vela Sans',
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                          color: FlutterFlowTheme.of(cntxt)
                                              .secondaryBackground,
                                          letterSpacing: 0,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ),
                            );
                          }
                        }),
                      )
                      //TextScroll(
                      //  '   $subtitle   ',
                      //  velocity: const Velocity(pixelsPerSecond: Offset(100, 0)),
                      //  //delayBefore: const Duration(seconds: 1),
                      //  //numberOfReps: 5,
                      //  //pauseBetween: const Duration(seconds: 10),
                      //  mode: TextScrollMode.bouncing,
                      //  fadedBorderWidth: 0.1,
                      //  fadedBorder: true,
                      //  style: FlutterFlowTheme.of(context).titleSmall.override(
                      //        fontFamily: 'Vela Sans',
                      //        fontSize: 24,
                      //        fontWeight: FontWeight.w700,
                      //        color: FlutterFlowTheme.of(context)
                      //            .secondaryBackground,
                      //        letterSpacing: 0,
                      //        useGoogleFonts: false,
                      //      ),
                      //)
                      //
                      //Text(
                      //  subtitle,
                      //  maxLines: 2,
                      //  textAlign: TextAlign.center,
                      //  overflow: TextOverflow.ellipsis,
                      //  style: FlutterFlowTheme.of(context).titleSmall.override(
                      //        fontFamily: 'Vela Sans',
                      //        fontSize: 24,
                      //        fontWeight: FontWeight.w700,
                      //        color:
                      //            FlutterFlowTheme.of(context).secondaryBackground,
                      //        letterSpacing: 0,
                      //        useGoogleFonts: false,
                      //      ),
                      //),
                      ),
                  SliderTheme(
                    data: const SliderThemeData(
                      thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 3,
                          elevation: 0,
                          pressedElevation: 0),
                      thumbColor: Colors.white,
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xff8d8e98),
                    ),
                    child: _audioSlider(),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    if (!(lessonsIndexOf(currentLesson, lessons) == 0))
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.transparent,
                            elevation: 0),
                        onPressed: () => hasInternetWithoutVPN
                            ? _prev()
                            : _showSnackBar(context),
                        child: const SizedBox(
                            height: 50,
                            child: Icon(
                              FFIcons.kaudioPrev,
                              size: 32,
                            )),
                      ),
                    if (lessonsIndexOf(currentLesson, lessons) == 0)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            shadowColor: Colors.transparent,
                            foregroundColor: Colors.transparent,
                            surfaceTintColor: Colors.transparent,
                            disabledBackgroundColor: Colors.transparent,
                            disabledForegroundColor: Colors.transparent,
                            backgroundColor: Colors.transparent,
                            elevation: 0),
                        onPressed: null,
                        child: const SizedBox(
                            height: 50,
                            child: Icon(
                              FFIcons.kaudioNext,
                              size: 32,
                              color: Colors.transparent,
                            )),
                      ),
                    MiddleButton(
                      player,
                      context: context,
                    ),
                    if (!(lessonsIndexOf(currentLesson, lessons) ==
                        lessons.length - 1))
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.transparent,
                            elevation: 0),
                        onPressed: () => hasInternetWithoutVPN
                            ? _next()
                            : _showSnackBar(context),
                        child: const SizedBox(
                            height: 50,
                            child: Icon(
                              FFIcons.kaudioNext,
                              size: 32,
                            )),
                      ),
                    if (lessonsIndexOf(currentLesson, lessons) ==
                        lessons.length - 1)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            shadowColor: Colors.transparent,
                            foregroundColor: Colors.transparent,
                            surfaceTintColor: Colors.transparent,
                            disabledBackgroundColor: Colors.transparent,
                            disabledForegroundColor: Colors.transparent,
                            backgroundColor: Colors.transparent,
                            elevation: 0),
                        onPressed: null,
                        child: const SizedBox(
                            height: 50,
                            child: Icon(
                              FFIcons.kaudioNext,
                              size: 32,
                              color: Colors.transparent,
                            )),
                      ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: InfoText(
                      player,
                      context: context,
                    ),
                  )
                ],
              ),
            if (listenAgain)
              Container(
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: photoUrl, //widget.photoUrl,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      imageBuilder: (context, imageProvider) => Image(
                          image: CachedNetworkImageProvider(photoUrl),
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover),
                    ),
                    Positioned.fill(
                        child: BackdropFilter(
                      filter: ui.ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Container(
                        color: Colors.black.withOpacity(0.34),
                        height: double.maxFinite,
                        width: double.maxFinite,
                      ),
                    )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Медитация пройдена',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Vela Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 24,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: false,
                                      ),
                                ),
                                Text(
                                  'Вы можете прослушать её заново или перейти к другим медитациям',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Vela Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 16,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ].divide(const SizedBox(height: 21)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 60),
                          child: SizedBox(
                            width: 200,
                            child: Column(
                                children: [
                              ElevatedButton(
                                onPressed: () {
                                  listenAgain = false;
                                  player.seek(Duration.zero);
                                  player.play();
                                },
                                style: ElevatedButton.styleFrom(
                                    minimumSize:
                                        const Size(double.infinity, 50),
                                    elevation: 0,
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(14))),
                                child: Text(
                                  'Слушать ещё раз',
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Vela Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  player.stop();
                                  if (meditationDoc != null) {
                                    context.pop();
                                    context.goNamed(
                                      'NavBarPage',
                                      queryParameters: {
                                        'initPageIndex': serializeParam(
                                          0,
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                      //extra: <String, dynamic>{
                                      //  kTransitionInfoKey: const TransitionInfo(
                                      //    hasTransition: true,
                                      //    transitionType: PageTransitionType.fade,
                                      //  ),
                                      //},
                                    );
                                  } else {
                                    context.pop();
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    minimumSize:
                                        const Size(double.infinity, 50),
                                    elevation: 0,
                                    backgroundColor: const Color(0xFF1C1C1C),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(14))),
                                child: Text(
                                  meditationDoc != null
                                      ? 'На главную'
                                      : 'К курсу',
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Vela Sans',
                                        color: Colors.white,
                                        letterSpacing: 0,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ].divide(const SizedBox(height: 15))),
                          ),
                        )
                      ].divide(const SizedBox(height: 200)),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget _audioSlider() {
    Duration audioDuration = player.duration ?? Duration.zero;
    Duration currentPosition = progress ?? Duration.zero;
    Duration remainingTime = audioDuration - currentPosition;

    if (currentPosition >=
        (audioDuration >= const Duration(seconds: 1)
            ? audioDuration
            : const Duration(seconds: 999))) {
      setState(() {
        if (!listenAgain) {
          _updateLessons();
          listenAgain = true;
        }
      });
    }

    return SizedBox(
      height: 50,
      child: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(0, -1),
            child: Slider(
              max: audioDuration.inMilliseconds.toDouble(),
              value: _getValue(currentPosition, audioDuration),
              onChanged: (value) {},
              onChangeEnd: (value) {
                //manual = false;
                if (mounted) {
                  setState(() {
                    player.seek(Duration(milliseconds: value.toInt()));
                    player.play();
                  });
                }
              },
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0, 1),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _formattingTime(currentPosition),
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    '-${_formattingTime(remainingTime)}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _updateLessons() async {
    final DocumentReference ref =
        meditationDoc != null ? meditationDoc!.reference : courseDoc!.reference;
    final snapshot = await FirebaseFirestore.instance.doc(ref.path).get();
    List<LessonStruct>? newLessons = [];
    if (meditationDoc != null) {
      final doc = MeditationsRecord.fromSnapshot(snapshot);
      meditationDoc = doc;
      newLessons = await userViewLesson(
          currentLesson, doc.lessons, currentUserReference!);
    } else {
      final doc = CoursesRecord.fromSnapshot(snapshot);
      courseDoc = doc;
      newLessons = await userViewLesson(
          currentLesson, doc.lessons, currentUserReference!);
    }
    //
    await ref.update({
      ...mapToFirestore(
        {
          'lessons': getLessonListFirestoreData(
            newLessons,
          ),
        },
      ),
    });
  }

  double _getValue(Duration currentPosition, Duration audioDuration) {
    if (currentPosition.inMilliseconds.toDouble() >=
        audioDuration.inMilliseconds.toDouble()) player.next();
    return currentPosition.inMilliseconds.toDouble() >=
            audioDuration.inMilliseconds.toDouble()
        ? audioDuration.inMilliseconds.toDouble()
        : currentPosition.inMilliseconds.toDouble();
  }

  String _formattingTime(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    String formattedTime = '';
    if (hours > 0) {
      formattedTime += '${hours.toString().padLeft(2, '0')}:';
    }
    if (minutes < 10 && hours > 0) {
      formattedTime += '0';
    }
    formattedTime += '${minutes.toString().padLeft(2, '0')}:';
    formattedTime += seconds.toString().padLeft(2, '0');
    return formattedTime;
  }

  Future<void> _next() async {
    final index = lessons.indexOf(currentLesson) + 1;
    await _route(index);
  }

  Future<void> _prev() async {
    final index = lessons.indexOf(currentLesson) - 1;
    await _route(index);
  }

  Future<void> _route(int index) async {
    currentLesson = lessons[index];
    if (getContentType(currentLesson) == ContentType.doc) {
      await player.stop();
      context.pushReplacementNamed(
        'PDFViewPage',
        queryParameters: {
          'docPath': serializeParam(
            currentLesson.doc,
            ParamType.String,
          ),
          'title': serializeParam(
            currentLesson.name,
            ParamType.String,
          ),
        }.withoutNulls,
      );
      _updateLessons();
    }
    if (getContentType(currentLesson) == ContentType.video) {
      await player.stop();
      context.pushReplacementNamed(
        'VideoPlayerPage',
        queryParameters: {
          'videoPath': serializeParam(
            currentLesson.video,
            ParamType.String,
          ),
          'title': serializeParam(
            currentLesson.name,
            ParamType.String,
          ),
        }.withoutNulls,
      );
      _updateLessons();
    }
    if (getContentType(currentLesson) == ContentType.audio) {
      player.fromLesson(currentLesson);
      subtitle = lessons[index].name;
    }
  }
}

class InfoText extends StatefulWidget {
  const InfoText(
    this.player, {
    required this.context,
    super.key,
  });

  final Player player;
  final BuildContext context;
  @override
  State<InfoText> createState() => _InfoTextState();
}

class _InfoTextState extends State<InfoText> {
  late Player _player;
  PlayerState? _state;
  Duration? _duration;
  @override
  void initState() {
    _player = widget.player;
    _player.playerStateStream.listen((state) {
      if (mounted && _state != state) {
        setState(() => _state = state);
      }
    });
    _player.currentDuration.listen((duration) {
      if (mounted && _duration != duration) {
        setState(() => _duration = duration);
      }
    });
    super.initState();
  }

  String _text() {
    if (_state == null) return 'Начать прослушивание';
    return (!_state!.playing)
        ? (_duration ?? Duration.zero) > const Duration(milliseconds: 250)
            ? 'Продолжить прослушивание'
            : 'Начать прослушивание'
        : 'Остановить прослушивание';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _text(),
      style: const TextStyle(color: Colors.white),
    );
  }
}

class MiddleButton extends StatefulWidget {
  const MiddleButton(
    this.player, {
    required this.context,
    super.key,
  });

  final Player player;
  final BuildContext context;

  @override
  State<MiddleButton> createState() => _MiddleButtonState();
}

class _MiddleButtonState extends State<MiddleButton> {
  late Player _player;
  PlayerState? _state;
  bool canShowSnackBar = true;
  bool hasInternetWithoutVPN = true;
  @override
  void initState() {
    _player = widget.player;
    _player.playerStateStream.listen((state) {
      if (mounted && _state != state) {
        setState(() => _state = state);
      }
    });
    _hasConnection().listen((hasInternet) {
      hasInternetWithoutVPN = hasInternet;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
    super.initState();
  }

  void _action() {
    if (_state == null) widget.player.play();
    if (!hasInternetWithoutVPN) _showSnackBar(context);
    if (_state!.playing) {
      widget.player.pause();
    } else {
      widget.player.play();
    }
  }

  IconData _icon() {
    if (_state == null) return Icons.pause;
    if (!_state!.playing) {
      return Icons.play_arrow;
    } else {
      return Icons.pause;
    }
  }

  @override
  Widget build(context) {
    return ElevatedButton(
        onPressed: () => setState(() => _action()),
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: Colors.transparent,
            elevation: 0),
        child: Icon(
          _icon(),
          color: Colors.white,
          size: 80,
        ));
  }

//////////////////////////////////////////////////////
//////////////////////////////////////////////////////
//////////////////////////////////////////////////////
//////////////////////////////////////////////////////
//////////////////////////////////////////////////////
}

final class PlayerImpl implements Player {
  PlayerImpl(AudioPlayer audioPlayer) : _player = audioPlayer;

  final AudioPlayer _player;
  late AudioSource _playlist;
  late String _currentAudio;

  @override
  Future<PlayerImpl> init() async {
    _currentAudio =
        'https://dnl4.drivemusic.me/dl/nXqTswYiIgklrzz1ibqFlA/1711144610/download_music/2015/10/pendulum-crush.mp3';
    _player.setUrl(_currentAudio);
    //_player.setVolume(0.1);
    _playlist = ConcatenatingAudioSource(children: [
      AudioSource.uri(Uri.parse(
          'https://dnl4.drivemusic.me/dl/nXqTswYiIgklrzz1ibqFlA/1711144610/download_music/2015/10/pendulum-crush.mp3')),
      AudioSource.uri(Uri.parse(
          'https://dnl2.drivemusic.me/dl/l84Q35OxKooW71E6cCoH1A/1711144667/download_music/2019/03/receptor-magnetism.mp3')),
      AudioSource.uri(Uri.parse(
          'https://dnl1.drivemusic.me/dl/jdHl8zxW9KnBRhtnPFBaRA/1711144926/download_music/2021/04/inpetto-over-you.mp3')),
    ]);

    _player.setAudioSource(_playlist);
    return this;
  }

  @override
  Future<void> next({String? url}) async {
    if (url is String) {
      await _player.setUrl(url);
      await _player.stop();
      await _player.play();
    } else {
      await _player.seekToNext();
      await _player.play();
    }
  }

  @override
  Future<void> pause() async {
    await _player.pause();
  }

  @override
  Future<void> play() async {
    await _player.play();
  }

  @override
  Future<void> prev({String? url}) async {
    if (url is String) {
      await _player.stop();
      await _player.setUrl(url);
      await _player.play();
    } else {
      await _player.seekToPrevious();
      await _player.play();
    }
  }

  @override
  Future<void> stop() async {
    await _player.stop();
  }

  @override
  get currentDuration => _player.positionStream;

  @override
  Duration? get duration => _player.duration;

  @override
  set setDuration(Duration position) {
    _player.seek(position);
  }

  @override
  Future<void> setPlaylist(List<AudioSource> palylist) async {
    _playlist = ConcatenatingAudioSource(children: palylist);
  }

  @override
  Stream<PlayerState> get playerStateStream => _player.playerStateStream;

  @override
  void seek(Duration position) => _player.seek(position);

  @override
  void setPlaylistFromLessons(
      List<LessonStruct> lessons, int initLessonIndex) {}

  @override
  Future<void> fromLesson(LessonStruct lesson) async {
    _currentAudio = lesson.audio;
    await _player.setUrl(_currentAudio, preload: false);
    //await Future.delayed(Duration(seconds: 5));
    await play();
  }

  @override
  Future<void> initFromLesson(LessonStruct lesson) async {
    _currentAudio = lesson.audio;
    await _player.setUrl(_currentAudio);
    //await _player.seek(Duration.zero);
  }

  @override
  Stream<Duration> get durationStream => _player.positionStream;
}

abstract interface class Player {
  Future<PlayerImpl> init();

  void play();
  Future<void> stop();
  void next({String? url});
  void prev({String? url});
  void pause();

  Stream<Duration> get currentDuration;
  Duration? get duration;
  set setDuration(Duration position);
  Stream<PlayerState> get playerStateStream;
  Stream<Duration> get durationStream;
  void setPlaylist(List<AudioSource> palylist);
  void setPlaylistFromLessons(List<LessonStruct> lessons, int initLessonIndex);
  void seek(Duration position);
  void fromLesson(LessonStruct lesson);
  void initFromLesson(LessonStruct lesson);
}

Future<void> _showSnackBar(BuildContext context) {
  return showMartaNGSnackBar(context, SnackBarType.error,
      'Произошла ошибка загрузки', 'Проверьте интернет-соединение', 3);
}

Stream<bool> _hasConnection() {
  return Stream.periodic(const Duration(seconds: 1), (int val) {
    return FFAppState().hasInternetConnection && !FFAppState().hasVpnConnection;
  });
}
