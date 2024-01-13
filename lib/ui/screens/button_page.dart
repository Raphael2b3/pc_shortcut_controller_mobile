import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pc_shortcut_controller_mobile/services/udp_service.dart';
import 'package:pc_shortcut_controller_mobile/states/app_state.dart';
import 'package:pc_shortcut_controller_mobile/ui/widgets/inputs/buttons/addbutton.dart';
import 'package:pc_shortcut_controller_mobile/ui/widgets/modelviews/remote_button_view.dart';
import 'package:provider/provider.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appstate = Provider.of<AppState>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: FutureProvider(
            lazy: false,
            updateShouldNotify: (previous, current) {
              return true;
            },
            create: (BuildContext context) => UdpService.create(),
            initialData: UdpService(),
            child: ListView(
              children: appstate.buttons
                  .map<Widget>((e) => RemoteButtonView(
                        remoteButton: e,
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
