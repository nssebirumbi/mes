import 'package:flutter/material.dart';

import 'semester.dart';

class YearContent extends StatefulWidget {
  final Widget child;

  YearContent({Key key, this.child}) : super(key: key);

  _YearContentState createState() => _YearContentState();
}

class _YearContentState extends State<YearContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          new ListTile(
              title: new Text("Semester 1"),
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Semester()));
              }
          ),
          new ListTile(
              title: new Text("Semester 2"),
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Semester()));
              }
          ),
        ],
      ),
    );
  }

}