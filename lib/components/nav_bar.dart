import 'dart:ui' show ImageFilter;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/content.dart';
import '../core/routes.dart';
import '../core/theme.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key, required this.location});
  final String location;

  @override
  Widget build(BuildContext context) {
    final p = Palette.of(context);
    final narrow = isNarrow(context);
    final items = appRoutes.where((r) => r.path != '/').toList();
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
        child: Container(
          height: 52,
          decoration: BoxDecoration(
            color: p.bg.withValues(alpha: 0.72),
            border: Border(
                bottom: BorderSide(
                    color: p.muted.withValues(alpha: 0.25), width: 0.5)),
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 980),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: narrow ? 20 : 40),
                child: Row(children: [
                  InkWell(
                    onTap: () => context.go('/'),
                    child: Text(name,
                        style: ts(context, 17, w: FontWeight.w600)),
                  ),
                  const Spacer(),
                  if (narrow)
                    PopupMenuButton<String>(
                      icon: Icon(Icons.menu_rounded, color: p.text),
                      tooltip: 'Menu',
                      onSelected: context.go,
                      itemBuilder: (_) => [
                        for (final r in items)
                          PopupMenuItem(value: r.path, child: Text(r.label)),
                      ],
                    )
                  else
                    for (final r in items)
                      TextButton(
                        onPressed: () => context.go(r.path),
                        child: Text(r.label,
                            style: ts(context, 15,
                                color: location == r.path ? p.text : p.muted,
                                w: location == r.path
                                    ? FontWeight.w600
                                    : FontWeight.w400)),
                      ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
