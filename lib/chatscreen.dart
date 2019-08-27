import 'package:flutter/material.dart';
import 'package:mesapp/apiservices.dart';
import 'package:mesapp/login.dart';
import 'chatmessage.dart';

class ChatScreen extends StatefulWidget {
  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];

  void _handleSubmitted(String text) {
    if(text.isEmpty){

    }else{
      final post = {
        'message': text,
        'user_id': userId
      };

      ApiServices.addPost(post).then((success){
        
        String title, text;
        if (success){
          title = "Success";
          text = "Post submitted";
        }else{
          title = "Error";
          text = "Error while submitting your Post";
        }
      });
      _textController.clear();
      ChatMessage message = new ChatMessage(
        //text: text,
      );
      setState(() {
        _messages.insert(0, message);
      });
    }
    
  }

  Widget _textComposerWidget() {
    return new IconTheme(
      data: new IconThemeData(color: Colors.blue),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                decoration:
                new InputDecoration.collapsed(hintText: "Send a message"),
                controller: _textController,
                onSubmitted: _handleSubmitted,
              ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asset/images/backgroung.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: new Column(
          children: <Widget>[
            
            new Flexible(
              
              child: FutureBuilder(
                future: ApiServices.getPosts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    final posts = snapshot.data;
                    
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView.builder(
                        itemBuilder: (context, int index){
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
                                          //borderRadius: new BorderRadius.circular(10.0),
                                          //color: Colors.white,
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            new Text(
                                              posts[index]['user'],
                                              style: TextStyle(color: Colors.greenAccent)
                                            ) 
                                          ]
                                        ),
                                      ),
                                      new Container(
                                        margin: const EdgeInsets.all(20.0),
                                        child: new Text(posts[index]['message']),
                                      ),
                                      //Divider(),
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
                          
                      ),
                    );
                  }
                  return Center(child: CircularProgressIndicator(),);
                },
              ),
            ),
          new Divider(
            height: 1.0,
          ),
          new Container(
            decoration: new BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _textComposerWidget(),
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
