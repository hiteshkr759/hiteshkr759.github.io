import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'components/app_shell.dart';
import 'core/content.dart';
import 'core/routes.dart';
import 'core/theme.dart';

final _router = GoRouter(routes: [
  ShellRoute(
    builder: (context, state, child) =>
        AppShell(location: state.uri.path, child: child),
    routes: [
      for (final r in appRoutes)
        GoRoute(
          path: r.path,
          pageBuilder: (context, state) => NoTransitionPage(child: r.page()),
        ),
    ],
  ),
]);

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: '$name – Portfolio',
        debugShowCheckedModeBanner: false,
        theme: buildTheme(Brightness.light),
        darkTheme: buildTheme(Brightness.dark),
        themeMode: ThemeMode.system,
        routerConfig: _router,
      );
}
