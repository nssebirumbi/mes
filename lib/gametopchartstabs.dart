import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GameTopChartsTabs extends StatefulWidget {
  int colorVal;
  GameTopChartsTabs(this.colorVal);

  _GameTopChartsTabsState createState() => _GameTopChartsTabsState();
}

class _GameTopChartsTabsState extends State<GameTopChartsTabs>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 4);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      widget.colorVal = 0xff3f51b5;
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
        
      ),
    );
  }
}
