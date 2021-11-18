import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';
import 'package:midterm_app/model/card_model.dart';

abstract class Services {
  Future<List<Card>> getCards();
}

class FirebaseServices extends Services {
  @override
  Future<List<Card>> getCards() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('fc_cards').get();

    var all = AllCards.fromSnapshot(snapshot);
    return all.cards;
  }
}

class HttpServices extends Services {
  Client client = Client();

  Future<List<Card>> getCards() async {
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load cards');
    }
    var all = AllCards.fromJson(json.decode(response.body));

    return all.cards;
  }
}
