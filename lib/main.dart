import 'package:flutter/material.dart';
import 'Setup/login.dart';
import 'Setup/register.dart';
import 'Setup/home.dart';
import 'Maps.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    Register.tag: (context) => Register(),
    Home.tag: (context) => Home(),
    MapPage.tag: (context) => MapPage(),
    
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BarCrawler',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Nunito',
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}