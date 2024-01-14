import 'dart:io';

class UdpService {
  RawDatagramSocket? sender;

  static Future<UdpService> create() async {
    var udpService = UdpService();
    print("Creating UDP Service");
    udpService.sender =
        await RawDatagramSocket.bind(InternetAddress.anyIPv4, 31103)
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

    var data = int.parse(value);
    var dataLength =
        sender!.send([data], InternetAddress(ipadr), int.parse(port));

    print("$dataLength bytes sent via port $port to host $ipadr");
  }

  void dispose() {
    sender?.close();
  }
}
