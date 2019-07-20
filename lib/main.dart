import 'package:flutter/material.dart';
import 'login.dart';
import 'news.dart';
import 'pages/intro_screen.dart';
import 'pages/splash_screen.dart';
var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => LoginPage(),
  "/intro": (BuildContext context) => IntroScreen(),
};
void main() => runApp(MyApp());
const PrimaryColor = const Color(0xffffffff);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter NestedTabs Demo',
      theme: ThemeData(
        primaryColor: Color(0xff2196f3),
      ),
      home: SplashScreen(),
    routes: routes
    );
  }
}