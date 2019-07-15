import 'package:flutter/material.dart';

class Semester extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: new Color(0xff3f51b5),
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.of(context).pop();
              }
            ),
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 4.0,
              tabs: [
                Tab(
                  child: Text("Handouts"),
                ),
                Tab(
                  child: Text("Past Papers"),
                ),
                Tab(
                  child: Text("Text Books"),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              new Card(
                color: Colors.white,
              ),
              new Card(
                color: Colors.white,
              ),
              new Card(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
