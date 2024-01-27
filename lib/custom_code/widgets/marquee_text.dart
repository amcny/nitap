// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:text_scroll/text_scroll.dart';

class MarqueeText extends StatefulWidget {
  const MarqueeText({
    Key? key,
    this.width,
    this.height,
    this.text,
    this.color,
    this.repeatNumber,
    this.intervalSpace,
    this.fontSize,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? text;
  final Color? color;
  final int? repeatNumber;
  final int? intervalSpace;
  final double? fontSize;

  @override
  _MarqueeTextState createState() => _MarqueeTextState();
}

class _MarqueeTextState extends State<MarqueeText> {
  @override
  Widget build(BuildContext context) {
    return TextScroll(
      widget.text!,
      intervalSpaces: widget.intervalSpace,
      numberOfReps: widget.repeatNumber,
      velocity: Velocity(pixelsPerSecond: Offset(50, 0)),
      style: TextStyle(color: widget.color, fontSize: widget.fontSize),
      selectable: true,
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
