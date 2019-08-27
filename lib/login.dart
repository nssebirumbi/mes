import 'package:flutter/material.dart';
import 'package:mesapp/apiservices.dart';
import 'package:mesapp/signup.dart';
import 'package:mesapp/news.dart';
import 'package:shared_preferences/shared_preferences.dart';

String userId;
String userName;
String userEmail;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  bool _isLoading = false;
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  savePref(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setInt("value", value);
      prefs.commit();
    });
  }

  saveName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString("name", name);
      prefs.commit();
    });
  }

  saveEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString("email", email);
      prefs.commit();
    });
  }

  saveId(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString("id", id);
      prefs.commit();
    });
  }



  var value;
  getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      value = prefs.getInt("value");
      userEmail = prefs.getString("email");
      userName = prefs.getString("name");
      userId = prefs.getString("id");
      print(userName);

      if (value==1) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new HomePage()));
      } else {
//      Navigator.of(context).pushReplacement(
//          new MaterialPageRoute(builder: (context) => LoginPage()));
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView  (
              child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(height: 40,),
              Hero(
                tag: 'hero',
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 72.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              Container(height: 50,),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Username'
                ),
                controller: _usernameController,
              ),
              Container(height: 20,),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password'
                ),
                controller: _passwordController,
              ),
              Container(height: 20,),
              _isLoading ? CircularProgressIndicator() : SizedBox(
                height: 40,
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    'Log in',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    setState(() {
                      _isLoading = true;
                    });
                    
                    final users = await ApiServices.getUserList();
                    setState(() {
                      _isLoading = false;
                    });

                    if (users == null) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text("Check your internet connection"),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('Ok'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          );
                        }
                      );
                      return;
                    } else {
                      final user = users.where((u) => u['username'] == _usernameController.text && u['password']== _passwordController.text).first ;
                      final userWithUsernameExists = user != null;
                      if (userWithUsernameExists) {
                        userId = user['id'].toString();
                        userName = user['name'].toString();
                        userEmail = user['email'].toString();
                        savePref(1);
                        saveName(userName);
                        saveEmail(userEmail);
                        saveId(userId);
//                        saveLogin(user['username'].toString(), user['password'].toString());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage()
                          )
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Incorrect username'),
                              content: Text('Try with a different username'),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('Ok'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            );
                          }
                        );
                      }
                    }
                  },
                ),
              ),
              FlatButton(
                child: Text(
                  'Create Account?',
                  style: TextStyle(color: Colors.black54),
                ),
                onPressed: () {
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new SignUp()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Urls{
  static const BASE_URL = "http://mes.mubali.net/api";
}

class Id{
  String userId;
}