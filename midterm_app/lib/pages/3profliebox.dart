import 'package:flutter/material.dart';
import 'package:midterm_app/controllers/card_controllers.dart';
import 'package:midterm_app/pages/editFirstName.dart';
import 'package:midterm_app/services/flashcard_services.dart';

var services = FirebaseServices();
var controller = CardController(services);

class ProfileBox extends StatefulWidget {
  String title;
  String data;

  ProfileBox(
    this.title,
    this.data,
  );

  @override
  _ProfileBoxState createState() => _ProfileBoxState();
}

class _ProfileBoxState extends State<ProfileBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(color: Colors.white),
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: TextStyle(fontSize: 22, color: Colors.black87),
          ),
          Expanded(
            child: Text(
              widget.data,
              style: TextStyle(fontSize: 20, color: Colors.blueAccent),
              textAlign: TextAlign.right,
            ),
          ),
          Tab(
              icon: Icon(
            Icons.chevron_right,
            color: Colors.blueAccent,
          ))
        ],
      ),
    ));
  }
}
