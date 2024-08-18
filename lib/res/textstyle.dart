import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontStyles {
  var height;
  var color;
  FontStyles({required this.height, this.color});
  TextStyle get normal => 
  GoogleFonts.jost(
     fontSize: height,
      color: color ?? Colors.white,
      letterSpacing: 1.35,
      height: 1.25
  );
  TextStyle get bold => GoogleFonts.jost(
     fontSize: height,
      color: color ?? Colors.white,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
      height: 1
  );
  
  // TextStyle(
  //     fontFamily: 'SF Pro Display',
  //     fontSize: height,
  //     color: color ?? Colors.white,
      // fontWeight: FontWeight.w700,
      // letterSpacing: 1.5,
      // height: 1);
// TextStyle get normal => TextStyle(fontFamily: 'SF Pro Display',fontSize: height,color: color);
}
