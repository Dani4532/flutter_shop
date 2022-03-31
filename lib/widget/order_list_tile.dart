import 'package:flutter/material.dart';
import 'package:flutter_amazone/domain/order.dart';
import 'package:flutter_amazone/domain/orders.dart';
import 'package:flutter_amazone/domain/products.dart';
import 'package:provider/provider.dart';

class OrderListTile extends StatefulWidget {
  int index;

  OrderListTile(this.index, {Key? key}) : super(key: key);

  @override
  State<OrderListTile> createState() => _OrderListTileState();
}

class _OrderListTileState extends State<OrderListTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    var orderData = Provider.of<Orders>(context);
    var orderList = orderData.orderList;
    //var productList = orderList.keys.elementAt(index).getShoppingList();

    return Container(
        child: ExpansionPanelList(
          expansionCallback: (index, expand) {
            setState(() {
              this.isExpanded = !expand;
            });
          },
          children: orderList.map<ExpansionPanel>((order) {
            return ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return ListTile(
                  title: Text('Test'),
                );
              },
              body: ListTile(),
              isExpanded: isExpanded,
            );
          }).toList(),
        ),
      );
  }
}
