import 'package:flutter/material.dart';
import 'package:pc_shortcut_controller_mobile/constants/styles.dart';

class DefaultCard extends StatelessWidget {
  final Widget child;
  const DefaultCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppColors.mittelgrund,
            borderRadius: BorderRadius.circular(9)),
        child: child);
  }
}

class DefaultRowCard extends StatelessWidget {
  final List<Widget> children;
  const DefaultRowCard({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppColors.mittelgrund,
            borderRadius: BorderRadius.circular(9)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: children,
        ));
  }
}
