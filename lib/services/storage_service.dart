import 'package:localstorage/localstorage.dart';
import 'package:pc_shortcut_controller_mobile/models/setting.dart';

class StorageService {
  static final _storage = LocalStorage('AppSettings.json');

  static LocalStorage get storage => _storage;

  static Future<void> init() async {
    var rd = await storage.ready;
    if (rd) {
      print("storage ready");
    } else {
      print("storage not ready");
    }
  }
}

List<Setting> getButtonSettingsfromStorage() {
  var storage = StorageService.storage;
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

Future<void> storeButtonSettingsToStorage(List<Setting> settings) async {
  var storage = StorageService.storage;

  List<dynamic> storedSettings = settings
      .map((setting) => {'name': setting.name, 'value': setting.value})
      .toList();
  await storage
      .setItem('buttons', storedSettings)
      .catchError(() => print("error"));
}

Setting getPortfromStorage() {
  var storage = StorageService.storage;
  return Setting(
      value: storage.getItem('port').toString() ?? "0", name: 'port');
}

Future<void> storePortToStorage(String port) async {
  var storage = StorageService.storage;
  await storage.setItem('port', port).catchError(() => print("error"));
}

Setting getIpfromStorage() {
  var storage = StorageService.storage;
  return Setting(
      value: storage.getItem('ip').toString() ?? "255.255.255.255",
      name: 'host ip');
}

Future<void> storeIpToStorage(String ip) async {
  var storage = StorageService.storage;
  await storage.setItem('ip', ip).catchError(() => print("error"));
}
