import 'package:flutter/material.dart';
import 'package:mesapp/apiservices.dart';
import 'package:mesapp/login.dart';
import 'package:mesapp/news.dart';

// class SignUp extends StatefulWidget {
//   static String tag = 'sigup-page';
//   _SignUpState createState() => new _SignUpState();
// }

// class _SignUpState extends State<SignUp> {

//   bool _isLoading = false;
//   TextEditingController _usernameController = new TextEditingController();
//   TextEditingController _passwordController = new TextEditingController();
//   TextEditingController _contactController = new TextEditingController();
//   TextEditingController _courseController = new TextEditingController();
//   TextEditingController _yearController = new TextEditingController();
//   TextEditingController _confirmPasswordController = new TextEditingController();
//   TextEditingController _nameController = new TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final logo = Hero(
//       tag: 'hero',
//       child: CircleAvatar(
//         backgroundColor: Colors.transparent,
//         radius: 48.0,
//         child: Image.asset('images/logo.png'),
//       ),
//     );

//     final first_name = TextFormField(
//       keyboardType: TextInputType.text,
//       autofocus: false,
//       initialValue: 'Fisrt Name',
//       decoration: InputDecoration(
//         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
//       ),
//     );
//     final last_name = TextFormField(
//       keyboardType: TextInputType.text,
//       autofocus: false,
//       initialValue: 'Last Name',
//       decoration: InputDecoration(
//         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
//       ),
//     );
//     final course = TextFormField(
//       keyboardType: TextInputType.text,
//       autofocus: false,
//       initialValue: 'Course',
//       decoration: InputDecoration(
//         hintText: 'Course',
//         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
//       ),
//     );
//     final email = TextFormField(
//       keyboardType: TextInputType.emailAddress,
//       autofocus: false,
//       initialValue: 'julisema4@gmail.com',
//       decoration: InputDecoration(
//         hintText: 'Email',
//         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
//       ),
//     );
//     final password_1 = TextFormField(
//       autofocus: false,
//       initialValue: 'paswordAdmin',
//       obscureText: true,
//       decoration: InputDecoration(
//         hintText: 'Password',
//         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
//       ),
//     );
//     final password = TextFormField(
//       autofocus: false,
//       initialValue: 'paswordAdmin',
//       obscureText: true,
//       decoration: InputDecoration(
//         hintText: 'Password',
//         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
//       ),
//     );

//     final back_to_login = Padding(
//       padding: EdgeInsets.symmetric(vertical: 16.0),
//       child: RaisedButton(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(14),
//         ),
//         onPressed: () {
//           Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new HomePage()));
//         },
//         padding: EdgeInsets.all(12),
//         color: Colors.lightBlueAccent,
//         child: Text('Sign Me Up', style: TextStyle(color: Colors.white)),
//       ),
//     );
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: ListView(
//           shrinkWrap: true,
//           padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 40.0),
//           children: <Widget>[
//             logo,
//             SizedBox(height: 30.0),
//             Hero(
//               tag: 'hero',
//               child: CircleAvatar(
//                 backgroundColor: Colors.transparent,
//                 radius: 72.0,
//                 child: Image.asset('images/logo.png'),
//               ),
//             ),
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Username'
//               ),
//               controller: _usernameController,
//             ),
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Password'
//               ),
//               controller: _passwordController,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
    return Scaffold(
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
    );
  }
}
