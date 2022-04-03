import 'package:flutter_amazone/domain/product.dart';
import 'package:flutter_amazone/domain/products.dart';

class Order {
  List<Product> productList = [];
  List<int> anzahlList = [];
  double price = 0.0;
  DateTime dateTime = DateTime.now();
  bool isExpanded = false;

  Order({required this.productList, required this.anzahlList, required this.price});
}