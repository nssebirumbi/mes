import 'package:flutter/material.dart';

// class CommitteeMembers extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: new AppBar(
//         title: new Text("Committee Members"),
//       ),
//       body: new Container(

//       ),
//     );
//   }
// }
class CommitteeMembers extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _CommitteeMembers createState() => new _CommitteeMembers();
}
class _CommitteeMembers extends State<CommitteeMembers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Committee Members"),
      ),
      body: new Container(
      ),
    );
  }
}