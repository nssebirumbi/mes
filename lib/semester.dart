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
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (){

              }
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text("Notes"),
                ),
                Tab(
                  child: Text("Past Papers"),
                ),
                Tab(
                  child: Text("Notes"),
                ),
                Tab(
                  child: Text("Handouts"),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              new Card(
                color: Colors.white10,
              ),
              new Card(
                color: Colors.white10,
              ),
              new Card(
                color: Colors.white10,
              ),
              new Card(
                color: Colors.white10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
