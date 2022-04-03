import 'package:flutter/material.dart';
import 'package:flutter_amazone/domain/counter.dart';
import 'package:flutter_amazone/domain/products.dart';
import 'package:flutter_amazone/domain/shopping_cart.dart';
import 'package:flutter_amazone/page/detail_page.dart';
import 'package:provider/provider.dart';

class GridTileTemplate extends StatelessWidget {
  final int index;

  const GridTileTemplate(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productsData = Provider.of<Products>(context);
    var products = productsData.showFavs
        ? productsData.getFavorit()
        : productsData.getItems();
    var shoppingData = Provider.of<ShoppingCart>(context);
    var shoppingCart = shoppingData.getShoppingList();
    var counterData = Provider.of<Counter>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => DetailPage(index),
            ),
          ),
          child: GridTile(
            child: Image.network(
              products[index].url,
              fit: BoxFit.cover,
            ),
            footer: GridTileBar(
              backgroundColor: Colors.black,
              leading: Consumer<Products>(
                builder: (context, product, _) => IconButton(
                  icon: Icon(products[index].fav
                      ? Icons.favorite
                      : Icons.favorite_border),
                  color: Colors.white,
                  onPressed: () {
                    productsData.changeFav(products[index]);
                  },
                ),
              ),
              title: Text(
                products[index].name,
                textAlign: TextAlign.center,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('Do you want to remove the item?'),
                    action: SnackBarAction(
                      label: 'UNDO',
                      onPressed: () {
                        if (shoppingCart.containsKey(products[index]) &&
                            (shoppingCart.entries
                                    .where((element) =>
                                        element.key == products[index])
                                    .first
                                    .value >
                                1)) {
                          shoppingCart.update(
                              products[index], (value) => value -= 1);
                        } else {
                          shoppingCart.removeWhere(
                              (key, value) => key == products[index]);
                        }
                        shoppingData.setPreis();
                        counterData.removeOne();
                      },
                    ),
                  ));
                  if (shoppingCart.containsKey(products[index])) {
                    shoppingCart.update(products[index], (value) => value += 1);
                  } else {
                    shoppingCart.addAll({products[index]: 1});
                  }
                  shoppingData.setPreis();
                  counterData.tick();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
