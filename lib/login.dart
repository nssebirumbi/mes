import 'package:flutter/material.dart';
import 'package:mesapp/apiservices.dart';
import 'package:mesapp/signup.dart';
import 'package:mesapp/news.dart';
// class LoginPagePage extends StatefulWidget {
//   static String tag = 'LoginPage-page';
//   @override
//   _LoginPagePageState createState() => new _LoginPagePageState();
// }
// class _LoginPagePageState extends State<LoginPagePage> {
//   TextEditingController _usernameController = new TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     /**
//      * Back-ground Image for the LoginPage Page But has Miss Behaved for now
//      */
//     // return Scaffold(
//     //   body: Container(
//     //     decoration: BoxDecoration(
//     //       image: DecorationImage(
//     //         image: AssetImage("assets/images/bulb.jpg"),
//     //         fit: BoxFit.cover,
//     //       ),
//     //     ),
//     //     child: null /* add child content here */,
//     //   ),
//     // );
//     final logo = Hero(
//       tag: 'hero',
//       child: CircleAvatar(
//         backgroundColor: Colors.transparent,
//         radius: 72.0,
//         child: Image.asset('images/logo.png'),
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

//     final LoginPageButton = Padding(
//       padding: EdgeInsets.symmetric(vertical: 16.0),
//       child: RaisedButton(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(24),
//         ),
//         onPressed: () async {
//           final users = await ApiServices.getUserList();
//           // if(users == null){

//           // }else{
//           //   users.any((u)=> u['username']== _usernameController.text)
//           // }


//           // setState(() {
//           //   _isLoading = true;
//           // });
//           // final users = await ApiService.getUserList();
//           // setState(() {
//           //   _isLoading = false;
//           // });
//           if (users == null) {
//             showDialog(
//               context: context,
//               builder: (context) {
//                 return AlertDialog(
//                   title: Text('Error'),
//                   content: Text("Check your internet connection"),
//                   actions: <Widget>[
//                     FlatButton(
//                       child: Text('Ok'),
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                     )
//                   ],
//                 );
//               }
//             );
//             return;
//           } else {
//             final userWithUsernameExists = users.any((u) => u['username'] == _usernameController.text);
//             if (userWithUsernameExists) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => HomePage()
//                 )
//               );
//             } else {                                                                                                                                                                                                                                                                                    
//               showDialog(
//                 context: context,
//                 builder: (context) {
//                   return AlertDialog(
//                     title: Text('Incorrect username'),
//                     content: Text('Try with a different username'),
//                     actions: <Widget>[
//                       FlatButton(
//                         child: Text('Ok'),
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                       )
//                     ],
//                   );
//                 }
//               );
//             }
//           }

//           //Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new HomePage()));
//         },
//         padding: EdgeInsets.all(12),
//         color: Colors.lightBlueAccent,
//         child: Text('Log In', style: TextStyle(color: Colors.white)),
//       ),
//     );

//     final forgotLabel = FlatButton(
//       child: Text(
//         'Create Account?',
//         style: TextStyle(color: Colors.black54),
//       ),
//       onPressed: () {
//         Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new SignUp()));
//       },
//     );

//     final body = Container(
//       width: MediaQuery.of(context).size.width,
//       //padding: EdgeInsets.all(10.0),
//       padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 10.0),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(colors: [
//           Colors.white,
//           Colors.white24,
//         ]),
//       ),
//       child: Column(
//         children: <Widget>[
//           logo,
//           SizedBox(height: 48.0),
//           email,
//           SizedBox(height: 18.0),
//           password,
//           SizedBox(height: 24.0),
//           LoginPageButton,
//           forgotLabel
//         ],
//       ),
//     );

    // return Scaffold(
    //   //backgroundColor: Colors.white, //#00c9b7
    //   backgroundColor: Color.fromRGBO(100, 255, 255, 0.4),
    //   body: body,
    //   // body: Center(
    //   //   child: ListView(
    //   //     shrinkWrap: true,
    //   //     padding: EdgeInsets.only(left: 24.0, right: 24.0),
    //   //     children: <Widget>[
    //   //       logo,
    //   //       SizedBox(height: 48.0),
    //   //       email,
    //   //       SizedBox(height: 18.0),
    //   //       password,
    //   //       SizedBox(height: 24.0),
    //   //       LoginPageButton,
    //   //       forgotLabel
    //   //     ],
    //   //   ),
    //   // ),
//     );
//   }
// }


// class User {
//   final String name;
//   final String email;

//   User(this.name, this.email);

//   User.fromJson(Map<String, dynamic> json)
//       : name = json['name'],
//         email = json['email'];

//   Map<String, dynamic> toJson() =>
//     {
//       'name': name,
//       'email': email,
//     };
// }


// class Posts extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  bool _isLoading = false;
  TextEditingController _usernameController = new TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Username'
              ),
              controller: _usernameController,
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
                    final userWithUsernameExists = users.any((u) => u['username'] == _usernameController.text);
                    if (userWithUsernameExists) {
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
            )
          ],
        ),
      ),
    );
  }
}

class Posts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

class Urls{
  static const BASE_URL = "http://mes.mubali.net/api";
}
