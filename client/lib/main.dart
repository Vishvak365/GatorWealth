import 'package:flutter/material.dart';
import 'screens/register.dart';
import 'screens/login_page.dart';
import 'screens/spending.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override 
  Widget build(BuildContext ctxt){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/':    (context) => LoginPage(),
        '/UserLogin': (context) => LoginPage(),
        '/SpendingPage': (context) => SpendingPage(),
        '/RegisterPage': (context) => RegisterPage()
      },
    );
  }
}
  
