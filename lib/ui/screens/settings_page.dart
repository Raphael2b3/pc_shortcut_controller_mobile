import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pc_shortcut_controller_mobile/constants/styles.dart';
import 'package:pc_shortcut_controller_mobile/models/setting.dart';
import 'package:pc_shortcut_controller_mobile/states/app_state.dart';
import 'package:pc_shortcut_controller_mobile/ui/widgets/inputs/buttons/addbutton.dart';
import 'package:pc_shortcut_controller_mobile/ui/widgets/inputs/buttons/votebutton.dart';
import 'package:pc_shortcut_controller_mobile/ui/widgets/modelviews/setting_view.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appstate = Provider.of<AppState>(context);
    print(appstate.buttonsettings.length);
    return Column(
      children: [
        Votebutton(
            onClick: () {
              appstate.storeAll();
            },
            text: "Save All"),
        SettingView(
          setting: appstate.portsetting,
          lockedname: true,
        ),
        SettingView(
          setting: appstate.ipsetting,
          lockedname: true,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 25, left: 16, right: 16, bottom: 25),
              alignment: Alignment.center,
              child: const Text(
                "Buttons",
                style: TextStyles.highlighted,
              ),
            ),
            AddButton(onPressed: () {
              appstate.buttonsettings.add(Setting(name: "new", value: "0"));
              appstate.updateButtonsFromSettings();
            }),
          ],
        ),
        const Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(
            "Setting Name",
            style: TextStyles.hintText,
          ),
          Text("Setting Value", style: TextStyles.hintText)
        ]),
        Expanded(
          child: ListView(
            children: appstate.buttonsettings
                .map<SettingView>((e) => SettingView(
                      setting: e,
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
