import 'package:flutter/material.dart';
import 'chatscreen.dart';

class Forum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          
          title: new Text("MES Forum"),
        ),
        body: new ChatScreen()
    );
  }
}