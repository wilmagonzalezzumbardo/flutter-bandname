import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:band_names/services/socket_service.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ServerStatus: ${socketService.serverStatus}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: () {
          socketService.socket.emit('emitir-mensaje', {
            'nombre': 'wilma desde flutter',
            'mensaje': 'Hola mundo desde flutter'
          });
        },
      ),
      /*
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.pedal_bike),
        onPressed: () {
          socketService.emit('emitir-mensaje, boton 2', {
            'nombre': 'wilma desde flutter boton 2',
            'mensaje': 'Hola mundo desde flutter boton 2 '
          });
        },
      ),
      */
    );
  }
}
