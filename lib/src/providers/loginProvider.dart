

import 'package:http/http.dart' as http;

class UsuarioProvider{

  Future <String> login(String cc, String password) async{

    
    int _cc = int.parse(cc);
    print(_cc);
    print(password);
    final String url ='https://onny-bus.herokuapp.com/api/conductor/login';
    final resp = await http.post(url,
    body: {
      'cc':cc,
      'password':password,
    }
    
    );
    print(resp.body);
    return resp.body;
    

  }

}