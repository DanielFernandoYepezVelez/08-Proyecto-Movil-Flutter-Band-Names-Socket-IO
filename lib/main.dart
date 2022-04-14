import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:band_names/services/socket.dart';

/* Screens */
import 'package:band_names/screens/screens.dart';

void main() => runApp(const AppState());

/* Este Es El Primer Widget Que Se va A Crear, Es Decir,
Después De Este Widget En Adelante, En Todos Los Widgets 
Que Yo Quiera Tengo Acceso A Esta Misma Instancia De 
SocketService */
class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SocketService()),
        // ChangeNotifierProvider(create: (_) => ActorProvider(), lazy: false),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'home',
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      routes: {
        'home': (_) => HomeScreen(),
        'status': (_) => StatusScreen(),
      },
    );
  }
}
