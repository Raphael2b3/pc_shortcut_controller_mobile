import 'package:flutter/material.dart';
import 'package:pc_shortcut_controller_mobile/constants/styles.dart';

class ContentList extends StatelessWidget {
  const ContentList({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        backgroundColor: AppColors.hintergrund,
        color: AppColors.lowattention,
        onRefresh: () async => print("refresh"),
        child: ListView.builder(
          padding: const EdgeInsets.all(6),
          itemCount: 100,
          itemBuilder: (context, index) => const Text("geiler schei0"),
        ),
      ),
    );
  }
}
