import 'package:url_launcher/url_launcher.dart';

// ───────── Edit your content here ─────────
const name = 'Your Name';
const tagline = 'I design and build things.';
const intro =
    'Write one or two sentences about what you do and the work you are looking for.';
const aboutText =
    'Write a short paragraph about yourself: your background, what you enjoy working on, and what you are learning now.';
const skills = ['Skill one', 'Skill two', 'Skill three', 'Skill four'];
const email = 'you@example.com';
const githubUrl = 'https://github.com/hiteshkr759';

const projects = [
  Project('Project one', 'One sentence on what it does and why you built it.',
      'Flutter, Dart', githubUrl),
  Project('Project two', 'One sentence on what it does and why you built it.',
      'Python, Flask', githubUrl),
  Project('Project three', 'One sentence on what it does and why you built it.',
      'C++, Arduino', githubUrl),
  Project('Project four', 'One sentence on what it does and why you built it.',
      'React, Node.js', githubUrl),
];
// ──────────────────────────────────────────

class Project {
  const Project(this.title, this.description, this.tags, this.url);
  final String title, description, tags, url;
}

Future<void> openUrl(String url) => launchUrl(Uri.parse(url));
