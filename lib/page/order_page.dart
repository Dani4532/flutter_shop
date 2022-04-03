import 'package:flutter/material.dart';
import 'package:flutter_amazone/domain/orders.dart';
import 'package:flutter_amazone/widget/drawer.dart';
import 'package:flutter_amazone/widget/order_list_tile.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    var orderData = Provider.of<Orders>(context);
    var orderList = orderData.getOrders();
    int count = 1;

    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: ExpansionPanelList(
                  expansionCallback: (index, expand) {
                    setState(() {
                      orderList[index].isExpanded = !expand;
                    });
                  },
                  children: orderList.map<ExpansionPanel>((order) {
                    return ExpansionPanel(
                      headerBuilder: (context, isExpanded) {
                        return ListTile(
                          title: Text('Order ' + (count++).toString()),
                          subtitle: Text(order.dateTime.day.toString() +'/'+ order.dateTime.month.toString() +'/'+ order.dateTime.year.toString()),
                          trailing: Text(order.price.toString()+ ' €'),
                        );
                      },
                      body: OrderListTile(order),
                      isExpanded: order.isExpanded,
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


