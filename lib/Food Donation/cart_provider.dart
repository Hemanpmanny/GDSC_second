import 'package:flutter/material.dart';

class Cartprovider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];

  void addproduct(Map<String, dynamic> product) {
    cart.add(product);
    notifyListeners(); //it's important to mention
  }

  void removeproduct(Map<String, dynamic> product) {
    cart.remove(product);
    notifyListeners();
  }
}
