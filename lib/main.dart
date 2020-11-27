import 'package:conductor/src/blocs/provider.dart';
import 'package:conductor/src/pages/HomePage.dart';

import 'package:conductor/src/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
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
        initialRoute: 'home',
        routes: {
          'splashScreen':(BuildContext context)=>SplashScreen(),
          'home' :(BuildContext context)=>HomePage()
        },
      ),
    );
  }
}
