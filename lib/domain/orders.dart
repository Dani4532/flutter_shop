import 'package:flutter/material.dart';
import 'package:flutter_amazone/domain/order.dart';
import 'package:flutter_amazone/domain/product.dart';
import 'package:flutter_amazone/domain/products.dart';
import 'package:flutter_amazone/domain/shopping_cart.dart';

class Orders with ChangeNotifier{
 List <Order> orderList = [];

  List <Order> getOrders(){
    return orderList;
  }

  void addOrder(Map<Product,int> order, price){
    orderList.add(Order(orderlist: order, price: price));
    notifyListeners();
  }

}