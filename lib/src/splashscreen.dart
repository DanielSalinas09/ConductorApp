
import 'package:conductor/src/pages/loginPage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 4000),()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage(),),),);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/fondo.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.blue[300].withOpacity(0.29), BlendMode.hardLight)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  heightFactor: 1.4,
                  child: Image(
                    image: AssetImage('assets/logo.png'),
                    width: 286,
                  )),
              Text(
                'Viajar esta en tus manos',
                style: TextStyle(fontSize: 18, fontFamily: "Raleway"),
              ),
              Spacer(
                flex: 3,
              ),
              CircularProgressIndicator(),
              Spacer()
            ],
          )),
    );
  }
}
