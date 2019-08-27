import 'package:flutter/material.dart';
import 'chatscreen.dart';

const PrimaryColor = const Color(0xff2196f3);

class Forum extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.of(context).pop();
      },
      child: new Scaffold(
          appBar: new AppBar(
            backgroundColor: PrimaryColor,
            title: new Text("MES Forum"),
          ),
          body: new ChatScreen()
      ),
    );
  }
}