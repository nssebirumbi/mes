import 'package:flutter/material.dart';

class NewsTabs extends StatefulWidget {

  NewsTabs(this.colorVal);
  int colorVal;

  _NewsTabsState createState() => _NewsTabsState();
}

class _NewsTabsState extends State<NewsTabs> with SingleTickerProviderStateMixin{
TabController _tabController;

@override
    void initState() {
      super.initState();
      _tabController = new TabController(vsync: this, length: 5);
      _tabController.addListener(_handleTabSelection);
    }
    void _handleTabSelection() {
        setState(() {
          widget.colorVal=0xffff5722;
        });
    }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:5,
      child: Scaffold(
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
                

                      Text("All News",
                          style: TextStyle(
                              color: _tabController.index == 0
                                  ? Color(widget.colorVal)
                                  : Colors.black)),
                      Text("Mentorship",
                          style: TextStyle(
                              color: _tabController.index == 1
                                  ? Color(widget.colorVal)
                                  : Colors.black)),
                      Text("Scholarship",
                          style: TextStyle(
                              color: _tabController.index == 2
                                  ? Color(widget.colorVal)
                                  : Colors.black)),
                      Text("Soccer",
                          style: TextStyle(
                              color: _tabController.index == 3
                                  ? Color(widget.colorVal)
                                  : Colors.black)),
                      Text("Internship",
                          style: TextStyle(
                              color: _tabController.index == 3
                                  ? Color(widget.colorVal)
                                  : Colors.black)),
            
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
            children: <Widget>[
          ListView(
              padding: EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0),
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(child: Text(
                      "Welcoming Freshers at CEDAT (Makerere University Kampala)",
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 14.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                      )
                    )),
                    new VerticalDivider(),
                    universityImages()
                  ],
                ),
                new Divider(),
                Row(
                  children: <Widget>[
                    Expanded(child: Text(
                      "Uganda Makes it to the Quater Finals",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 16.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                      )
                    )),
                    new VerticalDivider(),
                    cranesImage()
                  ],
                ),
                new Divider(),
                Row(
                  children: <Widget>[
                    Expanded(child: Text(
                      "Ministry Of Sports and Education Releases a list On Intern Winners",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 16.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                      )
                    )),
                    new VerticalDivider(),
                    ministryOfSports()
                  ],
                ),
              new Divider(),
                Row(
                  children: <Widget>[
                    Expanded(child: Text(
                      "Scholarship Program",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 16.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                      )
                    )),
                    new VerticalDivider(),
                    scholarship()
                  ],
                ),
              new Divider(),
                Row(
                  children: <Widget>[
                    Expanded(child: Text(
                      "Cedat Mentorship",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 16.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                      )
                    )),
                    new VerticalDivider(),
                    mentorship()
                  ],
                ),
              new Divider(),
                Row(
                  children: <Widget>[
                    Expanded(child: Text(
                      "People Contest Over Bobiwines Arrest",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 16.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                      )
                    )),
                    new VerticalDivider(),
                    politics()
                  ],
                ),
            ],),

            /*
            End of the All news Widget
            Start of the Mentorship Widget
            List showing the Mentorship Widget
            */
            ListView(
              padding: EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0),
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(child: Text(
                      "Welcoming Freshers at CEDAT (Makerere University Kampala)",
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 14.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                      )
                    )),
                    new VerticalDivider(),
                    universityImages()
                  ],
                ),
                new Divider(),
                Row(
                  children: <Widget>[
                    Expanded(child: Text(
                      "Uganda Makes it to the Quater Finals",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 16.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                      )
                    )),
                    new VerticalDivider(),
                    cranesImage()
                  ],
                ),
                new Divider(),
                Row(
                  children: <Widget>[
                    Expanded(child: Text(
                      "Ministry Of Sports and Education Releases a list On Intern Winners",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 16.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                      )
                    )),
                    new VerticalDivider(),
                    ministryOfSports()
                  ],
                ),
              new Divider(),
                Row(
                  children: <Widget>[
                    Expanded(child: Text(
                      "Scholarship Program",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 16.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                      )
                    )),
                    new VerticalDivider(),
                    scholarship()
                  ],
                ),
              new Divider(),
                Row(
                  children: <Widget>[
                    Expanded(child: Text(
                      "Cedat Mentorship",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 16.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                      )
                    )),
                    new VerticalDivider(),
                    mentorship()
                  ],
                ),
              new Divider(),
                Row(
                  children: <Widget>[
                    Expanded(child: Text(
                      "People Contest Over Bobiwines Arrest",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 16.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                      )
                    )),
                    new VerticalDivider(),
                    politics()
                  ],
                ),
            ]),
            /*
            End of the All news Widget
            Start of the Mentorship Widget
            List showing the Mentorship Widget
            */
            ListView(
              padding: EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0),
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(child: Text(
                      "Welcoming Freshers at CEDAT (Makerere University Kampala)",
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 14.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                      )
                    )),
                    new VerticalDivider(),
                    universityImages()
                  ],
                ),
                new Divider(),
                Row(
                  children: <Widget>[
                    Expanded(child: Text(
                      "Uganda Makes it to the Quater Finals",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 16.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                      )
                    )),
                    new VerticalDivider(),
                    cranesImage()
                  ],
                ),
                new Divider(),
                Row(
                  children: <Widget>[
                    Expanded(child: Text(
                      "Ministry Of Sports and Education Releases a list On Intern Winners",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 16.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                      )
                    )),
                    new VerticalDivider(),
                    ministryOfSports()
                  ],
                ),
              new Divider(),
                Row(
                  children: <Widget>[
                    Expanded(child: Text(
                      "Scholarship Program",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 16.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                      )
                    )),
                    new VerticalDivider(),
                    scholarship()
                  ],
                ),
              new Divider(),
                Row(
                  children: <Widget>[
                    Expanded(child: Text(
                      "Cedat Mentorship",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 16.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                      )
                    )),
                    new VerticalDivider(),
                    mentorship()
                  ],
                ),
              new Divider(),
                Row(
                  children: <Widget>[
                    Expanded(child: Text(
                      "People Contest Over Bobiwines Arrest",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 16.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                      )
                    )),
                    new VerticalDivider(),
                    politics()
                  ],
                ),
            ]
          ),
          /*
            End of the Mentorship Widget
            Start of the Scholarship Widget
            List showing the Scholarships Widget
            */
              ListView(
              padding: EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0),
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(child: Text(
                      "Welcoming Freshers at CEDAT (Makerere University Kampala)",
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 14.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                      )
                    )),
                    new VerticalDivider(),
                    universityImages()
                  ],
                ),
                new Divider(),
                Row(
                  children: <Widget>[
                    Expanded(child: Text(
                      "Uganda Makes it to the Quater Finals",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 16.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                      )
                    )),
                    new VerticalDivider(),
                    cranesImage()
                  ],
                ),
                new Divider(),
                Row(
                  children: <Widget>[
                    Expanded(child: Text(
                      "Ministry Of Sports and Education Releases a list On Intern Winners",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 16.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                      )
                    )),
                    new VerticalDivider(),
                    ministryOfSports()
                  ],
                ),
              new Divider(),
                Row(
                  children: <Widget>[
                    Expanded(child: Text(
                      "Scholarship Program",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 16.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                      )
                    )),
                    new VerticalDivider(),
                    scholarship()
                  ],
                ),
              new Divider(),
                Row(
                  children: <Widget>[
                    Expanded(child: Text(
                      "Cedat Mentorship",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 16.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                      )
                    )),
                    new VerticalDivider(),
                    mentorship()
                  ],
                ),
              new Divider(),
                Row(
                  children: <Widget>[
                    Expanded(child: Text(
                      "People Contest Over Bobiwines Arrest",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 16.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                      )
                    )),
                    new VerticalDivider(),
                    politics()
                  ],
                ),
            ]
            ),
          /*
            End of the Scholarship Widget
            Start of the Soccer Widget
            List showing the Soccer Widget
            */
            ListView(
              padding: EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0),
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(child: Text(
                      "Welcoming Freshers at CEDAT (Makerere University Kampala)",
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 14.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                      )
                    )),
                    new VerticalDivider(),
                    universityImages()
                  ],
                ),
                new Divider(),
                Row(
                  children: <Widget>[
                    Expanded(child: Text(
                      "Uganda Makes it to the Quater Finals",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 16.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                      )
                    )),
                    new VerticalDivider(),
                    cranesImage()
                  ],
                ),
                new Divider(),
                Row(
                  children: <Widget>[
                    Expanded(child: Text(
                      "Ministry Of Sports and Education Releases a list On Intern Winners",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 16.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                      )
                    )),
                    new VerticalDivider(),
                    ministryOfSports()
                  ],
                ),
              new Divider(),
                Row(
                  children: <Widget>[
                    Expanded(child: Text(
                      "Scholarship Program",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 16.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                      )
                    )),
                    new VerticalDivider(),
                    scholarship()
                  ],
                ),
              new Divider(),
                Row(
                  children: <Widget>[
                    Expanded(child: Text(
                      "Cedat Mentorship",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 16.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                      )
                    )),
                    new VerticalDivider(),
                    mentorship()
                  ],
                ),
              new Divider(),
                Row(
                  children: <Widget>[
                    Expanded(child: Text(
                      "People Contest Over Bobiwines Arrest",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 16.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                      )
                    )),
                    new VerticalDivider(),
                    politics()
                  ],
                ),
            ]
            ),
            ],
            /*
            End of the Soccer Widget
            */
        ),
      ),
    );
  }
}

