import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _RutaProvider{

  List<dynamic> rutas=[];

  

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/rutas.json');
      Map dataMap= json.decode(resp);
      print(dataMap['rutas']);
      rutas=dataMap['rutas'];
      rutas.forEach((opt) {
          print(opt['latitud']);
          print(opt['longitud']);
       });
      return rutas;
    }

  
}

final rutaProvider = new _RutaProvider();