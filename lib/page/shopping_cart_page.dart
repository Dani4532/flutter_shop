import 'package:flutter/material.dart';
import 'package:flutter_amazone/domain/counter.dart';
import 'package:flutter_amazone/domain/orders.dart';
import 'package:flutter_amazone/domain/product.dart';
import 'package:flutter_amazone/domain/shopping_cart.dart';
import 'package:provider/provider.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    var ordersData = Provider.of<Orders>(context);
    var counterData = Provider.of<Counter>(context);
    //var orderList = ordersData.getOrders();
    var shoppingData = Provider.of<ShoppingCart>(context);
    var shoppingCart = shoppingData.getShoppingList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Card(
              margin: EdgeInsets.all(10.0),
              child: ListTile(
                leading: Text(
                  'Total',
                  style: TextStyle(fontSize: 20),
                ),
                trailing: SizedBox(
                  width: 300,
                  height: 250,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.yellow,
                        ),
                        child: Text(
                          shoppingData.getPreis().toString(),
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if(shoppingCart.isEmpty){

                              }else {
                                var order = shoppingCart.keys.toList();
                                var anzahl = shoppingCart.values.toList();
                                var price = shoppingData.price;
                                ordersData.addOrder(order, anzahl, price);
                                shoppingCart.clear();
                                shoppingData.price = 0.0;
                                counterData.reset();
                              }
                            });
                          },
                          child: Text(
                            'Order now',
                            style: TextStyle(
                                fontSize: 15, color: Colors.deepOrangeAccent),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Dismissible(
                key: ValueKey(shoppingCart.entries.elementAt(index)),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.delete_outline),
                  ),
                ),
                child: Card(
                  margin: EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 0),
                  child: ListTile(
                    title: Text(shoppingCart.keys.elementAt(index).name),
                    trailing: Text(
                      '+ ' + shoppingCart.values.elementAt(index).toString(),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                onDismissed: (DismissDirection direction) =>
                      showDialog(context: context, builder: (context) => AlertDialog(
                          title: Text('Delet Item'),
                          content: Text('do you realy want to delet this item?'),
                          actions: [
                            TextButton(onPressed: () {setState(() {
                              Navigator.pop(context);
                            });}, child: Text('Cancle')),
                            TextButton(onPressed: (){
                              setState(() {
                                counterData.removeValue(shoppingCart.entries.elementAt(index).value);
                                shoppingData.removeProduct(shoppingCart.entries.elementAt(index));
                                Navigator.pop(context);
                              });
                            }, child: Text('OK')),
                          ],
                        )
                      ),

                      //

              ),
              itemCount: shoppingCart.length,
            ),
          ),
        ],
      ),
    );
  }
}
