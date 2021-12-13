import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Cal {
  final String equatation;

  Cal(this.equatation);

  factory Cal.fromJson(
    Map<String, dynamic> json,
  ) {
    return Cal(
      json['equatation'] as String,
    );
  }
}

class AllCals {
  final List<Cal> cals;

  AllCals(this.cals);

  factory AllCals.fromJson(
    List<dynamic> json,
  ) {
    var x = json.map((record) => Cal.fromJson(record)).toList();

    return AllCals(x);
  }

  factory AllCals.fromSnapshot(QuerySnapshot snapshot) {
    var x = snapshot.docs.map((record) {
      return Cal.fromJson(record.data() as Map<String, dynamic>);
    }).toList();
    return AllCals(x);
  }
}

class CalculatorModel extends ChangeNotifier {
  List<String> cal = <String>[];
}
