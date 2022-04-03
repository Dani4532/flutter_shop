import 'package:flutter/material.dart';
import 'package:flutter_amazone/domain/order.dart';

class OrderListTile extends StatelessWidget {

  Order order;
  OrderListTile(this.order, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
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




