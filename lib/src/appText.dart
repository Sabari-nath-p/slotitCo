import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class appText {
  static Widget primaryText(
      {required var text,
      int? maxLines,
      FontWeight? fontWeight,
      Color? color,
      double? fontSize}) {
    return Text(
      text ?? "--:--",
      maxLines: maxLines,
      style: GoogleFonts.poppins(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color ?? Color(0xFF262626)),
    );
  }
}
