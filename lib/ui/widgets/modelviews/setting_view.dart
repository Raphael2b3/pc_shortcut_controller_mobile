import 'package:flutter/material.dart';
import 'package:pc_shortcut_controller_mobile/constants/styles.dart';
import 'package:pc_shortcut_controller_mobile/models/setting.dart';
import 'package:pc_shortcut_controller_mobile/ui/widgets/inputs/default_textfield.dart';
import 'package:pc_shortcut_controller_mobile/ui/widgets/primitives/default_card.dart';

class SettingView extends StatelessWidget {
  final Setting setting;
  final bool lockedname;
  const SettingView({
    super.key,
    required this.setting,
    this.lockedname = false,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultRowCard(
      children: [
        if (lockedname)
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                setting.name.toUpperCase(),
                style: TextStyles.highlighted,
              ),
            ),
          )
        else
          DefaultTextField(
              defaultText: setting.name,
              hintText: "Name",
              onChange: (value) {
                setting.name = value;
              }),
        DefaultTextField(
            defaultText: setting.value,
            hintText: "Value",
            onChange: (value) {
              setting.value = value;
            }),
      ],
    );
  }
}
