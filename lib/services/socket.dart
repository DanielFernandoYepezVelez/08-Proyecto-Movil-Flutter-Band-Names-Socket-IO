import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { Online, Offline, Connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  late IO.Socket _socket;

  ServerStatus get serverStatus => this._serverStatus;

  IO.Socket get socket => this._socket;
  Function get emit => this._socket.emit;

  SocketService() {
    this._initConfig();
  }

  void _initConfig() {
    // Dart client
    String urlSocket = 'http://192.168.1.8:3000';

    this._socket = IO.io(
        urlSocket,
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .enableAutoConnect() // disable auto-connection
            .setExtraHeaders({'foo': 'bar'}) // optional
            .build());

    /* Estado Conectado */
    this._socket.onConnect((_) {
      this._serverStatus = ServerStatus.Online;
      print('connect Por Socket');
      notifyListeners();
    });

    /* Estado Desconectado */
    this._socket.onDisconnect((_) {
      this._serverStatus = ServerStatus.Offline;
      print('Desconectado Por Socket Sever');
      notifyListeners();
    });
  }
}
