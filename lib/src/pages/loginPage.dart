import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/fondo.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.blue[300].withOpacity(0.29), BlendMode.hardLight)
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 60),
                  Center(
                      child: Image(
                    image: AssetImage('assets/logo.png'),
                  )),
                  SizedBox(height: 30),
                  Expanded(
                    child: Container(
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
                              'Bienvenido',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                                fontFamily: 'Raleway',
                              ),
                            ),
                            Text(
                              'Ingrese su cuenta',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.grey[500]),
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
                            _input(),
                            SizedBox(height: 15),
                            Text(
                              'Contraseña',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 15),
                            _input(),
                            SizedBox(height: 20),
                            _button(),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ));
  }
  Widget _button(){
    return Center(
      child: RaisedButton(
        padding: EdgeInsets.symmetric(vertical:10,horizontal:60) ,
        onPressed:(){},
        color: Colors.blue[300],
        shape: RoundedRectangleBorder(
          borderRadius:  BorderRadius.circular(60),
          ),
        child: Text(
          'Ingresar',
          style: TextStyle(
            
            fontSize: 30,
            color: Colors.white
            ),
        ),

         
        ),
    );
  }

  
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
          ),
        )
      ],
    ),
  );
}
