import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:http/http.dart';
import 'package:midterm_app/model/calculator_model.dart';

abstract class Services {
  Future<List<Cal>> getCals();
}

class FirebaseServices extends Services {
  @override
  Future<List<Cal>> getCals() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('peiing_calculator').get();

    var all = AllCals.fromSnapshot(snapshot);
    return all.cals;
  }
}

class HttpServices extends Services {
  Client client = Client();

  Future<List<Cal>> getCals() async {
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load todos');
    }
    var all = AllCals.fromJson(json.decode(response.body));

    return all.cals;
  }
}
