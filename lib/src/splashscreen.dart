import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondo.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.blue[300].withOpacity(0.29), BlendMode.hardLight)
          ),
          
        ),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Image(
              image: AssetImage('assets/logo.png'),
              )
            )
          ],)
            

        ),
      );
    
  }
}
