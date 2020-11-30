


import 'dart:async';

class Validators{


  final validarPassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password,sink){

      if(password.length>=4){
        sink.add(password);
      }else{
        sink.addError('Mas de 4 caracteres');
      }

    }
  ) ;


  final validarCc = StreamTransformer<String, String>.fromHandlers(
    handleData: (cc,sink){

      if(cc.length>=7){
        sink.add(cc);
        
      }else{
        sink.addError('Mas de 7 numeros');
      }

    }
  ) ;
}