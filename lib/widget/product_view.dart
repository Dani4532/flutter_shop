import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amazone/domain/products.dart';
import 'package:flutter_amazone/widget/grid_tile.dart';
import 'package:provider/provider.dart';

class ProductView extends StatelessWidget {

  const ProductView( {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productData = Provider.of<Products>(context);
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => GridTileTemplate(index),
      itemCount: productData.showFavs ? productData.getFavorit().length : productData.getItems().length,
    );
  }
}
