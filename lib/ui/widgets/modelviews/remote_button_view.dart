import 'package:flutter/material.dart';
import 'package:pc_shortcut_controller_mobile/models/remote_button.dart';
import 'package:pc_shortcut_controller_mobile/services/udp_service.dart';
import 'package:pc_shortcut_controller_mobile/states/app_state.dart';
import 'package:pc_shortcut_controller_mobile/ui/widgets/inputs/buttons/cathegorybutton.dart';
import 'package:provider/provider.dart';

class RemoteButtonView extends StatelessWidget {
  final RemoteButton remoteButton;
  const RemoteButtonView({super.key, required this.remoteButton});

  @override
  Widget build(BuildContext context) {
    var udpService = Provider.of<UdpService>(context);
    var appstate = Provider.of<AppState>(context);

    void send() {
      udpService
          .sendIntegerViaUDP(remoteButton.id, appstate.portsetting.value,
              appstate.ipsetting.value)
          .whenComplete(() => print("sent"));
    }

    return CathegoryButton(
        onClick: send,
        text: remoteButton.text.isNotEmpty
            ? remoteButton.text
            : "(Unknown value:${remoteButton.id})");
  }
}
