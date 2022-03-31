import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  String name;
  String url;
  double price;
  String desc;
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
