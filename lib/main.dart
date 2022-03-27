import 'package:flutter/material.dart';
import 'package:flutter_amazone/domain/counter.dart';
import 'package:flutter_amazone/domain/orders.dart';
import 'package:flutter_amazone/domain/products.dart';
import 'package:flutter_amazone/domain/shopping_cart.dart';
import 'package:flutter_amazone/page/home_page.dart';
import 'package:flutter_amazone/page/manage_products_page.dart';
import 'package:flutter_amazone/page/order_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Products()),
        ChangeNotifierProvider(create: (_) => Orders()),
        ChangeNotifierProvider(create: (_) => ShoppingCart()),
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: <String, WidgetBuilder> {
        '/shop': (BuildContext context) => HomePage(),
        '/orders': (BuildContext context) => OrderPage(),
        '/manage': (BuildContext context) => ManagePage(),
      },
    );
  }
}
