import 'package:flutter/material.dart';
import 'package:flutter_amazone/domain/product.dart';
import 'package:flutter_amazone/domain/shopping_cart_class.dart';

class ShoppingCart with ChangeNotifier {
  Map<Product,int> _productList = {};
  double price = 0.0;



  setPreis() {
    price = 0.0;
    _productList.entries.toList().forEach((element) {
      price += element.key.price * element.value;
    });
  }

  double getPreis() {
    return price;
  }

  removeProduct(var entry){
    _productList.removeWhere((key, value) => key == entry.key);
    setPreis();
    notifyListeners();
  }

   Map<Product,int>getShoppingList() {
    return _productList;
  }
}
