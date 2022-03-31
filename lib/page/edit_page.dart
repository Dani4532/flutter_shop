import 'package:flutter/material.dart';
import 'package:flutter_amazone/domain/product.dart';
import 'package:flutter_amazone/domain/products.dart';
import 'package:provider/provider.dart';

class EditPage extends StatelessWidget {
  final int index;

  const EditPage(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var preisController = TextEditingController();
    var descrController = TextEditingController();
    var imageController = TextEditingController();
    var productdata = Provider.of<Products>(context);
    var productlist = productdata.getItems();

    nameController.text = productlist[index].name;
    preisController.text = productlist[index].price.toString();
    descrController.text = productlist[index].desc;
    imageController.text = productlist[index].url;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
            ),
            TextField(
              controller: descrController,
            ),
            TextField(
              controller: preisController,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: Image(
                      image: NetworkImage(
                        imageController.text,
                      ),
                    ),
                    width: 150,
                    height: 150,
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: imageController,
                  ),
                ),
              ],
            ),
            TextButton(
                onPressed: () {
                  Product product = Product(
                      name: nameController.text,
                      url: imageController.text,
                      price: double.parse(preisController.text),
                      desc: descrController.text);
                  productdata.changeProduct(index, product);
                  Navigator.of(context).pop();
                },
                child: Text('Change Entry')),
          ],
        ),
      ),
    );
  }
}
