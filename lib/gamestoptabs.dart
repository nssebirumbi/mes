import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'gametopchartstabs.dart';


class GamesTopTabs extends StatefulWidget {
  int colorVal;
  GamesTopTabs(this.colorVal);
  _GamesTopTabsState createState() => _GamesTopTabsState();
}

class _GamesTopTabsState extends State<GamesTopTabs> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
     void initState() {
       super.initState();
      _tabController = new TabController(vsync: this, length: 5);
      _tabController.addListener(_handleTabSelection);
     }
     void _handleTabSelection() {
        setState(() {
          widget.colorVal=0xff3f51b5;
         });
     }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            isScrollable: true,
            indicatorWeight: 4.0,
            indicatorColor:Color(0xff3f51b5),
            unselectedLabelColor: Colors.grey,
             controller: _tabController,
            tabs: <Widget>[
              Tab(
                child:Text('Civil',style: TextStyle( color: _tabController.index == 0
                          ?  Color( widget.colorVal)
                          : Colors.grey)),
              ),
              Tab(
                child: Text('Electrical',style: TextStyle( color: _tabController.index == 1
                          ?  Color( widget.colorVal)
                          : Colors.grey)),
              ),
              Tab(
                child: Text('Telcommunication',style: TextStyle( color: _tabController.index == 2
                          ?  Color( widget.colorVal)
                          : Colors.grey)),
              ),
              
              Tab(
                child: Text('Mechanical',style: TextStyle( color: _tabController.index == 4
                          ?  Color( widget.colorVal)
                          : Colors.grey)),
              ),
              Tab(
                child: Text('Computer Engineering',style: TextStyle( color: _tabController.index == 5
                          ?  Color( widget.colorVal)
                          : Colors.grey)),
              )
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
            children: <Widget>[
              Column(
              children: <Widget>[
                Center(
                  child: Text("For you Tabs"),
                )
              ],
            ),
              GameTopChartsTabs(0xff3f51b5),
               Container(
              height: 200.0,
              child: Center(child: Text('New')),
            ),
             Container(
              height: 200.0,
              child: Center(child: Text('Premium')),
            ),
             Container(
              height: 200.0,
              child: Center(child: Text('Category')),
            ),
             Container(
              height: 200.0,
              child: Center(child: Text('Events')),
            ),
             Container(
              height: 200.0,
              child: Center(child: Text('Editor Choice')),
            ),
             Container(
              height: 200.0,
              child: Center(child: Text('Family')),
            ),
            ],
          ),
      ),
    );
  }
}
