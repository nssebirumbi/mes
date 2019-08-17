import 'package:flutter/material.dart';

class SingleAward extends StatelessWidget {
  static String tag = 'Award-Page';

  @override
  Widget build(BuildContext context) {
    final pic = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: new Image(
          image: AssetImage('images/politics.jpg')
        )
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Welcome Alucard',
        style: TextStyle(fontSize: 28.0, color: Colors.black87),
      ),
    );

    final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec hendrerit condimentum mauris id tempor. Praesent eu commodo lacus. Praesent eget mi sed libero eleifend tempor. Sed at fringilla ipsum. Duis malesuada feugiat urna vitae convallis. Aliquam eu libero arcu.',
        style: TextStyle(fontSize: 16.0, color: Colors.black),
        textAlign: TextAlign.justify,
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.white,
          Colors.white24,
        ]),
      ),
      child: Column(
        children: <Widget>[pic, welcome, lorem],
      ),
    );

    return Scaffold(
      appBar: new AppBar(
          
      ),
      body: body,
    );
  }
}
