

import 'package:conductor/src/preferencias_usuario/preferenciasUsuario.dart';
import 'package:http/http.dart' as http;

class UbicacionProvider{


  Future<double> enviarUbicacion(double latitud, double longitud) async{
    String _latitud = latitud.toString();
    String _longitud = longitud.toString();
    
    final _prefs = new PreferenciasUsuario();
    final String _url ='https://onny-bus.herokuapp.com/api/conductor/update/ubicacion';
   var resp = await http.post(_url,
   headers:{"x-access-token" :_prefs.token},
    body: {
      'id':_prefs.id,
      'latitud':_latitud,
      'longitud':_longitud,
    }
    );
    


  }



}