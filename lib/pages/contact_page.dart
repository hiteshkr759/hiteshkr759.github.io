import 'package:flutter/material.dart';
import '../components/app_card.dart';
import '../components/buttons.dart';
import '../components/page_section.dart';
import '../core/content.dart';
import '../core/theme.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final p = Palette.of(context);
    return PageSection(
      top: 96,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SectionHeading('Contact'),
        AppCard(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Want to work together? Get in touch.',
                style: ts(context, 18, color: p.muted, h: 1.6)),
            const SizedBox(height: 20),
            Wrap(spacing: 12, runSpacing: 12, children: [
              PillButton('Email me', onPressed: () => openUrl('mailto:$email')),
              OutlinePillButton('GitHub', onPressed: () => openUrl(githubUrl)),
            ]),
          ]),
        ),
      ]),
    );
  }
}
