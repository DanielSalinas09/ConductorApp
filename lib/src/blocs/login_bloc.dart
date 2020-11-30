
import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:conductor/src/blocs/validarLogin.dart';

class LoginBloc with Validators{

  final _ccController       = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  
  Function(String) get changeCc          =>_ccController.sink.add;
  Function(String) get changePassword =>_passwordController.sink.add;

  Stream<String>   get ccStream       => _ccController.stream.transform(validarCc);
  Stream<String>get passwordStream => _passwordController.stream.transform(validarPassword);

  Stream<bool> get formValidStream => Rx.combineLatest2(ccStream, passwordStream, (c, p) => true);

  String get cc       => _ccController.value;
  String get password => _passwordController.value;

  dispone(){
    _ccController?.close();
    _passwordController?.close();
  }
}