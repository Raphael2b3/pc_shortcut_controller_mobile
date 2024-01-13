import 'package:flutter/material.dart';
import 'package:pc_shortcut_controller_mobile/constants/styles.dart';

class AddButton extends StatelessWidget {
  final void Function() onPressed;
  const AddButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.mittelgrund,
            borderRadius: BorderRadius.circular(40),
          ),
          child: IconButton(
            alignment: Alignment.center,
            color: AppColors.primaryText,
            icon: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Add", style: TextStyles.small),
                Icon(Icons.add, color: AppColors.highattention),
              ],
            ),
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
