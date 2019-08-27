import 'package:flutter/material.dart';
import 'package:mesapp/apiservices.dart';

void main() {
  runApp(CommitteeMembers());
}
class CommitteeMembers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CommitteeMembers();
}

class _CommitteeMembers extends State<CommitteeMembers> {
//  List<String> _years = ['Please choose a year', '2015-2017', '2017-2018', '2018-2019', '2019-2020']; // Option 1
//  String _selectedYear = 'Please choose a year'; // Option 1
  List<String> _years = ['2015-2017', '2017-2018', '2018-2019', '2019-2020']; // Option 2
  String _selectedYear; // Option 2

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: (){
          Navigator.of(context).pop();
        },
        child: Scaffold(
          appBar: new AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.of(context).pop();
              }
            ),
            title: Column(
              children: <Widget>[
                DropdownButton(

                  hint: Text('2018-2019'),
                  value: _selectedYear,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedYear = newValue;
                    });
                  },
                  items: _years.map((year) {
                    return DropdownMenuItem(
                      child: new Text(
                        year
                      ),
                      value: year,
                    );
                  }).toList(),
                ),
              ],
            ),
        ),
        body: FutureBuilder(
            future: ApiServices.getCommitteeList(),
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
                        posts[index]['member_name'],
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      subtitle: new Text(
                        posts[index]['position'],
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
                            builder: (context) => Member(posts[index]['id'])
                          )
                        );
                      },
                    );
                  },
                  itemCount: posts.length,
                );
              }
              return Center(child: CircularProgressIndicator(),);
            }
          ),
        ),
      ),
    );
  }
}


class Member extends StatelessWidget {
  final int _id;

