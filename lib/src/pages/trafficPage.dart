import 'package:conductor/src/providers/alertaTrafico_Provier.dart';
import 'package:flutter/material.dart';

class TrafficPage extends StatefulWidget {
  TrafficPage({Key key}) : super(key: key);

  @override
  _TrafficPageState createState() => _TrafficPageState();
}

class _TrafficPageState extends State<TrafficPage> {

  final _alerta = new AlertTraficProvider();
  String _message;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      SizedBox(height: 490, ),
      Container(
         
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(55),
                        topRight: Radius.circular(55))),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Trafico',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontFamily: 'Raleway',
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Mensaje',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(height: 15),
                      _input(),
                      SizedBox(height: 15),
                      _button(),
                    ],
                  ),
                ),
              ),
            ],
          )),
    ]);
  }

  Widget _button() {
    return RaisedButton(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      onPressed: ()=>_alerta.pedirDatosAlert(_message),
      color: Colors.blue[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(60),
      ),
      child: Text(
        'Enviar',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  Widget _input() {
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
              decoration: InputDecoration(border: InputBorder.none),
              onChanged: (valor) {
                setState(() {
                  _message = valor;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
