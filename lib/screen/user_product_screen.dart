import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/screen/manageproducts/edit_product_screen.dart';
import 'package:shop_app/state/product_state_notifier.dart';
import 'package:shop_app/widget/drawer.dart';
import 'package:shop_app/widget/user_product_widget.dart';

class UserProductScreen extends ConsumerWidget {
  const UserProductScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productdata = ref.read(productProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const EditProductScreen()));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      drawer: const DrawerWidget(),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: productdata.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              user_product_widget(
                title: productdata[index].title,
                imageurl: productdata[index].imageUrl,
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}
