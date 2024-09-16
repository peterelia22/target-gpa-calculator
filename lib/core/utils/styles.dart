import 'package:flutter/material.dart';

class Styles {
  static const TextStyle style28 = TextStyle(
    color: Colors.white,
    fontSize: 28,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w700,
    //  height: 0.04,
  );
  static const TextStyle style16Medium = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w500,
  );
  static const TextStyle style20Medium = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w500,
  );
  static const TextStyle style16Regular = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w400,
    height: 0.09,
  );
  static const TextStyle style16Bold = TextStyle(
    color: Color(0xFFF7F9FC),
    fontSize: 16,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w700,
  );
  static LinearGradient darkGradient = LinearGradient(
    colors: [Colors.black, const Color.fromARGB(255, 8, 38, 83)!],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
