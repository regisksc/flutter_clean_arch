import 'package:flutter/material.dart';

abstract class MainTheme {
  //Background of most parts of the app
  static const Color backgroundColor = Color(0xFFFDFDFD);
  //
  // derived from primary color, used on elevations (e.g: Buttons and Cards)
  static const Color secondaryBackgroundColor = Color(0xFFFAFAFA);
  //
  //Background of most parts of the app
  static const Color onBackgroundColor = Color(0xFF0C0C0C);
  //
  // Most useful components will take this color
  static const Color primaryColor = Colors.black;
  //
  static const Color primaryColorAccent = Color(0xff0c0c0c);
  //
  static const Color onPrimaryColor = Color(0xfffafafa);
  //
  // The lowest the suffix the darkest
  static const Color secondaryColor1 = Color(0xff4e4e4e);
  //
  static const Color secondaryColor2 = Color(0xff777777);
  //
  static const Color secondaryColor3 = Color(0xffa2a2a2);
  //
  static const Color greenColor = Color(0xff13ce66);
  //
  static const Color redColor = Color(0xffff4b4e);
  //
  static const Color errorColor = Color(0xffb00020);
  //
  static Color splashColor = const Color(0xFFF5F5F5).withOpacity(0.3);
  //
}
