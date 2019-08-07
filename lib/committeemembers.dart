import 'package:flutter/material.dart';

void main() {
  runApp(CommitteeMembers());
}
class CommitteeMembers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CommitteeMembers();
}

class _CommitteeMembers extends State<CommitteeMembers> {
//  List<String> _years = ['Please choose a year', '2015-2017', '2017-2018', '2018-2019', '2019-2020']; // Option 1
//  String _selectedYear = 'Please choose a year'; // Option 1
  List<String> _years = ['2015-2017', '2017-2018', '2018-2019', '2019-2020']; // Option 2
  String _selectedYear; // Option 2

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: new AppBar(
          title: new Text("Committee Members"),
      ),
        body: Stack(
          children:<Widget>[
          Container(
            child: Column(
              children:<Widget>[
            DropdownButton(
            hint: Text('Please choose a year'), // Not necessary for Option 1
            value: _selectedYear,
            onChanged: (newValue) {
              setState(() {
                _selectedYear = newValue;
              });
            },
            items: _years.map((year) {
              return DropdownMenuItem(
                child: new Text(year),
                value: year,
              );
            }).toList(),
          ),
          ],)
        ),
        Container(
              padding: new EdgeInsets.fromLTRB(8.0, 45.0, 8.0, 8.0),
              child: new Image.asset("images/Cedat.jpg",height: 150.0, width: 130.0,fit: BoxFit.cover),
        ),
        Container(
              padding: new EdgeInsets.fromLTRB(200.0, 45.0, 8.0, 8.0),
              child: new Text("Ssemakula Julius"),
        ),
        ]
      ),
    ),);
  }
}