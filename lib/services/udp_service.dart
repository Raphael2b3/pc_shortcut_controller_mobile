import 'dart:io';

import 'package:udp/udp.dart';

class UdpService {
  UDP? sender;

  static Future<UdpService> create() async {
    var udpService = UdpService();
    print("Creating UDP Service");
    udpService.sender = await UDP
        .bind(Endpoint.any(port: const Port(31103)))
        .catchError(() => print("============= Error"));
    print("Created UDP Service");

    return udpService;
  }

  Future<void> sendIntegerViaUDP(
      String value, String port, String ipadr) async {
    if (sender == null) {
      print("Sender is null");
      return;
    }

    // send a simple string to a broadcast endpoint on port 65001.
    var dataLength = await sender!.send([int.parse(value)],
        Endpoint.unicast(InternetAddress(ipadr), port: Port(int.parse(port))));

    print("$dataLength bytes sent via port $port to host $ipadr");
  }

  void dispose() {
    sender?.close();
  }
}
