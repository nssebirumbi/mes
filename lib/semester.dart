import 'package:flutter/material.dart';
import 'dart:convert';

class Semester extends StatefulWidget {
  _SemesterState createState() => _SemesterState();
}

class _SemesterState extends State<Semester>  {

  /*var contents = const [];
  Future<List<SemesterContents>> _getSemesterContents() async {
     String content = await rootBundle.loadString('data/content.json');
     List<SemesterContents> collection = json.decode(content);
     List<SemesterContents> _content = collection.map((json)=>SemesterContents.fromJson(json)).toList();

     setState((){
       contents = _content;
     });
  }

  void initState(){
    _getSemesterContents();
    super.initState();
  }
  List<Semester> content;*/

  @override
  Widget build(BuildContext context) {
    List content;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: new Color(0xff3f51b5),
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.of(context).pop();
              }
            ),
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 4.0,
              tabs: [
                Tab(
                  child: Text("Handouts"),
                ),
                Tab(
                  child: Text("Past Papers"),
                ),
                Tab(
                  child: Text("Text Books"),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              new Card(
                  child: ListView.separated(
                  itemCount: 1,
                  separatorBuilder: (context, index)=>Divider(),
                  itemBuilder: (BuildContext context, int index){
                    return ListTile(
                      title: Text("first"),
                      //isThreeLine: true,
                      leading: CircleAvatar(
                        child: Icon(Icons.picture_as_pdf),
                      ),
                      onTap: (){},
                    );
                  },
                ),
                //color: Colors.white,
              ),
              new Card(
                child: new FutureBuilder(
                  future: DefaultAssetBundle.of(context).loadString('data/content.json'),
                  builder: (context, snapshot){

                    var mydata = jsonDecode(snapshot.data.toString());
                    return new ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(mydata[index]['name']),
                          leading: CircleAvatar(
                            child: Icon(Icons.picture_as_pdf),
                          ),
                        );
                      },
                      itemCount: mydata ==null? 0: mydata.length,
                    );
                  },
                ),
                color: Colors.white,
              ),
              new Card(
                child: new FutureBuilder(
                  future: DefaultAssetBundle.of(context).loadString('data/content.json'),
                  builder: (context, snapshot){
                    var mydata = json.decode(snapshot.data.toString());
                    return new ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(mydata['name']),
                          leading: CircleAvatar(
                            child: Icon(Icons.picture_as_pdf),
                          ),
                        );
                      },
                      itemCount: mydata ==null? 0: mydata.length,
                    );
                  },
                ),
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SemesterContents{
  final String name;

  SemesterContents(this.name);
  factory SemesterContents.fromJson(Map<String, dynamic> json){
    return SemesterContents(json["name"]);
  }
}

