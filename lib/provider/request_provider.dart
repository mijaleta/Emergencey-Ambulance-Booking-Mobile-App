// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:ambu_app/models/request.dart'; // Import the Request model if available

class RequestProvider extends ChangeNotifier {
  List<Request> _requests = []; // List to store requests

  int get requestCount =>
      _requests.length; // Getter to retrieve the count of requests

  List<Request> get requests =>
      _requests; // Getter to retrieve the list of requests

  void addRequest(Request request) {
    _requests.add(request); // Add a new request to the list
    notifyListeners(); // Notify listeners of the change
  }

  // Method to retrieve the list of requests
  List<Request> getRequests() {
    return List.from(
        _requests); // Return a copy of the list to prevent direct modification
  }

  // You can add more methods here to modify or retrieve requests as needed
}
