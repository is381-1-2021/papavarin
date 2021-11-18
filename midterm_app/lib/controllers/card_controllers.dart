import 'dart:async';

import 'package:midterm_app/services/flashcard_services.dart';
import 'package:midterm_app/model/card_model.dart';

class CardController {
  final Services services;
  List<Card> cards = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  CardController(this.services);

  Future<List<Card>> fetchCards() async {
    onSyncController.add(true);
    cards = await services.getCards();
    onSyncController.add(false);

    return cards;
  }
}
