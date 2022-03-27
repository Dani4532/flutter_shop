import 'package:flutter/material.dart';
import 'package:flutter_amazone/domain/products.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  final int index;

  const DetailPage(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productData = Provider.of<Products>(context);
    var productList = productData.getItems();
    return Scaffold(
      appBar: AppBar(
        title: Text(productList[index].name),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(image: NetworkImage(productList[index].url),),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(productList[index].price.toString()+ ' €'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(productList[index].desc),
            ),
          ],
        ),
      ),
    );
  }
}
