import 'package:flutter/material.dart';
import 'package:pc_shortcut_controller_mobile/constants/styles.dart';
import 'package:pc_shortcut_controller_mobile/models/setting.dart';
import 'package:pc_shortcut_controller_mobile/ui/widgets/inputs/default_textfield.dart';
import 'package:pc_shortcut_controller_mobile/ui/widgets/primitives/default_card.dart';

class SettingView extends StatelessWidget {
  final Setting setting;
  final bool lockedname;
  final void Function(Setting) onDelete;
  SettingView({
    super.key,
    onDelete,
    required this.setting,
    this.lockedname = false,
  }) : onDelete = onDelete ?? ((_) {});

  @override
  Widget build(BuildContext context) {
    print("build settingview with ${setting.name}");
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
        if (!lockedname)
          //delete button
          IconButton(
            icon: const Icon(Icons.delete),
            color: AppColors.lowattention,
            onPressed: () {
              print("delete ${setting.name}");
              onDelete(this.setting);
            },
          ),
      ],
    );
  }
}
