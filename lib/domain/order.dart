import 'package:flutter_amazone/domain/product.dart';
import 'package:flutter_amazone/domain/products.dart';

class Order {
  Map<Product, int> orderlist = {};
  double price = 0.0;
  DateTime dateTime = DateTime.now();

  Order({required this.orderlist, required this.price});
}