import 'package:flutter/material.dart';
import 'package:flutter_amazone/domain/order.dart';
import 'package:flutter_amazone/domain/orders.dart';
import 'package:flutter_amazone/domain/products.dart';
import 'package:provider/provider.dart';

class OrderListTile extends StatelessWidget {

  Order order;
  OrderListTile(this.order, {Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    var orderData = Provider.of<Orders>(context);
    var orderList = orderData.orderList;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          fit: FlexFit.loose,
          child: ListView.builder(
            itemBuilder: (context, index) => ListTile(
              title: Text(order.productList[index].name),
              trailing: Text(order.anzahlList[index].toString()),
            ),
            itemCount: order.productList.length,
            shrinkWrap: true,
          ),
        ),
      ],
    );
  }
}


/*
ListView.builder(
        itemBuilder: (context, index) => OrderListTile(index),
        itemCount: orderList.length,
      ),
 */



