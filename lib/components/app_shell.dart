import 'package:flutter/material.dart';
import '../core/content.dart';
import '../core/theme.dart';
import 'nav_bar.dart';
import 'page_section.dart';

/// Wraps every page: top nav, scrolling, and footer.
class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.location, required this.child});
  final String location;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final p = Palette.of(context);
    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
          key: ValueKey(location), // resets scroll position on page change
          child: Column(children: [
            const SizedBox(height: 52),
            child,
            PageSection(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 56),
                child: Text('© 2026 $name',
                    style: ts(context, 14, color: p.muted)),
              ),
            ),
          ]),
        ),
        Positioned(top: 0, left: 0, right: 0, child: NavBar(location: location)),
      ]),
    );
  }
}
