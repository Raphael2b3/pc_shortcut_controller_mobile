import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:pc_shortcut_controller_mobile/constants/styles.dart';
import 'package:pc_shortcut_controller_mobile/ui/screens/settings_page.dart';
import 'package:pc_shortcut_controller_mobile/ui/screens/home.dart';
import 'package:pc_shortcut_controller_mobile/ui/screens/button_page.dart';

class WritingLyricsMadeComfortable extends StatelessWidget {
  const WritingLyricsMadeComfortable({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: AppColors.mittelgrund,
    ));
    return SafeArea(
      child: MaterialApp.router(
        title: "Remote Hotkey Invoker",
        routerConfig: _routes,
        theme: ThemeData(
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: AppColors.primaryText, fontSize: 14),
          ),
        ),
      ),
    );
  }
}

final _routes = GoRouter(initialLocation: "/buttons", routes: [
  StatefulShellRoute.indexedStack(
      builder: (context, state, child) =>
          Home(navShell: child, goRouterState: state),
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
            name: "Buttons",
            path: "/buttons",
            builder: (context, state) => const ButtonPage(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            name: "Settings",
            path: "/settings",
            builder: (context, state) => const SettingsPage(),
          ),
        ]),
      ])
]);
