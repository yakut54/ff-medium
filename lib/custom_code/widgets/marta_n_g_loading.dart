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

import 'package:flutter/widgets.dart';

import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';

import 'index.dart'; // Imports other custom widgets

class MartaNGLoading extends StatefulWidget {
  const MartaNGLoading(
      {super.key, this.width, this.height, required this.message});

  final double? width;
  final double? height;
  final String? message;

  @override
  State<MartaNGLoading> createState() => _MartaNGLoadingState();
}

class _MartaNGLoadingState extends State<MartaNGLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late String message;
  late TextStyle textStyle;

  @override
  void initState() {
    super.initState();
    textStyle = textStyle = FlutterFlowTheme.of(context).bodyMedium.override(
          fontFamily: 'Vela Sans',
          color: FlutterFlowTheme.of(context).secondaryText,
          fontSize: 16.0,
          letterSpacing: 0.0,
          fontWeight: FontWeight.w500,
          useGoogleFonts: false,
        );
    message = widget.message ?? '';
    // message = 'Идёт загрузка...';
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 8));
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RotationTransition(
            turns: _controller,
            child: Icon(FFIcons.kloading,
                size: 40, color: FlutterFlowTheme.of(context).secondaryText),
          ),
          if (message.isNotEmpty)
            AnimatedTextKit(
                pause: const Duration(seconds: 5),
                isRepeatingAnimation: false,
                animatedTexts: [
                  MediumAnimatedText(
                      text: message,
                      textStyle: textStyle,
                      duration: const Duration(seconds: 1)),
                  MediumAnimatedText(
                      text: 'Подключаемся...',
                      textStyle: textStyle,
                      duration: const Duration(seconds: 1)),
                  MediumAnimatedText(
                      text: 'Ещё чуть-чуть...',
                      textStyle: textStyle,
                      duration: const Duration(seconds: 1)),
                ]),
        ].divide(const SizedBox(
          height: 20,
        )));
  }
}

class MediumAnimatedText extends AnimatedText {
  MediumAnimatedText(
      {required super.text, required super.duration, super.textStyle});

  late final AnimationController _controller;
  late final Animation<double> _opacityAnimation;

  @override
  void initAnimation(AnimationController controller) {
    _controller = controller;
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.0,
          0.5,
          curve: Curves.easeInOut,
        ),
      ),
    );
    _controller.addListener(() async {
      if (_controller.status == AnimationStatus.completed) {
        await Future.delayed(const Duration(seconds: 4));
        _controller.reverse();
      } else if (_controller.status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  Widget animatedBuilder(BuildContext context, Widget? child) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: child,
    );
  }
}
