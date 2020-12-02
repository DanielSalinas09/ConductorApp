import 'dart:convert';
import 'package:conductor/src/preferencias_usuario/preferenciasUsuario.dart';
import 'package:http/http.dart' as http;



class UsuarioProvider {

  
  Future <Map<String,dynamic>> login(String cc, String password) async {
    print(cc);
    print(password);
    final String url = 'https://onny-bus.herokuapp.com/api/conductor/login';
    final _prefs = new PreferenciasUsuario();
    
    var resp = await http.post(url, body: {
      'cc': cc,
      'password': password,
    });
    Map<String, dynamic> decodeResp = jsonDecode(resp.body);
    print(decodeResp);
    if (decodeResp['status']=='login correcto') {
      print(decodeResp['data']['token']);
      _prefs.token= decodeResp['data']['token'];
      _prefs.id=decodeResp['data']['conductor']['_id'];
      _prefs.placa = decodeResp['data']['bus'];
      _prefs.ruta = decodeResp['data']['ruta'];
       
      return {'ok': true, 'token': decodeResp['data']['token']};
    } else {
      return {'ok': false, 'mensaje': decodeResp['data']};
    }
  }
}
