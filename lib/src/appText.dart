import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class appText {
  static Widget primaryText(
      {required var text,
      int? maxLines,
      FontWeight? fontWeight,
      Color? color,
      TextDecoration? decoration,
      TextAlign align = TextAlign.center,
      double? fontSize}) {
    return Text(
      text ?? "--:--",
      maxLines: maxLines,
      textAlign: align,
      style: GoogleFonts.nunitoSans(
          fontWeight: fontWeight,
          fontSize: fontSize,
          decoration: decoration,
          color: color ?? Color(0xFF262626)),
    );
  }
}
