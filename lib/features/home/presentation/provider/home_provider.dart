import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int _current = 0;
  int get current => _current;
  set setCurrent(val) {
    _current = val;
    notifyListeners();
  }
}
