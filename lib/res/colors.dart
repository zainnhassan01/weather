import 'package:flutter/material.dart';

class MyColor {
  static const Color home1 = Color(0xFFE79426);
  static const Color home2 = Color(0xFF42426A);
  static const Color home3 = Colors.black;
  static const Color search1 = Color(0xFF5624E4);
  static const Color search2 = Color(0xFF7748AA);
  static const Color search3 = Colors.black;

  static const LinearGradient gradient1 = LinearGradient(
      colors: [home1, home2, home3],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.15, 0.5, 0.75],
      tileMode: TileMode.clamp);
  static const gradient2 = LinearGradient(
      colors: [search1, search2, search3],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.15, 0.5, 0.75],
      tileMode: TileMode.clamp);
// static const search3 = Color(0xFF7748AA);
// static const search2 = Color(0xFF7748AA);
}
