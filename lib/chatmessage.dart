import 'package:flutter/material.dart';

const String _name = " Julius";

class ChatMessage extends StatelessWidget {
  final String text;
  ChatMessage({this.text});

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: myBoxDecoration(),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // new Container(
          //   margin: const EdgeInsets.fromLTRB(20.0,0.0,16.0,2.0),
          //   child: new CircleAvatar(
          //     child: new Text(_name[0]),
          //   ),
          // ),
          Container(
            
                child: Expanded(
                child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: new BoxDecoration(
                      //borderRadius: new BorderRadius.circular(16.0),
                      color: Colors.blueGrey,
                    ),
                      child: Row(
                      children: <Widget>[
                        new Text(_name,
                        style: TextStyle(color: Colors.white)
                        ) 
                        ]
                      ),
                  ),
                  new Container(
                    margin: const EdgeInsets.all(20.0),
                    child: new Text(text),
                  ),
                  Divider(),
                  new Container(
                    margin: const EdgeInsets.all(0.0),
                    child: Container(
                        margin: const EdgeInsets.all(0.0),
                        child: new IconButton(
                        icon: new Icon(Icons.comment),
                        onPressed: () => {},
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
