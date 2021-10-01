import 'package:flutter/material.dart';

class FormModel extends ChangeNotifier {
  String? _English;
  String? _Thai;

  get English => this._English;

  set English(value) {
    this._English = value;
    notifyListeners();
  }

  get Thai => this._Thai;

  set Thai(value) {
    this._Thai = value;
    notifyListeners();
  }
}
