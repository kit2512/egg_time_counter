import 'package:flutter/material.dart';

const designHeight = 844.0;
const designWidth = 390.0;

class MediaConfig {
  static late double height;
  static late double width;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
  }
}

double getPHeight(double height) {
  return (height / designHeight) * MediaConfig.height;
}

double getPWidth(double width) {
  return (width / designWidth) * MediaConfig.width;
}
