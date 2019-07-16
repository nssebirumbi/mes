import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'chatscreen.dart';
import 'committeemembers.dart';
import 'forum.dart';
import 'hometoptabs.dart';
import 'courses.dart';
import 'forumtab.dart';
import 'profile.dart';
import 'timetablestab.dart';
import 'musictoptabs.dart';

class HomePage extends StatefulWidget {
  final Widget child;
  HomePage({Key key, this.child}) : super(key: key);
  _HomePageState createState() => _HomePageState();
}

Color PrimaryColor =  Color(0xff109618);

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
           // backgroundColor: Color(0xff109618),
            backgroundColor: PrimaryColor,
            
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.white,
              indicatorWeight: 4.0, 
               onTap: (index){
                 setState(() {
                  switch (index) {
                    case 0:
                      PrimaryColor= Color(0xffff5722);
                      break;
                      case 1:
                      PrimaryColor= Color(0xff3f51b5);
                      break;
                      case 2:
                      PrimaryColor= Color(0xffe91e63);
                      break;
                      case 3:
                      PrimaryColor= Color(0xff9c27b0);
                      break;
                      case 4:
                      PrimaryColor= Color(0xff2196f3);
                      break;
                    default:
                  }
            });
              },
              tabs: <Widget>[
                Tab(
                  child: Container(
                    child: Text(
                      'NEWS',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'COURSES',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'FORUM',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'TIME TABLES',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'AWARDS',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          drawer: new Drawer(
            child: new ListView(
                children: <Widget>[
                  new UserAccountsDrawerHeader(
                    accountName: new Text("Nicholas Henry Ssebirumbi"),
                    accountEmail: new Text("nssebirumbi@gmail.com"),
                    currentAccountPicture: new GestureDetector(
                      child: new CircleAvatar(
                        backgroundImage: AssetImage("images/politics.jpg"),
                      ),
                    ),
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                          image: AssetImage("images/Cedat.jpg"),
                          fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  new ListTile(
                    title: new Text("Profile"),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Profile()));
                    }
                  ),
                  new ListTile(
                      title: new Text("Chat"),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Forum()));
                      }
                  ),
                  new ListTile(
                    title: new Text("Committee Members"),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new CommitteeMembers()));
                    }
                  ),
                  new Divider(),
                  new ListTile(
                    title: new Text("Log out"),
                  ),
                ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              HomeTopTabs(0xffff5722),//ff5722
              Courses(0xff3f51b5),//3f51b5
              MoviesTopTabs(0xffe91e63),//e91e63
              BooksTopTabs(0xff9c27b0), //9c27b0
              MusicTopTabs(0xff2196f3), //2196f3 //4CAF50
            ],
          )),
    );
  }
}
