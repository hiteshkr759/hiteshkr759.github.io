import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Palette {
  const Palette._(
      {required this.bg,
      required this.card,
      required this.text,
      required this.muted,
      required this.link});
  final Color bg, card, text, muted, link;
  static const accent = Color(0xFF0071E3);
  static const light = Palette._(
      bg: Color(0xFFF5F5F7),
      card: Colors.white,
      text: Color(0xFF1D1D1F),
      muted: Color(0xFF6E6E73),
      link: Color(0xFF0066CC));
  static const dark = Palette._(
      bg: Color(0xFF000000),
      card: Color(0xFF1C1C1E),
      text: Color(0xFFF5F5F7),
      muted: Color(0xFFA1A1A6),
      link: Color(0xFF2997FF));
  static Palette of(BuildContext c) =>
      Theme.of(c).brightness == Brightness.dark ? dark : light;
}

TextStyle ts(BuildContext c, double size,
        {FontWeight w = FontWeight.w400,
        Color? color,
        double ls = 0,
        double h = 1.4}) =>
    GoogleFonts.inter(
        fontSize: size,
        fontWeight: w,
        color: color ?? Palette.of(c).text,
        letterSpacing: ls,
        height: h);

bool isNarrow(BuildContext c) => MediaQuery.sizeOf(c).width < 600;

Duration motion(BuildContext c, int ms) =>
    MediaQuery.disableAnimationsOf(c) ? Duration.zero : Duration(milliseconds: ms);

ThemeData buildTheme(Brightness b) => ThemeData(
      brightness: b,
      useMaterial3: true,
      scaffoldBackgroundColor:
          b == Brightness.dark ? Palette.dark.bg : Palette.light.bg,
    );
