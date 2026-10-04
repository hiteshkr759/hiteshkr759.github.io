import 'package:flutter/material.dart';
import '../components/page_section.dart';
import '../components/project_card.dart';
import '../core/content.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) => PageSection(
        top: 96,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SectionHeading('Projects'),
          ProjectGrid(projects),
        ]),
      );
}
