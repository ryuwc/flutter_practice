import 'package:flutter/cupertino.dart';

class CountControllerWithProvider extends ChangeNotifier {
  int count = 0;

  void increse() {
    count++;
    notifyListeners();
  }
}
