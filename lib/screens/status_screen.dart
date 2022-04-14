import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:band_names/services/socket.dart';

class StatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Server Status: ${socketService.serverStatus}')],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: () {
          socketService.emit('emitir-mensaje', {
            'nombre': 'Flutter',
            'mensaje': 'Hola Desde Flutter',
          });
        },
      ),
    );
  }
}
