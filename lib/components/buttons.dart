import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme.dart';

final _label = GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600);
const _pad = EdgeInsets.symmetric(horizontal: 28, vertical: 18);

class PillButton extends StatelessWidget {
  const PillButton(this.label, {super.key, required this.onPressed});
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
            backgroundColor: Palette.accent,
            foregroundColor: Colors.white,
            shape: const StadiumBorder(),
            padding: _pad,
            textStyle: _label),
        child: Text(label),
      );
}

class OutlinePillButton extends StatelessWidget {
  const OutlinePillButton(this.label, {super.key, required this.onPressed});
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final link = Palette.of(context).link;
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
          foregroundColor: link,
          side: BorderSide(color: link),
          shape: const StadiumBorder(),
          padding: _pad,
          textStyle: _label),
      child: Text(label),
    );
  }
}
