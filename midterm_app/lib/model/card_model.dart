import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Card {
  final String name;
  final String subject;

  Card(this.name, this.subject);

  factory Card.fromJson(
    Map<String, dynamic> json,
  ) {
    return Card(
      json['name'] as String,
      json['subject'] as String,
    );
  }
}

class AllCards {
  final List<Card> cards;

  AllCards(this.cards);

  factory AllCards.fromJson(
    List<dynamic> json,
  ) {
    var x = json.map((record) => Card.fromJson(record)).toList();

    return AllCards(x);
  }

  factory AllCards.fromSnapshot(QuerySnapshot snapshot) {
    var x = snapshot.docs.map((record) {
      return Card.fromJson(record.data() as Map<String, dynamic>);
    }).toList();
    return AllCards(x);
  }
}
