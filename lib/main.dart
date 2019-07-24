import 'package:flutter/material.dart';
import 'login_page.dart';
import 'postedRides.dart';
//import 'display.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GettingStarted(),
    theme: ThemeData(
      
      primaryColor: Color(0xFF293b72),
      accentColor: Color(0xFFff2e7a),
      textTheme: TextTheme(
        display3: TextStyle(
            color: Colors.white,
            letterSpacing: 1.4,
            fontWeight: FontWeight.w800,
            fontSize: 30.0),
        body1:
            TextStyle(color: Colors.white, fontSize: 14.0, letterSpacing: 1.4),
      ),
    ),
    routes: {
      "Entry": (context) => DataScreen(title: 'Data screen',),
    },
  ));
}

class GettingStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}
