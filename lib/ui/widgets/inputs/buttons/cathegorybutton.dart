import 'package:flutter/material.dart';
import 'package:pc_shortcut_controller_mobile/constants/styles.dart';

class CathegoryButton extends StatelessWidget {
  final void Function() onClick;
  final String text;
  const CathegoryButton({super.key, required this.onClick, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.all(6),
      width: double.infinity,
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.highattention,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: AppColors.lowattention,
          onTap: () {
            onClick();
          },
          child: Container(
            alignment: Alignment.center,
            child: Text(text, style: TextStyles.header),
          ),
        ),
      ),
    );
  }
}
