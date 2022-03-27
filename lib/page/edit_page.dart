import 'package:flutter/material.dart';
import 'package:flutter_amazone/domain/products.dart';
import 'package:provider/provider.dart';

class EditPage extends StatelessWidget {
  final int index;
  const EditPage(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var preisController = TextEditingController();
    var productlist = Provider.of<Products>(context).getItems();
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Page'),
      ),
      body: Column(children: [
        TextField(controller: nameController,),
        TextField(),
        TextField(),
        TextField(),
      ],)
    );
  }
}
