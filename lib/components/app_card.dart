import 'package:flutter/material.dart';
import '../core/theme.dart';

class AppCard extends StatefulWidget {
  const AppCard({super.key, required this.child, this.onTap});
  final Widget child;
  final VoidCallback? onTap;

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final card = AnimatedScale(
      scale: _hover ? 1.015 : 1,
      duration: motion(context, 200),
      curve: Curves.easeOut,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
            color: Palette.of(context).card,
            borderRadius: BorderRadius.circular(24)),
        child: widget.child,
      ),
    );
    if (widget.onTap == null) return card;
    return Semantics(
      button: true,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        child: GestureDetector(onTap: widget.onTap, child: card),
      ),
    );
  }
}
