// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// Future<Post> fetchPost() async {
//   final response =
//       await http.get('http://mes.mubali.net/api/types/3/news/259');

//   if (response.statusCode == 200) {
//     // If the call to the server was successful, parse the JSON.
//     return Post.fromJson(json.decode(response.body));
//   } else {
//     // If that call was not successful, throw an error.
//     throw Exception('Failed to load post');
//   }
// }

// class Post {
//   final String title;
//   final String body;

//   Post({this.title, this.body});

//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
      
//       title: json['headline'],
//       body: json['content'],
//     );
//   }
// }

// class SingleNews extends StatelessWidget {
//   final Future<Post> post;

//   SingleNews({Key key, this.post}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
          
//         ),
//         body: Container(
//           padding: EdgeInsets.all(10.0),
//           decoration: BoxDecoration(
//             gradient: LinearGradient(colors: [
//               Colors.white,
//               Colors.white24,
//             ]),
//           ),
//           child: FutureBuilder<Post>(
//             future: post,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Column(
//                   children: <Widget>[
//                     Hero(
//                       tag: 'hero',
//                       child: Padding(
//                         padding: EdgeInsets.all(5.0),
//                         child: new Image(
//                           image: AssetImage('images/politics.jpg')
//                         )
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text(
//                         snapshot.data.title,
//                         style: TextStyle(fontSize: 28.0, color: Colors.black87),
//                       )
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text(
//                         snapshot.data.body,
//                         style: TextStyle(fontSize: 16.0, color: Colors.black),
//                         textAlign: TextAlign.justify,
//                       )
//                     )
                    
//                   ],
//                 );
//                 //Text(snapshot.data.title);
//               } else if (snapshot.hasError) {
//                 return Text("${snapshot.error}");
//               }

//               // By default, show a loading spinner.
//               return CircularProgressIndicator();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
