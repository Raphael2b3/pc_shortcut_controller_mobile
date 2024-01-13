import 'package:localstorage/localstorage.dart';
import 'package:pc_shortcut_controller_mobile/models/setting.dart';

List<Setting> getButtonSettingsfromStorage() {
  final storage = LocalStorage('AppSettings');
  List<Setting> settings = [];

  if (storage.getItem('buttons') != null) {
    List<dynamic> storedSettings = storage.getItem('buttons');
    settings = storedSettings
        .map((data) => Setting(
              name: data['name'],
              value: data['value'],
            ))
        .toList();
  }

  return settings;
}

void storeButtonSettingsToStorage(List<Setting> settings) {
  final storage = LocalStorage('AppSettings');
  List<dynamic> storedSettings = settings
      .map((setting) => {'name': setting.name, 'value': setting.value})
      .toList();
  storage.setItem('buttons', storedSettings);
}

Setting getPortfromStorage() {
  final storage = LocalStorage('AppSettings');
  return Setting(
      value: storage.getItem('port').toString() ?? "0", name: 'port');
}

void storePortToStorage(String port) {
  final storage = LocalStorage('AppSettings');
  storage.setItem('port', port);
}
