import 'package:diet/pages/my_home.dart';
import 'package:flutter/material.dart';


class PageNotifier extends ChangeNotifier {
  String _currentPage = MyHomePage.pageName;

  String get currentPage => _currentPage;

  void goToMain() {
    _currentPage = MyHomePage.pageName;
    notifyListeners();
  }

  void goToOtherPage(String name) {
    _currentPage = name;
    notifyListeners();
  }
}