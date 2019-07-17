import 'package:flutter/material.dart';
import 'package:flutternestedtabsapp/moviereleasetabs.dart';
import 'news.dart';

void main() => runApp(MyApp());
const PrimaryColor = const Color(0xFF151026);
 //Creating routes
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mes Application',
      theme: ThemeData(
        primaryColor: Color(0xff2196f3),
      ),
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        "/courses": (BuildContext context) => new MovieReleaseTabs(),
      },
    );
  }
}