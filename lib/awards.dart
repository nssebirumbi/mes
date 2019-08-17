import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mesapp/apiservices.dart';

import 'profile.dart';
import 'singleaward.dart';


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
        body: FutureBuilder(
          future: ApiServices.getAwardsList(),
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
                      posts[index]['title'],
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
                          builder: (context) => Award(posts[index]['id'])
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
    );
  }
}

class Award extends StatelessWidget {
  final int _id;

  Award(this._id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
        children: <Widget>[
          FutureBuilder(
            future: ApiServices.getAward(_id),
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
                        snapshot.data['details'],
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

