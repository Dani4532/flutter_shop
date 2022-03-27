import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.shop),
              title: Text('Shop'),
              onTap: () {
                Navigator.pushNamed(context, '/shop');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.card_giftcard),
              title: Text('Orders'),
              onTap: () {
                Navigator.pushNamed(context, '/orders');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.edit),
              title: Text('Manage products'),
              onTap: () {
                Navigator.pushNamed(context, '/manage');
              },
            ),
          ),
        ],
      ),
    );
  }
}
