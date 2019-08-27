import 'package:flutter/material.dart';
import 'package:mesapp/apiservices.dart';
import 'package:mesapp/login.dart';



class ChatMessage extends StatelessWidget {
  //final String text;
  ChatMessage();
  //{this.text}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiServices.getAwardsList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final posts = snapshot.data;
          return ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(height: 2, color: Colors.black,);
            },
            itemBuilder: (context, index) {
              return new Container(
                decoration: myBoxDecoration(),
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      
                      child: Expanded(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(10.0),
                                color: Colors.white,
                              ),
                              child: Row(
                                children: <Widget>[
                                  new Text(
                                    userName,
                                    style: TextStyle(color: Colors.greenAccent)
                                  ) 
                                ]
                              ),
                            ),
                            new Container(
                              margin: const EdgeInsets.all(20.0),
                              child: new Text(snapshot.data['message'],),
                            ),
                            Divider(),
                            new Container(
                              margin: const EdgeInsets.all(0.0),
                              child: Container(
                                  margin: const EdgeInsets.all(0.0),
                                  child: new IconButton(
                                  icon: new Icon(Icons.comment),
                                  onPressed: () => {
                                    
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: posts.length,
          );
        }
        return Center(child: CircularProgressIndicator(),);
      },
    );
    
    
    
    
  //   new Container(
  //     decoration: myBoxDecoration(),
  //     margin: const EdgeInsets.symmetric(vertical: 10.0),
  //     child: new Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         Container(itemBuilder: (_, int index) => _messages[index],
   //             itemCount: _messages.length
            
  //           child: Expanded(
  //             child: new Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: <Widget>[
  //                 Container(
  //                   padding: EdgeInsets.all(8.0),
  //                   decoration: new BoxDecoration(
  //                     borderRadius: new BorderRadius.circular(10.0),
  //                     color: Colors.white,
  //                   ),
  //                   child: Row(
  //                     children: <Widget>[
  //                       new Text(
  //                         user_name,
  //                         style: TextStyle(color: Colors.greenAccent)
  //                       ) 
  //                     ]
  //                   ),
  //                 ),
  //                 new Container(
  //                   margin: const EdgeInsets.all(20.0),
  //                   child: new Text(text),
  //                 ),
  //                 Divider(),
  //                 new Container(
  //                   margin: const EdgeInsets.all(0.0),
  //                   child: Container(
  //                       margin: const EdgeInsets.all(0.0),
  //                       child: new IconButton(
  //                       icon: new Icon(Icons.comment),
  //                       onPressed: () => {
                          
  //                       },
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

    
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.all(
          Radius.circular(10.0) //         <--- border radius here
      ),
      color: Colors.white,
    );
  }
}