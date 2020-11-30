import 'package:conductor/src/blocs/provider.dart';
import 'package:conductor/src/pages/HomePage.dart';
import 'package:conductor/src/preferencias_usuario/preferenciasUsuario.dart';

import 'package:conductor/src/splashscreen.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Conductor',
        debugShowCheckedModeBanner: false,
        initialRoute: 'splashScreen',
        routes: {
          'splashScreen':(BuildContext context)=>SplashScreen(),
          'home' :(BuildContext context)=>HomePage()
        },
      ),
    );
  }
}
