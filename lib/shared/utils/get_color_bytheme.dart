import 'package:flutter/material.dart';

Color getColorByTheme(BuildContext context) {
  return Theme.of(context).brightness == Brightness.light
      ? Colors.white70
      : Colors.black26;
}
