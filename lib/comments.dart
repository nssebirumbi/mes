//import 'package:flutter/material.dart';
//import 'package:mesapp/apiservices.dart';
//import 'package:mesapp/login.dart';
//
//
//
//class Comment extends StatelessWidget {
//  //final String text;
//  Comment();
//  //{this.text}
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(),
//      body: FutureBuilder(
//        future: ApiServices.getPosts(),
//        builder: (context, snapshot) {
//          if (snapshot.connectionState == ConnectionState.done) {
//            final posts = snapshot.data;
//
//            return ListView.builder(
//              itemBuilder: (context, int index){
//                return new Container(
//                decoration: myBoxDecoration(),
//                margin: const EdgeInsets.symmetric(vertical: 10.0),
//                child: new Row(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Container(
//                      child: Expanded(
//                        child: new Column(
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          children: <Widget>[
//                            Container(
//                              padding: EdgeInsets.all(8.0),
//                              decoration: new BoxDecoration(
//                                //borderRadius: new BorderRadius.circular(10.0),
//                                //color: Colors.white,
//                              ),
//                              child: Row(
//                                children: <Widget>[
//                                  new Text(
//                                    posts[index]['user'],
//                                    style: TextStyle(color: Colors.greenAccent)
//                                  )
//                                ]
//                              ),
//                            ),
//                            new Container(
//                              margin: const EdgeInsets.all(20.0),
//                              child: new Text(posts[index]['message']),
//                            ),
//                            Divider(),
//                            new Container(
//                              margin: const EdgeInsets.all(0.0),
//                              child: Container(
//                                  margin: const EdgeInsets.all(0.0),
//                                  child: new IconButton(
//                                  icon: new Icon(Icons.comment),
//                                  onPressed: () => {
//
//                                  },
//                                ),
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                    ),
//                  ],
//                ),
//              );
//              },
//              itemCount: posts.length,
//
//            );
//          }
//          return Center(child: CircularProgressIndicator(),);
//        },
//      ),
//    );
//  }
//
//  BoxDecoration myBoxDecoration() {
//    return BoxDecoration(
//      borderRadius: BorderRadius.all(
//          Radius.circular(10.0) //         <--- border radius here
//      ),
//      color: Colors.lightBlue,
//    );
//  }
//}