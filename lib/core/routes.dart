import 'package:flutter/widgets.dart';
import '../pages/about_page.dart';
import '../pages/contact_page.dart';
import '../pages/home_page.dart';
import '../pages/projects_page.dart';

class AppRoute {
  const AppRoute(this.path, this.label, this.page);
  final String path, label;
  final Widget Function() page;
}

/// To add a page: create it in lib/pages/, then add one line here.
/// It gets a URL and a nav link automatically (Home is the logo link).
final appRoutes = <AppRoute>[
  AppRoute('/', 'Home', () => const HomePage()),
  AppRoute('/projects', 'Projects', () => const ProjectsPage()),
  AppRoute('/about', 'About', () => const AboutPage()),
  AppRoute('/contact', 'Contact', () => const ContactPage()),
];
