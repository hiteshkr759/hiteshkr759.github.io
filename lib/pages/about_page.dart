import 'package:flutter/material.dart';
import '../components/app_card.dart';
import '../components/page_section.dart';
import '../core/content.dart';
import '../core/theme.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final p = Palette.of(context);
    return PageSection(
      top: 96,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SectionHeading('About'),
        AppCard(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(aboutText, style: ts(context, 18, h: 1.6)),
            const SizedBox(height: 20),
            Wrap(spacing: 8, runSpacing: 8, children: [
              for (final s in skills)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      color: p.bg, borderRadius: BorderRadius.circular(999)),
                  child: Text(s, style: ts(context, 15)),
                ),
            ]),
          ]),
        ),
      ]),
    );
  }
}
