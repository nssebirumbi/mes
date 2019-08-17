import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mesapp/apiservices.dart';


import 'singlenews.dart';

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
                future: ApiServices.getNewsList(),
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
                future: ApiServices.getNewsList(),
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
                future: ApiServices.getNewsList(),
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
                future: ApiServices.getNewsList(),
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
        children: <Widget>[
          FutureBuilder(
            future: ApiServices.getPost(_id),
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
                    // Text(
                    //   snapshot.data['title'],
                    //   style: TextStyle(
                    //     fontSize: 30,
                    //     fontWeight: FontWeight.bold
                    //   ),
                    // ),
                    // Text(snapshot.data['content']),
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
