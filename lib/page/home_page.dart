import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amazone/domain/counter.dart';
import 'package:flutter_amazone/domain/menu_items.dart';
import 'package:flutter_amazone/domain/products.dart';
import 'package:flutter_amazone/page/shopping_cart_page.dart';
import 'package:flutter_amazone/widget/drawer.dart';
import 'package:flutter_amazone/widget/product_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var productData = Provider.of<Products>(context);
    var countData = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          PopupMenuButton<String>(
            tooltip: 'view menu',
              onSelected: (item) => onSelected(context, item, productData),
              itemBuilder: (context) => [
                    ...MenuItems.menuItemList
                        .map((e) => PopupMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                  ]),
          Badge(
            animationType: BadgeAnimationType.scale,
            position: BadgePosition.topEnd(end: 5,top: 5),
            badgeContent: Text(countData.count.toString(), style: TextStyle(color: Colors.white),),

            badgeColor: Colors.red,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const ShoppingCartPage(),
                  ),
                );
              },
              icon: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: ProductView(),
    );
  }

  onSelected(BuildContext context, String item, Products productData) {
    setState(() {
      switch (item) {
        case 'show favorits':
          productData.showFavs = true;
          break;
        case 'show all':
          productData.showFavs = false;
      }
    });
  }
}
