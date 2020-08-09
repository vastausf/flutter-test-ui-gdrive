import 'package:flutter/cupertino.dart';

class ProjectFonts {
  static TextStyle normalRegular({Color color}) =>
      TextStyle(fontFamily: "Poppins-Regular", fontSize: 16, color: color);

  static TextStyle smallRegular({Color color}) =>
      TextStyle(fontFamily: "Poppins-Regular", fontSize: 14, color: color);

  static TextStyle normalSemibold({Color color}) =>
      TextStyle(fontFamily: "Poppins-Semibold", fontSize: 16, color: color);

  static TextStyle largeSemibold({Color color}) =>
      TextStyle(fontFamily: "Poppins-Semibold", fontSize: 20, color: color);

  static TextStyle normalMedium({Color color}) =>
      TextStyle(fontFamily: "Poppins-Medium", fontSize: 16, color: color);

  static TextStyle mediumSemibold({Color color}) =>
      TextStyle(fontFamily: "Poppins-Semibold", fontSize: 18, color: color);
}
