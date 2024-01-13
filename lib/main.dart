import 'package:flutter/material.dart';
import 'package:pc_shortcut_controller_mobile/services/storage_service.dart';
import 'package:pc_shortcut_controller_mobile/ui/pc_shortcut_controller_mobile.dart';

import 'package:flutter/material.dart';

import 'package:localstorage/localstorage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init();
  var settings = getButtonSettingsfromStorage();
  print(settings);

  runApp(const WritingLyricsMadeComfortable());
}
