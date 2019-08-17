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
      body: Center(
        child: ListView(
          children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                    hint: Text('2018-2019'), 
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
                  ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: ExactAssetImage("images/cedat.PNG"),
                            minRadius: 30,
                            maxRadius: 70,
                            ),
                          SizedBox(height: 10,),
                          Text("Julius Ssemakula", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                          SizedBox(height: 3,),
                          Text("Head Of Dept", style: new TextStyle(fontStyle: FontStyle.italic,),),
                          SizedBox(height: 30,)
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: ExactAssetImage("images/cedat.PNG"),
                            minRadius: 30,
                            maxRadius: 70,
                            ),
                          SizedBox(height: 10,),
                          Text("Nicholus Bsw", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                          SizedBox(height: 3,),
                          Text("Head Of Dept", style: new TextStyle(fontStyle: FontStyle.italic,),),
                          SizedBox(height: 30,),
                        ],
                      ),
                    ),
                  ],
                ),
                
          ],),
        ),
      ),
    );
  }
}