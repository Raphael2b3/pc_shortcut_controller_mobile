import 'dart:io';

import 'package:udp/udp.dart';

class UdpService {
  UDP? sender;

  static Future<UdpService> create() async {
    var udpService = UdpService();

    udpService.sender = await UDP.bind(Endpoint.any(port: const Port(31103)));

    return udpService;
  }

  Future<void> sendIntegerViaUDP(String value, String port) async {
    if (sender == null) return;

    // send a simple string to a broadcast endpoint on port 65001.
    var dataLength = await sender!.send(
        [int.parse(value)], Endpoint.broadcast(port: Port(int.parse(port))));

    stdout.write("$dataLength bytes sent.");
  }

  void dispose() {
    sender?.close();
  }
}
