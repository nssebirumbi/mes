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
      _tabController = new TabController(vsync: this, length: 4);
      _tabController.addListener(_handleTabSelection);
     }
     void _handleTabSelection() {
        setState(() {
          widget.colorVal=0xff990099;
         });
     }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xffEFF0F1),
      elevation: 8.0,
      shadowColor: Color(0x802196F3),
      child: Padding(
        padding: EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
        child: innerNestedTabs(),
      ),
    );
  }

  Widget innerNestedTabs() {
    return DefaultTabController(
      length: 4,
      child: new Scaffold(
        appBar: new PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: new Container(
            child: new SafeArea(
              child: Column(
                children: <Widget>[
                  new Expanded(child: new Container()),
                  new TabBar(
                    isScrollable: true,
                    controller: _tabController,
                    labelPadding: EdgeInsets.all(10.0),
                    indicatorColor: Color(widget.colorVal),
                    indicatorWeight: 4.0,
                    tabs: [
                      Text("YEAR 1",
                          style: TextStyle(
                              color: _tabController.index == 0
                                  ? Color(widget.colorVal)
                                  : Colors.black)),
                      Text("YEAR 2",
                          style: TextStyle(
                              color: _tabController.index == 1
                                  ? Color(widget.colorVal)
                                  : Colors.black)),
                      Text("YEAR 3",
                          style: TextStyle(
                              color: _tabController.index == 2
                                  ? Color(widget.colorVal)
                                  : Colors.black)),
                      Text("YEAR 4",
                          style: TextStyle(
                              color: _tabController.index == 3
                                  ? Color(widget.colorVal)
                                  : Colors.black))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: new TabBarView(
          controller: _tabController,
          children: <Widget>[
            TimetableContent(),
            TimetableContent(),
            TimetableContent(),
            TimetableContent(),
          ],
        ),
      ),
    );
  }
}

class TimetableContent extends StatefulWidget {
  final Widget child;

  TimetableContent({Key key, this.child}) : super(key: key);

  _TimetableContentState createState() => _TimetableContentState();
}

class _TimetableContentState extends State<TimetableContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          new ListTile(
              title: new Text("Semester 1"),
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new TimeTable()));
              }
          ),
          new ListTile(
              title: new Text("Semester 2"),
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new TimeTable()));
              }
          ),
        ],
      ),
    );
  }

}

class TimeTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: new Container(),
    );
  }
}
