import 'package:conductor/src/blocs/provider.dart';
import 'package:conductor/src/providers/usuario_Provider.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final usuarioProvider = new UsuarioProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _fondo(),
          _logo(),
          _form(context),
        ],
      ),
    );
  }

  Widget _logo() {
    return Container(
      child: Center(
          heightFactor: 1.4,
          child: Image(
            image: AssetImage('assets/logo.png'),
            width: 286,
          )),
    );
  }

  Widget _form(BuildContext context) {
    final bloc = Provider.of(context);
    return SingleChildScrollView(
        child: Column(
      children: [
        SafeArea(
            child: Container(
          height: 380.0,
        )),
        Container(
          height: 450,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(55), topRight: Radius.circular(55))),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bienvenido',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 38,
                    fontFamily: 'Raleway',
                  ),
                ),
                Text(
                  'Ingrese su cuenta',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 20, color: Colors.grey[500]),
                ),
                SizedBox(height: 30),
                Text(
                  'Cedula Ciudadana',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 15),
                _inputCC(bloc),
                SizedBox(height: 15),
                Text(
                  'Contraseña',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 15),
                _inputPass(bloc),
                SizedBox(height: 20),
                _button(bloc)
              ],
            ),
          ),
        ),
      ],
    ));
  }

  Widget _fondo() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/fondo.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.blue[300].withOpacity(0.29), BlendMode.hardLight)),
      ),
    );
  }

  Widget _inputCC(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.ccStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: BorderRadius.circular(60),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(185, 185, 185, .3),
                      blurRadius: 20,
                      offset: Offset(0, 10))
                ]),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: TextField(
                      keyboardType: TextInputType.number,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                          border: InputBorder.none, errorText: snapshot.error),
                      onChanged: (valor) => bloc.changeCc(valor)),
                ),
              ],
            ),
          );
        });
  }

  Widget _inputPass(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.passwordStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: BorderRadius.circular(60),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(185, 185, 185, .3),
                      blurRadius: 20,
                      offset: Offset(0, 10))
                ]),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, errorText: snapshot.error),
                    obscureText: true,
                    onChanged: (valor) => bloc.changePassword(valor),
                  ),
                )
              ],
            ),
          );
        });
  }

  Widget _button(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.formValidStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Center(
            child: RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
              onPressed: snapshot.hasData ? ()=>_login(bloc, context):null,
              color: Colors.blue[300],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
              ),
              child: Text(
                'Ingresar',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          );
        });
  }



  _login(LoginBloc bloc, BuildContext context) async{
    Map info =await usuarioProvider.login(bloc.cc, bloc.password);
    if(info['ok']){
      Navigator.pushReplacementNamed(context, 'home');
    }else{
      _mostrarAlert(context,info['mensaje']);
    }  
  }

  void _mostrarAlert(BuildContext context, String mensaje) {
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text('Informacion incorrecta',
           style: TextStyle(fontSize: 25),
          ),
          content: Text(mensaje,
          style: TextStyle(fontSize: 18),),
          actions: [
            FlatButton(
              child: Text('Ok',style: TextStyle(fontSize: 20)),
              onPressed:()=>Navigator.of(context).pop(), 
              )
          ],
          );
      }
      );
  }
}
