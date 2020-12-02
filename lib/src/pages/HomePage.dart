import 'dart:async';
import 'package:conductor/src/preferencias_usuario/preferenciasUsuario.dart';
import 'package:conductor/src/providers/alertaRobo_provider.dart';
import 'package:conductor/src/providers/alertaTrafico_Provier.dart';
import 'package:conductor/src/providers/ruta_provider.dart';
import 'package:conductor/src/providers/ubicacacion_Provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as lc;
import 'package:permission_handler/permission_handler.dart';
import 'trafficPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

const default_location =LatLng(10.865981, -74.831712);
class _HomePageState extends State<HomePage> {
  final enviarUbicacion= new UbicacionProvider();
  final _prefs = new PreferenciasUsuario();
  final alerta = new AlertTraficProvider();
  final alertaRobo = new AlertaRoboProvider();
  final rutaProvider = new RutaProvider();


  int currentIndex = 0;
  Set<Polyline> polyline = Set<Polyline>();
  List<dynamic> rutas = [];
  lc.Location location;
  bool myLocationEnable = true;
  bool myLocationButtonEnable = true;
  LatLng currentLocation =default_location;
  List<LatLng> latlng = List();
  GlobalKey navBarGlobalKey = GlobalKey(debugLabel: 'bottomAppBar');
  GoogleMapController controller;

  //Para controlar la nueva posicion de la camara
  onMapCreated(GoogleMapController controller){
    this.controller=controller;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      requestPerms(); 
    });
  }

  //Permiso para que la aplicacion use la ubicacion
  requestPerms() async{
    Map<Permission,PermissionStatus> statuses = await[Permission.locationAlways].request();
    var status = statuses[Permission.locationAlways];
    if(status == PermissionStatus.denied){
      requestPerms();
    }else{
      enableGps();
    }
  }

  //Permiso para Activar el gps desde la aplicacion
  enableGps() async{
    location = lc.Location();
    bool servicesStatusResult = await location.requestService();

    if(!servicesStatusResult){
      enableGps();
    }else{
      updateStatus();
      getLocation();
      locationChanged();
      dibujarRutass();
      
    }
  }

  //Metodo para dibujar cada ruta
  dibujarRutass() {
    String ruta =_prefs.ruta;
    switch(ruta){
      case"D10 -4172 Malambo - via caracoli - centro":
        
        crearPolylineViaCaracoli();
        crearPolylineViaCaracoliReturn();
        
        break;
      case"D11 Malambo- calle 17 - zoologico":
        crearPolylineCalle17Ida();
        crearPolylineCalle17Return();
        break;
      default:  
    }
  }
  //RUTA VIA CARACOLI IDA
  crearPolylineViaCaracoli(){
    polyline.add(Polyline(
        polylineId: PolylineId("PolylineMap1"),
        zIndex: 2,
        color: Colors.blue,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        jointType: JointType.bevel,
        points: rutaProvider.viaCaracoliIda,
    )
    );
  }
  //RUTA VIA CARACOLI VUELTA
  crearPolylineViaCaracoliReturn(){
    polyline.add(Polyline(
        polylineId: PolylineId("PolylineMap2"),
        zIndex: 1,
        color: Colors.red,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        jointType: JointType.bevel,
        points: rutaProvider.viaCaracoliReturn,
    )
    );
  }
  //RUTA CALLE 17 IDA
  crearPolylineCalle17Ida(){
    polyline.add(Polyline(
        polylineId: PolylineId("PolylineMap3"),
        zIndex: 1,
        color: Colors.blue,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        jointType: JointType.bevel,
        points: rutaProvider.rutacalle17Ida,
    )
    );
  }

  //RUTA CALLE 17 VUELTA
  crearPolylineCalle17Return(){
    polyline.add(Polyline(
        polylineId: PolylineId("PolylineMap4"),
        zIndex: 2,
        color: Colors.red,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        jointType: JointType.bevel,
        points: rutaProvider.rutacalle17Return,
    )
    );
  }

  //Activar ubicacion en el mapa
  updateStatus(){
    setState(() {
      myLocationEnable=true;
      myLocationButtonEnable=true;
    });
  }
  //obtener localizacion 
  getLocation()async{
    var currentLocation= await location.getLocation();
    updateLocation(currentLocation);
    
  }

  //actualizar la ubicacion y mover la camara cuando se actualiza el la ubicacion
  updateLocation(currentLocation)async{
    if(currentLocation!=null){
      //Enviar mi ubicacion cada 3 segundos
      var timer =Timer(Duration(seconds: 3), ()=>enviarUbicacion.enviarUbicacion(currentLocation.latitude, currentLocation.longitude));

      setState(() {
        this.currentLocation=LatLng(currentLocation.latitude,currentLocation.longitude );
        this.controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
            target:this.currentLocation,
            zoom:19
            ),
          ));
      });
    }
  }
  // obtener la ubicacion constante del conducor
  locationChanged(){
    location.onLocationChanged.listen((lc.LocationData cLoc){
      if(cLoc!=null){
        updateLocation(cLoc);
        
      }
    });
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
        target: default_location,
        zoom: 12.6,
        
      ),
      minMaxZoomPreference: MinMaxZoomPreference(5,18),
      polylines: polyline,
      myLocationEnabled: myLocationEnable,
      myLocationButtonEnabled: myLocationButtonEnable,
      onMapCreated: onMapCreated,
      
    );
  }

  Widget _logoChild() {
    return Container(
      margin: EdgeInsets.fromLTRB(0,30, 10, 0),
      height: 100,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/logo.png'),
        alignment: Alignment.topLeft,
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
              FlatButton(child: Text('Enviar',style: TextStyle(fontSize: 20),), onPressed: () {
                alertaRobo.pedirDatosAlertRobo();
                Navigator.of(context).pop();
              }),
              
            ],
          );
        });
  }
  
}
