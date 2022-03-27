import 'package:flutter/material.dart';
import 'package:flutter_amazone/domain/orders.dart';
import 'package:flutter_amazone/domain/products.dart';
import 'package:provider/provider.dart';

class OrderListTile extends StatelessWidget {
  int index;
  OrderListTile(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orderData = Provider.of<Orders>(context);
    var orderList = orderData.orderList;
    //var productList = orderList.keys.elementAt(index).getShoppingList();
    return ListTile(
      title: Text(orderList[index].orderlist.elementAt(index).keys.elementAt(index).name.toString()),
    );
  }
}
