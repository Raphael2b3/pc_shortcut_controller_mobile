import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pc_shortcut_controller_mobile/constants/styles.dart';
import 'package:pc_shortcut_controller_mobile/states/app_state.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final StatefulNavigationShell navShell;
  final GoRouterState goRouterState;
  Home({Key? key, required this.navShell, required this.goRouterState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.hintergrund,
      body: Container(
          padding: const EdgeInsets.all(9),
          child: ChangeNotifierProvider(
              create: (context) => AppState(), builder: (_, __) => navShell)),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.mittelgrund,
        selectedItemColor: AppColors.highattention,
        unselectedItemColor: AppColors.lowattention,
        currentIndex: navShell.currentIndex,
        onTap: (index) => navShell.goBranch(
          index,
          initialLocation: index == navShell.currentIndex,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_3x3),
            label: "Buttons",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
