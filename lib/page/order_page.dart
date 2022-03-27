import 'package:flutter/material.dart';
import 'package:flutter_amazone/domain/orders.dart';
import 'package:flutter_amazone/widget/drawer.dart';
import 'package:flutter_amazone/widget/order_list_tile.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orderData = Provider.of<Orders>(context);
    var orderList = orderData.getOrders();
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      drawer: CustomDrawer(),
      body: ListView.builder(
        itemBuilder: (context, index) => OrderListTile(index),
        itemCount: orderList.length,
      ),

    );
  }
}