class universityImages extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    AssetImage assetImage = AssetImage('images/Cedat.jpg');
    Image image = Image(image: assetImage, width: 130.0, height: 100.0,);
    return Container(child: image,);
  }
}
class cranesImage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    AssetImage assetImage = AssetImage('images/cranes.jpg');
    Image image = Image(image: assetImage, width: 130.0, height: 100.0,);
    return Container(child: image,);
  }
}
class ministryOfSports extends StatelessWidget{
  @override
  Widget build(BuildContext context){
  AssetImage assetImage = AssetImage('images/Interns.png');
  Image image = Image(image: assetImage, width: 130.0, height: 100.0,);
  return Container(child: image,);
  }
}
class scholarship extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    AssetImage assetImage = AssetImage('images/Scholarship.jpg');
    Image image = Image(image: assetImage, width: 140.0, height: 100.0,);
    return Container(child: image,);
  }
}

class mentorship extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    AssetImage assetImage = AssetImage('images/mentorship.jpg');
    Image image = Image(image: assetImage, width: 140.0, height: 100.0,);
    return Container(child: image);
  }
}
class politics extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    AssetImage assetImage = AssetImage('images/politics.jpg');
    Image image = Image(image: assetImage, width: 140.0, height:100.0,);
    return Container(child: image,);
  }
}

