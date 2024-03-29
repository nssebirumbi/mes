import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'committeemembers.dart';
import 'forum.dart';
import 'newstabs.dart';
import 'courses.dart';
import 'profile.dart';
import 'timetablestab.dart';
import 'awards.dart';
import 'login.dart';

class HomePage extends StatefulWidget {
  static String tag = 'news-page';
  final Widget child;
  HomePage({Key key, this.child}) : super(key: key);
  _HomePageState createState() => _HomePageState();
}

Color PrimaryColor =  Color(0xff2196f3);

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  //String _id = userId;

  AnimationController animCtrl;
  Animation<double> animation;

  AnimationController animCtrl2;
  Animation<double> animation2;

  bool showFirst = true;

  @override
  void initState() {
    super.initState();

    // Animation init
    animCtrl = new AnimationController(
        duration: new Duration(milliseconds: 500), vsync: this);
    animation = new CurvedAnimation(parent: animCtrl, curve: Curves.easeOut);
    animation.addListener(() {
      this.setState(() {});
    });
    animation.addStatusListener((AnimationStatus status) {});

    animCtrl2 = new AnimationController(
        duration: new Duration(milliseconds: 1000), vsync: this);
    animation2 = new CurvedAnimation(parent: animCtrl2, curve: Curves.easeOut);
    animation2.addListener(() {
      this.setState(() {});
    });
    animation2.addStatusListener((AnimationStatus status) {});
  }

  @override
  void dispose() {
    animCtrl.dispose();
    super.dispose();
  }

  String name, email;

  showExitPopup(){
    return showDialog(context: context,
      builder: (context){
        return AlertDialog(
          title: Text("Confirm"),
          content: Text("Do you want to exsit"),
          actions: <Widget>[

            RaisedButton(
              child: Text("No"),
              color: Colors.white,
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            RaisedButton(
              child: Text("Yes"),
              color: Colors.white,
              onPressed: (){
                SystemNavigator.pop();
              },
            )
          ],
        );
      }
    );
  }
  
  @override
  Widget build(BuildContext context) {

   
    return WillPopScope(
      onWillPop: (){
        FirebaseAdMob.instance.initialize(appId: "ca-app-pub-2824369722414645~6114162264").then((response){
          myBanner..load()..show();

        });
        showExitPopup();
      },
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
             // backgroundColor: Color(0xff109618),
              backgroundColor: PrimaryColor,
              title: Text("MES APP"),
              
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
                        default:
                      }
                    }
                  );
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
                      accountName: new Text(userName),
                     accountEmail: new Text(userEmail),
                      currentAccountPicture: new GestureDetector(
                        child: new CircleAvatar(
                          //backgroundImage: AssetImage("images/DSC02331.JPG"),
                        ),
                      ),
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                            image: AssetImage("images/drawer.jpg"),
                            fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    new ListTile(
                      title: new Text("Profile"),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Profile(2)));
                      }
                    ),
                    new ListTile(
                        title: new Text("Forum"),
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
                      onTap: (){
                        logout();
                      }
                    ),
                  ],
                )
              ),
            body: TabBarView(
              children: <Widget>[
                NewsTabs(0xffff5722),//ff5722
                Courses(0xff3f51b5),//3f51b5
                TimeTables(0xff9c27b0), //9c27b0
                Awards(0xff2196f3) //2196f3 //4CAF50
              ],
            )
        ),

      ),
    );
  }


  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("name");
    prefs.remove("email");
    prefs.remove("id");
    prefs.remove("value");
    prefs.commit();

    Navigator.of(context).push(
        new MaterialPageRoute(builder: (BuildContext context) => new LoginPage())
    );
  }
}
