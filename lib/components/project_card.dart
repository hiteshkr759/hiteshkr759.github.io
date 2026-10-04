import 'package:flutter/material.dart';
import '../core/content.dart';
import '../core/theme.dart';
import 'app_card.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard(this.project, {super.key});
  final Project project;

  @override
  Widget build(BuildContext context) {
    final p = Palette.of(context);
    return AppCard(
      onTap: () => openUrl(project.url),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(project.title,
            style: ts(context, 24, w: FontWeight.w600, ls: -0.5)),
        const SizedBox(height: 8),
        Text(project.description,
            style: ts(context, 17, color: p.muted, h: 1.5)),
        const SizedBox(height: 16),
        Text(project.tags, style: ts(context, 14, color: p.muted)),
        const SizedBox(height: 16),
        Text('View on GitHub',
            style: ts(context, 16, w: FontWeight.w500, color: p.link)),
      ]),
    );
  }
}

/// One column on phones, two on wider screens.
class ProjectGrid extends StatelessWidget {
  const ProjectGrid(this.items, {super.key});
  final List<Project> items;

  @override
  Widget build(BuildContext context) => LayoutBuilder(builder: (context, box) {
        final cols = box.maxWidth >= 720 ? 2 : 1;
        const gap = 20.0;
        final w = (box.maxWidth - gap * (cols - 1)) / cols;
        return Wrap(spacing: gap, runSpacing: gap, children: [
          for (final pr in items) SizedBox(width: w, child: ProjectCard(pr)),
        ]);
      });
}
