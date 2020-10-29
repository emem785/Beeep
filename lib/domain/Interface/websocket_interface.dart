import 'dart:async';

import 'package:beep/infrastructure/models/location.dart';
import 'package:web_socket_channel/io.dart';

abstract class WebSocketInterface {
  StreamSubscription<Location> sendLocationAsStreamWithSocket(IOWebSocketChannel channel);
  IOWebSocketChannel connect(String phoneNumber);
  Stream<Location> getUserLocationStreamWithSocket(String phoneNumber);
  bool closeSocketConnection(IOWebSocketChannel channel);
}
