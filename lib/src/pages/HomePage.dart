
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



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
        body:Stack(
          children:[
           GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(10.954129, -74.793690),
              zoom: 13.0,
              ) ,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 30, 10, 0),
           
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logo.png'),
                alignment: Alignment.topRight,
                )
              ),
            )

          ]
        ),
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
          label: 'Robo',
          ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.traffic,
            size: 40,
          ),
          label: 'Trafico',
          ),
      ],
    );
  }

  
  
}