import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String name;
  final String url;
  final double price;
  final String desc;
  var fav = false;

  Product({
    required this.name,
    required this.url,
    required this.price,
    required this.desc,
  });

  void changeFav() {
    fav = !fav;

    notifyListeners();
  }
}
