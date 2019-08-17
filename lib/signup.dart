import 'package:flutter/material.dart';
import 'package:mesapp/news.dart';

class SignUp extends StatefulWidget {
  static String tag = 'sigup-page';
  _SignUpState createState() => new _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('images/logo.png'),
      ),
    );

    final first_name = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      initialValue: 'Fisrt Name',
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
    final last_name = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      initialValue: 'Last Name',
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
    final course = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      initialValue: 'Course',
      decoration: InputDecoration(
        hintText: 'Course',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: 'julisema4@gmail.com',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
    final password_1 = TextFormField(
      autofocus: false,
      initialValue: 'paswordAdmin',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
    final password = TextFormField(
      autofocus: false,
      initialValue: 'paswordAdmin',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );

    final back_to_login = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        onPressed: () {
          Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new HomePage()));
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Sign Me Up', style: TextStyle(color: Colors.white)),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 40.0),
          children: <Widget>[
            logo,
            SizedBox(height: 30.0),
            first_name,
            SizedBox(height: 30.0),
            last_name,
            SizedBox(height: 30.0),
            course,
            SizedBox(height: 30.0),
            email,
            SizedBox(height: 30.0),
            password,
            SizedBox(height: 30.0),
            password_1,
            SizedBox(height: 24.0),
            back_to_login
          ],
        ),
      ),
    );
  }
}
