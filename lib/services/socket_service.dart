import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { Online, Offline, Connecting, Message }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  IO.Socket _socket;

  IO.Socket get socket => this._socket;

  Function get emit => this._socket.emit;

  ServerStatus get serverStatus => this._serverStatus;

  SocketService() {
    this._initConfig();
  }

  void _initConfig() {
    print('en el initConfig');

    this._socket = IO.io('http://192.168.1.80:3001', {
      'transports': ['websocket'],
      'autoConnect': true,
    });
    print('paso 111');
    this._socket.on('connect', (_) {
      print('connect wilma...');
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
    });

    this._socket.on('disconnect', (_) {
      print('disconnect beatriz');
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });

    /*
    this._socket.on('emitir-mensaje', (payload) {
      print('nuevo mensaje....${payload}');
      print('nombre=>' + payload['nombre']);
      print('mensaje=>' + payload['mensaje']);
      print(payload.containsKey('mensaje2')
          ? 'mensaje2 => ' + payload['mensaje2']
          : 'mensaje2 => no hay datos');
      this._serverStatus = ServerStatus.Message;
      notifyListeners();
    });
    */
  }
}
