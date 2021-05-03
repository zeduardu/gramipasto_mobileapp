import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class AppGradients {
  static final linear = LinearGradient(colors: [
    Color(0xFF57B6E5),
    Color.fromRGBO(130, 87, 229, 0.695),
  ], stops: [
    0.5,
    0.695
  ], transform: GradientRotation(2.13959913 * pi));

  static final linearBlue = LinearGradient(
    colors: [
      Color.fromRGBO(94, 194, 220, 1),
      Color.fromRGBO(94, 194, 220, 0.0),
    ],
    stops: [0.15, 0.7],
    transform: GradientRotation(1.571),
  );
}