  Member(this._id);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.of(context).pop();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: FutureBuilder(
          future: ApiServices.getCommittee(_id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return new Container(
                color: Colors.white,
                child: ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        new Container(
                          height: 200.0,
                          color: Colors.white,
                          child: new Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: new Stack(fit: StackFit.loose, children: <Widget>[
                                  new Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Container(
                                          width: 140.0,
                                          height: 140.0,
                                          decoration: new BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: new DecorationImage(
                                              image: new ExactAssetImage(
                                                  'images/Me.jpg'),
                                              fit: BoxFit.cover,
                                            ),
                                          )),
                                    ],
                                  ),
                                ]),
                              )
                            ],
                          ),
                        ),
                        new Container(
                          color: Color(0xffFFFFFF),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 25.0),
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 0),
                                    child: new Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new Text(
                                              'Parsonal Information',
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new Text(
                                              'Name',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 10.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Flexible(
                                          child: new Text(
                                            snapshot.data['member_name'],
                                          ),
                                        ),
                                      ],
                                    )
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            child: new Text(
                                              'Email',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          flex: 3,
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: new Text(
                                              'Contact',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          flex: 2,
                                        ),
                                      ],
                                    )
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 15.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            child: new Text(
                                              snapshot.data['email'],
                                            ),
                                          ),
                                          flex: 3,
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: new Text(
                                              snapshot.data['contact'],

                                            ),
                                          ),
                                          flex: 2,
                                        ),
                                      ],
                                    )
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            child: new Text(
                                              'Place of Residence',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          flex: 3,
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: new Text(
                                              'Home Town',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          flex: 2,
                                        ),
                                      ],
                                    )
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 15.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            child: new Text(
                                              snapshot.data['residence'],
                                            ),
                                          ),
                                          flex: 3,
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: new Text(
                                              snapshot.data['home_town'],

                                            ),
                                          ),
                                          flex: 2,
                                        ),
                                      ],
                                    )
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            child: new Text(
                                              'Current Position',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          flex: 3,
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: new Text(
                                              'Former Position',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          flex: 2,
                                        ),
                                      ],
                                    )
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 15.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            child: new Text(
                                              snapshot.data['position'],
                                            ),
                                          ),
                                          flex: 3,
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: new Text(
                                              snapshot.data['former_role'],

                                            ),
                                          ),
                                          flex: 2,
                                        ),
                                      ],
                                    )
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            child: new Text(
                                              'Course',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          flex: 3,
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: new Text(
                                              'Year',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          flex: 2,
                                        ),
                                      ],
                                    )
                                  ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 15.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            child: new Text(
                                              snapshot.data['course'],
                                            ),
                                          ),
                                          flex: 3,
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: new Text(
                                              snapshot.data['study_year'],

                                            ),
                                          ),
                                          flex: 2,
                                        ),
                                      ],
                                    )
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            child: new Text(
                                              'High School',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          flex: 3,
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: new Text(
                                              'Primary School',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          flex: 2,
                                        ),
                                      ],
                                    )
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 15.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            child: new Text(
                                              snapshot.data['high_school'],
                                            ),
                                          ),
                                          flex: 3,
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: new Text(
                                              snapshot.data['primary_school'],

                                            ),
                                          ),
                                          flex: 2,
                                        ),
                                      ],
                                    )
                                  ),

                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                )
              );
            }
            return Center(child: CircularProgressIndicator(),);
          }
        )



        // new Container(
        // color: Colors.white,
        // child: new ListView(
        //   children: <Widget>[
        //     Column(
        //       children: <Widget>[
        //         new Container(
        //           height: 200.0,
        //           color: Colors.white,
        //           child: new Column(
        //             children: <Widget>[
        //               Padding(
        //                 padding: EdgeInsets.only(top: 20.0),
        //                 child: new Stack(fit: StackFit.loose, children: <Widget>[
        //                   new Row(
        //                     crossAxisAlignment: CrossAxisAlignment.center,
        //                     mainAxisAlignment: MainAxisAlignment.center,
        //                     children: <Widget>[
        //                       new Container(
        //                           width: 140.0,
        //                           height: 140.0,
        //                           decoration: new BoxDecoration(
        //                             shape: BoxShape.circle,
        //                             image: new DecorationImage(
        //                               image: new ExactAssetImage(
        //                                   'images/Me.jpg'),
        //                               fit: BoxFit.cover,
        //                             ),
        //                           )),
        //                     ],
        //                   ),
        //                 ]),
        //               )
        //             ],
        //           ),
        //         ),
        //         new Container(
        //           color: Color(0xffFFFFFF),
        //           child: Padding(
        //             padding: EdgeInsets.only(bottom: 25.0),
        //             child: new Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               mainAxisAlignment: MainAxisAlignment.start,
        //               children: <Widget>[
        //                 Padding(
        //                     padding: EdgeInsets.only(
        //                         left: 25.0, right: 25.0, top: 0),
        //                     child: new Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       mainAxisSize: MainAxisSize.max,
        //                       children: <Widget>[
        //                         new Column(
        //                           mainAxisAlignment: MainAxisAlignment.start,
        //                           mainAxisSize: MainAxisSize.min,
        //                           children: <Widget>[
        //                             new Text(
        //                               'Parsonal Information',
        //                               style: TextStyle(
        //                                   fontSize: 18.0,
        //                                   fontWeight: FontWeight.bold),
        //                             ),
        //                           ],
        //                         ),
        //                       ],
        //                     )
        //                   ),
        //                   Padding(
        //                     padding: EdgeInsets.only(
        //                         left: 25.0, right: 25.0, top: 25.0),
        //                     child: new Row(
        //                       mainAxisSize: MainAxisSize.max,
        //                       children: <Widget>[
        //                         new Column(
        //                           mainAxisAlignment: MainAxisAlignment.start,
        //                           mainAxisSize: MainAxisSize.min,
        //                           children: <Widget>[
        //                             new Text(
        //                               'Name',
        //                               style: TextStyle(
        //                                   fontSize: 16.0,
        //                                   fontWeight: FontWeight.bold),
        //                             ),
        //                           ],
        //                         ),
        //                       ],
        //                     )
        //                   ),
        //                   Padding(
        //                     padding: EdgeInsets.only(
        //                       left: 25.0, right: 25.0, top: 10.0),
        //                     child: new Row(
        //                       mainAxisSize: MainAxisSize.max,
        //                       children: <Widget>[
        //                         new Flexible(
        //                           child: new Text(
        //                             "Nicholaws"
        //                           ),
        //                         ),
        //                       ],
        //                     )
        //                   ),
        //                   Padding(
        //                     padding: EdgeInsets.only(
        //                         left: 25.0, right: 25.0, top: 25.0),
        //                     child: new Row(
        //                       mainAxisSize: MainAxisSize.max,
        //                       mainAxisAlignment: MainAxisAlignment.start,
        //                       children: <Widget>[
        //                         Expanded(
        //                           child: Container(
        //                             child: new Text(
        //                               'Email',
        //                               style: TextStyle(
        //                                   fontSize: 16.0,
        //                                   fontWeight: FontWeight.bold),
        //                             ),
        //                           ),
        //                           flex: 3,
        //                         ),
        //                         Expanded(
        //                           child: Container(
        //                             child: new Text(
        //                               'Contact',
        //                               style: TextStyle(
        //                                   fontSize: 16.0,
        //                                   fontWeight: FontWeight.bold),
        //                             ),
        //                           ),
        //                           flex: 3,
        //                         ),
        //                       ],
        //                     )
        //                   ),
        //                   Padding(
        //                     padding: EdgeInsets.only(
        //                         left: 25.0, right: 25.0, top: 2.0),
        //                     child: new Row(
        //                       mainAxisSize: MainAxisSize.max,
        //                       mainAxisAlignment: MainAxisAlignment.start,
        //                       children: <Widget>[
        //                         Flexible(
        //                           child: Padding(
        //                             padding: EdgeInsets.only(right: 10.0),
        //                             child: new Text(
        //                               "Bachelor os science in civil engineeering"

        //                             ),
        //                           ),
        //                           flex: 3,
        //                         ),
        //                         Flexible(
        //                           child: new Text(
        //                               "0758076965"
        //                             ),
        //                           flex: 3,
        //                         ),
        //                       ],
        //                     )
        //                   ),
        //                   Padding(
        //                     padding: EdgeInsets.only(
        //                         left: 25.0, right: 25.0, top: 25.0),
        //                     child: new Row(
        //                       mainAxisSize: MainAxisSize.max,
        //                       mainAxisAlignment: MainAxisAlignment.start,
        //                       children: <Widget>[
        //                         Expanded(
        //                           child: Container(
        //                             child: new Text(
        //                               'Place of Residence',
        //                               style: TextStyle(
        //                                   fontSize: 16.0,
        //                                   fontWeight: FontWeight.bold),
        //                             ),
        //                           ),
        //                           flex: 3,
        //                         ),
        //                         Expanded(
        //                           child: Container(
        //                             child: new Text(
        //                               'Home Town',
        //                               style: TextStyle(
        //                                   fontSize: 16.0,
        //                                   fontWeight: FontWeight.bold),
        //                             ),
        //                           ),
        //                           flex: 3,
        //                         ),
        //                       ],
        //                     )
        //                   ),
        //                   Padding(
        //                     padding: EdgeInsets.only(
        //                         left: 25.0, right: 25.0, top: 2.0),
        //                     child: new Row(
        //                       mainAxisSize: MainAxisSize.max,
        //                       mainAxisAlignment: MainAxisAlignment.start,
        //                       children: <Widget>[
        //                         Flexible(
        //                           child: Padding(
        //                             padding: EdgeInsets.only(right: 10.0),
        //                             child: new Text(
        //                               "kampala"

        //                             ),
        //                           ),
        //                           flex: 3,
        //                         ),
        //                         Flexible(
        //                           child: new Text(
        //                               "kampala"
        //                             ),
        //                           flex: 3,
        //                         ),
        //                       ],
        //                     )
        //                   ),
        //                   Padding(
        //                     padding: EdgeInsets.only(
        //                         left: 25.0, right: 25.0, top: 25.0),
        //                     child: new Row(
        //                       mainAxisSize: MainAxisSize.max,
        //                       mainAxisAlignment: MainAxisAlignment.start,
        //                       children: <Widget>[
        //                         Expanded(
        //                           child: Container(
        //                             child: new Text(
        //                               'Current Position',
        //                               style: TextStyle(
        //                                   fontSize: 16.0,
        //                                   fontWeight: FontWeight.bold),
        //                             ),
        //                           ),
        //                           flex: 3,
        //                         ),
        //                         Expanded(
        //                           child: Container(
        //                             child: new Text(
        //                               'Former Position',
        //                               style: TextStyle(
        //                                   fontSize: 16.0,
        //                                   fontWeight: FontWeight.bold),
        //                             ),
        //                           ),
        //                           flex: 3,
        //                         ),
        //                       ],
        //                     )
        //                   ),
        //                   Padding(
        //                     padding: EdgeInsets.only(
        //                         left: 25.0, right: 25.0, top: 2.0),
        //                     child: new Row(
        //                       mainAxisSize: MainAxisSize.max,
        //                       mainAxisAlignment: MainAxisAlignment.start,
        //                       children: <Widget>[
        //                         Flexible(
        //                           child: Padding(
        //                             padding: EdgeInsets.only(right: 10.0),
        //                             child: new Text(
        //                               "Bachelor os science in civil engineeering"

        //                             ),
        //                           ),
        //                           flex: 3,
        //                         ),
        //                         Flexible(
        //                           child: new Text(
        //                               "4"
        //                             ),
        //                           flex: 3,
        //                         ),
        //                       ],
        //                     )
        //                   ),
        //                   Padding(
        //                     padding: EdgeInsets.only(
        //                         left: 25.0, right: 25.0, top: 25.0),
        //                     child: new Row(
        //                       mainAxisSize: MainAxisSize.max,
        //                       mainAxisAlignment: MainAxisAlignment.start,
        //                       children: <Widget>[
        //                         Expanded(
        //                           child: Container(
        //                             child: new Text(
        //                               'Course',
        //                               style: TextStyle(
        //                                   fontSize: 16.0,
        //                                   fontWeight: FontWeight.bold),
        //                             ),
        //                           ),
        //                           flex: 3,
        //                         ),
        //                         Expanded(
        //                           child: Container(
        //                             child: new Text(
        //                               'Year',
        //                               style: TextStyle(
        //                                   fontSize: 16.0,
        //                                   fontWeight: FontWeight.bold),
        //                             ),
        //                           ),
        //                           flex: 3,
        //                         ),
        //                       ],
        //                     )
        //                   ),
        //                 Padding(
        //                     padding: EdgeInsets.only(
        //                         left: 25.0, right: 25.0, top: 2.0),
        //                     child: new Row(
        //                       mainAxisSize: MainAxisSize.max,
        //                       mainAxisAlignment: MainAxisAlignment.start,
        //                       children: <Widget>[
        //                         Flexible(
        //                           child: Padding(
        //                             padding: EdgeInsets.only(right: 10.0),
        //                             child: new Text(
        //                               "Bachelor os science in civil engineeering"

        //                             ),
        //                           ),
        //                           flex: 3,
        //                         ),
        //                         Flexible(
        //                           child: new Text(
        //                               "4"
        //                             ),
        //                           flex: 3,
        //                         ),
        //                       ],
        //                     )
        //                   ),
        //                   Padding(
        //                     padding: EdgeInsets.only(
        //                         left: 25.0, right: 25.0, top: 25.0),
        //                     child: new Row(
        //                       mainAxisSize: MainAxisSize.max,
        //                       mainAxisAlignment: MainAxisAlignment.start,
        //                       children: <Widget>[
        //                         Expanded(
        //                           child: Container(
        //                             child: new Text(
        //                               'High School',
        //                               style: TextStyle(
        //                                   fontSize: 16.0,
        //                                   fontWeight: FontWeight.bold),
        //                             ),
        //                           ),
        //                           flex: 3,
        //                         ),
        //                         Expanded(
        //                           child: Container(
        //                             child: new Text(
        //                               'Primary School',
        //                               style: TextStyle(
        //                                   fontSize: 16.0,
        //                                   fontWeight: FontWeight.bold),
        //                             ),
        //                           ),
        //                           flex: 3,
        //                         ),
        //                       ],
        //                     )
        //                   ),
        //                   Padding(
        //                     padding: EdgeInsets.only(
        //                         left: 25.0, right: 25.0, top: 2.0),
        //                     child: new Row(
        //                       mainAxisSize: MainAxisSize.max,
        //                       mainAxisAlignment: MainAxisAlignment.start,
        //                       children: <Widget>[
        //                         Flexible(
        //                           child: Padding(
        //                             padding: EdgeInsets.only(right: 10.0),
        //                             child: new Text(
        //                               "Bachelor os science in civil engineeering"

        //                             ),
        //                           ),
        //                           flex: 3,
        //                         ),
        //                         Flexible(
        //                           child: new Text(
        //                               "4"
        //                             ),
        //                           flex: 3,
        //                         ),
        //                       ],
        //                     )
        //                   ),

        //               ],
        //             ),
        //           ),
        //         )
        //       ],
        //     ),
        //   ],
        // ),
      ),
    );
  }
}