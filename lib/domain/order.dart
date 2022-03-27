import 'package:flutter_amazone/domain/product.dart';
import 'package:flutter_amazone/domain/products.dart';

class Order {
  List<Map<Product, int>> orderlist = [];
  DateTime dateTime = DateTime.now();

  Order({required this.orderlist});
}