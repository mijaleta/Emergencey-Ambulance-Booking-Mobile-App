import 'package:flutter/material.dart';

class RequestProvider extends ChangeNotifier {
  int _requestCount = 0;

  int getRequestCount() {
    return _requestCount;
  }

  void addRequest() {
    _requestCount++;
    notifyListeners();
  }
}
