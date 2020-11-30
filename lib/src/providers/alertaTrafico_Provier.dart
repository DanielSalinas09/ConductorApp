
import 'package:conductor/src/preferencias_usuario/preferenciasUsuario.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
 
  class AlertTraficProvider{

    
    
   Future<String> pedirDatosAlert(String message) async {
    final _prefs = new PreferenciasUsuario();
    var now = new DateTime.now();
    var formatter = new DateFormat("yyyy-MM-dd");
    var formHora = new DateFormat("HH-mm");
    String formatHora = formHora.format(now);
    String formattedDate = formatter.format(now);
    String placa =_prefs.placa;
    String url = 'https://onny-bus.herokuapp.com/api/notificaciones/retrazo';
    var respuesta = await http.post(url, 
    headers:{"x-access-token" :_prefs.token},
    body: {
      "bus": placa,
      "message":message,
      "fecha":formattedDate,
      "hora":formatHora,
    });
    print(respuesta.body);
  }
  
 }
 