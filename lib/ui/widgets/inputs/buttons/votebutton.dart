import 'package:flutter/material.dart';
import 'package:pc_shortcut_controller_mobile/constants/styles.dart';

class Votebutton extends StatelessWidget {
  final Color? color;
  final String text;
  final void Function() onClick;

  const Votebutton(
      {super.key,
      this.color = AppColors.highattention,
      this.text = "",
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Material(
        shadowColor: Colors.black,
        elevation: 6,
        borderRadius: BorderRadius.circular(10),
        color: color,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onClick,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            alignment: Alignment.center,
            child: Text(text, style: TextStyles.small),
          ),
        ));
  }
}
