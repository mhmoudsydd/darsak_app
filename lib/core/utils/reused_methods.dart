import 'dart:math';

import 'package:flutter/material.dart';

class ReusedMethods {
static Color randomColors() {
  return Color.fromARGB(
    255, // Opacity (0-255)
    Random().nextInt(256), // Red
    Random().nextInt(256), // Green
    Random().nextInt(256), // Blue
  );
}
}