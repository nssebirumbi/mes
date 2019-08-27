import 'dart:async';
import 'dart:convert';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mesapp/apiservices.dart';


class NewsTabs extends StatefulWidget {

  NewsTabs(this.colorVal);
  int colorVal;

  _NewsTabsState createState() => _NewsTabsState();
}

class _NewsTabsState extends State<NewsTabs> with SingleTickerProviderStateMixin{
TabController _tabController;

Future<Post> post;

@override
    void initState() {
      super.initState();
      _tabController = new TabController(vsync: this, length: 4);
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
      length:4,
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
                      Text("Mentorship",
                          style: TextStyle(
                              color: _tabController.index == 0
                                  ? Color(widget.colorVal)
                                  : Colors.black)),
                      Text("Scholarship",
                          style: TextStyle(
                              color: _tabController.index == 1
                                  ? Color(widget.colorVal)
                                  : Colors.black)),
                      Text("Soccer",
                          style: TextStyle(
                              color: _tabController.index == 2
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
              FutureBuilder(
                future: ApiServices.getNewsList(1),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    final posts = snapshot.data;
                    return ListView.separated(
                      separatorBuilder: (context, index) {
                        return Divider(height: 2, color: Colors.black,);
                      },
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: new Text(
                            posts[index]['headline'],
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                          leading: Image.asset(
                            'images/Cedat.jpg', 
                            width: 100.0, 
                            height: 100.0,
                          ), 
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Post(posts[index]['id'])
                              )
                            );
                          },
                        );
                      },
                      itemCount: posts.length,
                    );
                  }
                  return Center(child: CircularProgressIndicator(),);
                },
              ),

              FutureBuilder(
                future: ApiServices.getNewsList(2),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    final posts = snapshot.data;
                    return ListView.separated(
                      separatorBuilder: (context, index) {
                        return Divider(height: 2, color: Colors.black,);
                      },
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: new Text(
                            posts[index]['headline'],
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                          leading: Image.asset(
                            'images/Cedat.jpg', 
                            width: 100.0, 
                            height: 100.0,
                          ), 
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Post(posts[index]['id'])
                              )
                            );
                          },
                        );
                      },
                      itemCount: posts.length,
                    );
                  }
                  return Center(child: CircularProgressIndicator(),);
                },
              ),

              FutureBuilder(
                future: ApiServices.getNewsList(3),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    final posts = snapshot.data;
                    return ListView.separated(
                      separatorBuilder: (context, index) {
                        return Divider(height: 2, color: Colors.black,);
                      },
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: new Text(
                            posts[index]['headline'],
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                          leading: Image.asset(
                            'images/Cedat.jpg', 
                            width: 100.0, 
                            height: 100.0,
                          ), 
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Post(posts[index]['id'])
                              )
                            );
                          },
                        );
                      },
                      itemCount: posts.length,
                    );
                  }
                  return Center(child: CircularProgressIndicator(),);
                },
              ),

              FutureBuilder(
                future: ApiServices.getNewsList(4),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    final posts = snapshot.data;
                    return ListView.separated(
                      separatorBuilder: (context, index) {
                        return Divider(height: 2, color: Colors.black,);
                      },
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: new Text(
                            posts[index]['headline'],
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                          leading: Image.asset(
                            'images/Cedat.jpg', 
                            width: 100.0, 
                            height: 100.0,
                          ), 
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Post(posts[index]['id'])
                              )
                            );
                          },
                        );
                      },
                      itemCount: posts.length,
                    );
                  }
                  return Center(child: CircularProgressIndicator(),);
                },
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

class Post extends StatelessWidget {
  final int _id;

  Post(this._id);

  @override
  Widget build(BuildContext context) {
    FirebaseAdMob.instance.initialize(appId: "ca-app-pub-2824369722414645~6114162264").then((response){
      myBanner..load()..show();

    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
        children: <Widget>[
          FutureBuilder(
            future: ApiServices.getNews(_id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  children: <Widget>[

                    Hero(
                      tag: 'hero',
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: new Image(
                          image: AssetImage('images/politics.jpg')
                        )
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        snapshot.data['title'],
                        style: TextStyle(fontSize: 20.0, color: Colors.black87,fontWeight: FontWeight.bold),
                        
                      )
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        snapshot.data['content'],
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                        textAlign: TextAlign.justify,
                      )
                    ),
                  ],
                );
              }
              return Center(child: CircularProgressIndicator(),);
            },
          ),
          
        ],
      ),
      )
    );
  }

}

MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: <String>['games', 'pubg'],
  contentUrl: 'https://flutter.io',
  birthday: DateTime.now(),
  childDirected: false,
  designedForFamilies: false,
  gender: MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
  testDevices: <String>[], // Android emulators are considered test devices
);

BannerAd myBanner = BannerAd(
  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
  // https://developers.google.com/admob/android/test-ads
  // https://developers.google.com/admob/ios/test-ads
  adUnitId: BannerAd.testAdUnitId,
  //adUnitId: "ca-app-pub-2824369722414645/8684485284",
  size: AdSize.smartBanner,
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("BannerAd event is $event");
  },
);
