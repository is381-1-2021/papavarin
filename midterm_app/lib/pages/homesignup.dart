// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:midterm_app/pages/login.dart';
// import 'package:midterm_app/pages/signup.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Register/login"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(100, 100, 100, 100),
//         child: Column(
//           children: [
//             SizedBox(
//               width: 200,
//               child: ElevatedButton.icon(
//                   onPressed: () {
//                     Navigator.pushReplacement(context,
//                         MaterialPageRoute(builder: (context) {
//                       return SignupPage();
//                     }));
//                   },
//                   icon: Icon(Icons.add),
//                   label: Text("sign up", style: TextStyle(fontSize: 20))),
//             ),
//             SizedBox(
//               width: 200,
//               child: ElevatedButton.icon(
//                   onPressed: () {
//                     Navigator.pushReplacement(context,
//                         MaterialPageRoute(builder: (context) {
//                       return LoginPage();
//                     }));
//                   },
//                   icon: Icon(Icons.login),
//                   label: Text("log in", style: TextStyle(fontSize: 20))),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
