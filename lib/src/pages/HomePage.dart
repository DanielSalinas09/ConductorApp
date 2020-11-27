import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'trafficPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  Set<Polyline> polyline = Set<Polyline>();
  List<dynamic> rutas = [];
  List<LatLng> latlng = List();
  GlobalKey navBarGlobalKey = GlobalKey(debugLabel: 'bottomAppBar');

  @override
  void initState() {
    super.initState();
    setState(() {
      crearPolylineDeparture();

      //crearPolylineDeparture();
    });
  }

  crearPolylineDeparture() {
    polyline.add(Polyline(
      polylineId: PolylineId("PolylineMap"),
      zIndex: 2,
      color: Colors.red,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      jointType: JointType.bevel,
      points: latlng,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          _crearMapa(),
          _logoChild(),
          _loadPage(currentIndex, context),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: ()=>_showAlert(context),
          child: Icon(Icons.notification_important),
        ),
        bottomNavigationBar: _crearBottomNavigationBar());
  }

Widget _principal() {
    return Container();
  }
  Widget _loadPage(int paginaActual, BuildContext context) {
    switch (paginaActual) {
      case 0:
        return _principal();
      case 1:
        return TrafficPage();
      default:
        return HomePage();
    }
  }

  

  

  Widget _crearBottomNavigationBar() {
    
    return CurvedNavigationBar(
      key: navBarGlobalKey,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 600),
      backgroundColor: Colors.white,
      color: Colors.blue[300],
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        Icon(
          Icons.map,
          size: 30,
        ),
        Icon(
          Icons.traffic,
          size: 30,
        ),
        
      ],
    );
  }

  
  Widget _crearMapa() {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(10.865981, -74.831712),
        zoom: 15.0,
      ),
      polylines: polyline,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
    );
  }

  Widget _logoChild() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 30, 10, 0),
      height: 100,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/logo.png'),
        alignment: Alignment.topRight,
      )),
    );
  }

  void _showAlert(BuildContext context) {
    
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Alerta de Robo',
              style: TextStyle(fontSize: 25),
              ),
            content: Text(
              '¿Esta seguro de Enviar esta alerta?',
              style: TextStyle(fontSize: 18),),
            actions: [
              FlatButton(child: Text('Cancelar',style: TextStyle(fontSize: 20),), onPressed:()=>Navigator.of(context).pop()),
              FlatButton(child: Text('Enviar',style: TextStyle(fontSize: 20),), onPressed: () {}),
              
            ],
          );
        });
  }
  
}
