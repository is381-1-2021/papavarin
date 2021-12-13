import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:midterm_app/pages/calculator.dart';
import 'package:midterm_app/services/calculator_services.dart';

class HistoPage extends StatefulWidget {
  const HistoPage({Key? key}) : super(key: key);

  @override
  _HistoPageState createState() => _HistoPageState();
}

class _HistoPageState extends State<HistoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
        actions: [
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CalculatorPage(),
                    ));
              }),
          // IconButton(
          //   icon: Icon(Icons.refresh),
          //   onPressed: () {},
          // )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("peiing_calculator")
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: snapshot.data!.docs.map<Widget>((document) {
                  return Container(
                      child: ListTile(
                    leading: CircleAvatar(
                      radius: 50,
                      child: FittedBox(
                        child: Text(document["equation"]),
                      ),
                    ),
                    title: Text(document["equation + buttonText"]),
                  ));
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
