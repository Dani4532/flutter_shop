import 'package:flutter/material.dart';
import 'package:flutter_amazone/domain/order.dart';
import 'package:flutter_amazone/domain/product.dart';

class Orders with ChangeNotifier{
 List <Order> orderList = [];

  List <Order> getOrders(){
    return orderList;
  }

  void addOrder(List<Product> order, List<int> anzahl, price){
    orderList.add(Order(productList: order, anzahlList: anzahl,  price: price));
    notifyListeners();
  }

}