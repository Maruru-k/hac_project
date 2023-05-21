import 'package:flutter/material.dart';
import 'package:hac_project/constants.dart';

class TdpTextStyle {
  static TextStyle large(Color color) {
    return TextStyle(
      color: color,
      fontSize: 36,
      fontWeight: FontWeight.w700,
      fontFamily: fontFamily,
    );
  }

  static TextStyle standard(Color color) {
    return TextStyle(
      color: color,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: fontFamily,
    );
  }

  static TextStyle title1(Color color) {
    return TextStyle(
      color: color,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily,
    );
  }

  static TextStyle title2(Color color) {
    return TextStyle(
      color: color,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      fontFamily: fontFamily,
    );
  }

  static TextStyle title3(Color color) {
    return TextStyle(
      color: color,
      fontSize: 20,
      fontWeight: FontWeight.w500,
      fontFamily: fontFamily,
    );
  }

  static TextStyle title4(Color color) {
    return TextStyle(
      color: color,
      fontSize: 24,
      fontWeight: FontWeight.w500,
      fontFamily: fontFamily,
    );
  }

  static TextStyle small(Color color) {
    return TextStyle(
      color: color,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: fontFamily,
    );
  }
}
