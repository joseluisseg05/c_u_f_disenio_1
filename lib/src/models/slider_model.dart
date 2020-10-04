import 'package:flutter/material.dart';

class SliderModel with ChangeNotifier {
  double _currentPage = 0.0;

  double get curretPage => this._currentPage;

  set curretPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }
}
