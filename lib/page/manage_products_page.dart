import 'package:flutter/material.dart';
import 'package:flutter_amazone/domain/products.dart';
import 'package:flutter_amazone/page/add_product_page.dart';
import 'package:flutter_amazone/page/edit_page.dart';
import 'package:flutter_amazone/widget/drawer.dart';
import 'package:provider/provider.dart';

class ManagePage extends StatefulWidget {
  const ManagePage({Key? key}) : super(key: key);

  @override
  State<ManagePage> createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> {
  @override
  Widget build(BuildContext context) {
    var productData = Provider.of<Products>(context);
    var productList = productData.getItems();
    return Scaffold(
      appBar: AppBar(
        title: const Text('My products'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AddProductPage()),
                );
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      drawer: const CustomDrawer(),
      body: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: ListTile(
              leading: Image(
                image: NetworkImage(productList[index].url),
              ),
              title: Text(productList[index].name),
              trailing: SizedBox(
                width: 100,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => EditPage(index),
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          productList.removeWhere((element) =>
                              element.name == productList[index].name);
                        });
                      },
                      icon: const Icon(Icons.delete),
                      color: Colors.red,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        itemCount: productList.length,
      ),
    );
  }
}
