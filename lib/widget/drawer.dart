import 'package:flutter/material.dart';
import 'package:shop_app/screen/order_screen.dart';
import 'package:shop_app/screen/product_screen.dart';
import 'package:shop_app/screen/user_product_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const DrawerHeader(
              child: Column(
            children: [
              CircleAvatar(
                radius: 40,
                child: Icon(Icons.shopify_outlined, size: 50),
              ),
              Text(
                'Shop App',
                style: TextStyle(fontSize: 20),
              )
            ],
          )),
          ListTile(
            title: const Text('Shop'),
            leading: const Icon(Icons.shop),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProductScreen()));
            },
          ),
          ListTile(
            title: const Text('Order'),
            leading: const Icon(Icons.payment),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const OrderScreen()));
            },
          ),
          ListTile(
            title: const Text('Manage Products'),
            leading: const Icon(Icons.edit),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserProductScreen()));
            },
          ),
        ],
      ),
    );
  }
}
