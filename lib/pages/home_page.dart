import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../components/buttons.dart';
import '../components/page_section.dart';
import '../components/project_card.dart';
import '../core/content.dart';
import '../core/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final p = Palette.of(context);
    final narrow = isNarrow(context);
    return Column(children: [
      PageSection(
        top: 96,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(tagline,
              style: ts(context, narrow ? 44 : 84,
                  w: FontWeight.w700, ls: narrow ? -1.5 : -3, h: 1.04)),
          const SizedBox(height: 24),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Text(intro, style: ts(context, 20, color: p.muted, h: 1.5)),
          ),
          const SizedBox(height: 32),
          PillButton('See my work', onPressed: () => context.go('/projects')),
        ]),
      ),
      PageSection(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SectionHeading('Featured'),
          ProjectGrid(projects.take(2).toList()),
        ]),
      ),
    ]);
  }
}
