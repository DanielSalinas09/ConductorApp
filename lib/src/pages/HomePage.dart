import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        body:Center(child: Text('Hola Daniel'),),
        bottomNavigationBar: _crearBottomNavigationBar()

        ),
      );
    
  }

  Widget _crearBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.blue[300],
      fixedColor: Colors.white,
      currentIndex: _currentIndex,
      onTap: (index){
        setState(() {
          _currentIndex= index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications,
            size: 40,
            ),
          title: Text(
            'Robo',
            style: TextStyle(fontSize: 18),
            ),
          ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.traffic,
            size: 40,
          ),
          title: Text(
            'Trafico',
            style: TextStyle(fontSize: 18),
            )
          ),
      ],
    );
  }

  
  
}