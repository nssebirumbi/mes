import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class TimeTables extends StatefulWidget {
  int colorVal;
  TimeTables(this.colorVal);
  _TimeTablesState createState() => _TimeTablesState();
}

class _TimeTablesState extends State<TimeTables> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
     void initState() {
       super.initState();
      _tabController = new TabController(vsync: this, length: 7);
      _tabController.addListener(_handleTabSelection);
     }
     void _handleTabSelection() {
        setState(() {
          widget.colorVal=0xff990099;
         });
     }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
