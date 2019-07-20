import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Awards extends StatefulWidget {
   int colorVal;
  Awards(this.colorVal);
  _AwardsState createState() => _AwardsState();
}

class _AwardsState extends State<Awards> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
     void initState() {
       super.initState();
     }
     void _handleTabSelection() {
        setState(() {
          widget.colorVal=0xff2196f3;
         });
     }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Container(
          child: ListView(
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
            ],
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