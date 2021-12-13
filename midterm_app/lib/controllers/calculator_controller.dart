import 'dart:async';

import 'package:midterm_app/model/calculator_model.dart';
import 'package:midterm_app/services/calculator_services.dart';

var services = FirebaseServices();
var controller = CalculatorController(services);

class CalculatorController {
  final Services services;
  List<Cal> cals = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  CalculatorController(this.services);

  Future<List<Cal>> fetchCals() async {
    onSyncController.add(true);
    cals = await services.getCals();
    onSyncController.add(false);

    return cals;
  }
}
