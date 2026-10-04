import 'package:flutter/material.dart';
import '../core/theme.dart';

/// Centers content, caps its width, and applies responsive side padding.
class PageSection extends StatelessWidget {
  const PageSection({super.key, required this.child, this.top = 80});
  final Widget child;
  final double top;

  @override
  Widget build(BuildContext context) {
    final side = isNarrow(context) ? 20.0 : 40.0;
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 980),
        child: Padding(
          padding: EdgeInsets.fromLTRB(side, top, side, 0),
          child: SizedBox(width: double.infinity, child: child),
        ),
      ),
    );
  }
}

class SectionHeading extends StatelessWidget {
  const SectionHeading(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 28),
        child: Text(text,
            style: ts(context, isNarrow(context) ? 32 : 44,
                w: FontWeight.w700, ls: -1)),
      );
}
