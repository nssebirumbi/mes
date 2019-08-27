import 'package:flutter/material.dart';
import 'package:mesapp/apiservices.dart';
import 'package:mesapp/login.dart';

String userId;
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  
  bool _isLoading = false;
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _contactController = new TextEditingController();
  TextEditingController _courseController = new TextEditingController();
  TextEditingController _yearController = new TextEditingController();
  TextEditingController _confirmPasswordController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.of(context).pop();
      },
      child: Scaffold(
          body: Container(
            child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: SingleChildScrollView (
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(height: 20,),
                  Hero(
                    tag: 'hero',
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 72.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                  Container(height: 20,),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'First and Last Name'
                    ),
                    controller: _nameController,
                  ),
                  Container(height: 20,),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Contact'
                    ),
                    controller: _contactController,
                  ),
                  Container(height: 20,),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Course'
                    ),
                    controller: _courseController,
                  ),
                  Container(height: 20,),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Year'
                    ),
                    controller: _yearController,
                  ),
                  Container(height: 20,),
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
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password'
                    ),
                    controller: _confirmPasswordController,
                  ),
                  Container(height: 20,),
                  _isLoading ? CircularProgressIndicator() : SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        setState(() {
                          _isLoading = true;
                        });
                        final user = {
                          'name': _usernameController.text,
                          'contact': _contactController.text,
                          'username':_usernameController.text,
                          'password':_passwordController.text,
                          'course':_courseController.text,
                          'year':_yearController.text
                        };

                        ApiServices.addUser(user).then((success) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage()
                            )
                          );
                          setState(() {
                            _isLoading = false;
                          });

                        });

                      },
                    ),

                  ),
                  Container(height: 20,),
                  _isLoading ? CircularProgressIndicator() : SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        'Back to Login',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage()
                          )
                        );
                      },
                    ),
                  ),
                  Container(height: 20,),
                  Container(height: 20,)
                ],
              ),
            ),
          )
        )
      ),
    );
  }
}
