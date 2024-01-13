import 'package:flutter/foundation.dart';
import 'package:pc_shortcut_controller_mobile/models/remote_button.dart';
import 'package:pc_shortcut_controller_mobile/models/setting.dart';
import 'package:pc_shortcut_controller_mobile/state_management/store_restore.dart';

class AppState with ChangeNotifier {
  // Define your properties here

  late List<RemoteButton> buttons;

  late List<Setting> buttonsettings;

  late Setting portsetting;

  // Constructor
  AppState() {
    buttonsettings = getButtonSettingsfromStorage();
    updateButtonsFromSettings(notify: false);
    portsetting = getPortfromStorage();
  }

  void updateButtonsFromSettings({bool notify = true}) {
    buttons = buttonsettings
        .map((setting) => RemoteButton(
              id: setting.value,
              text: setting.name,
            ))
        .toList();

    if (notify) {
      notifyListeners();
    }
  }

  void validate() {
    var toDelete = [];
    int i = 0;
    for (var button in buttonsettings) {
      if (int.tryParse(button.value) == null) {
        toDelete.insert(toDelete.length, i);
      }
      i++;
    }

    for (var index in toDelete) {
      buttonsettings.removeAt(index);
    }

    /// port validation

    if (int.tryParse(portsetting.value) == null) {
      portsetting.value = "2369";
    }
  }

  void storeAll() {
    validate();
    storeButtonSettingsToStorage(buttonsettings);
    storePortToStorage(portsetting.value);
    updateButtonsFromSettings();
  }
}
