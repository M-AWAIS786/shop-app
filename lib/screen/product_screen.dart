import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/screen/cart_screen.dart';
import 'package:shop_app/screen/product_details_screen.dart';
import 'package:shop_app/state/product_state_notifier.dart';
import 'package:shop_app/widget/badge.dart';
import 'package:shop_app/widget/drawer.dart';
import 'package:shop_app/widget/product_item_widget.dart';

enum FilterOptions {
  favorites,
  all,
}

class ProductScreen extends ConsumerWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productprovider = ref.watch(productProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == FilterOptions.favorites) {
                ref.read(productProvider.notifier).showFavoritesOnly();
              } else {
                ref.read(productProvider.notifier).showAll();
              }
            },
            itemBuilder: (context) {
              return const [
                PopupMenuItem(
                  value: FilterOptions.favorites,
                  child: Text('Only Favorites'),
                ),
                PopupMenuItem(
                  value: FilterOptions.all,
                  child: Text('Show All'),
                ),
              ];
            },
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const CartScreen();
                  }));
                },
              ),
              const BadgeCart(),
            ],
          )
        ],
      ),
      drawer: const DrawerWidget(),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: productprovider.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProductDetailScreen(index: index);
              }));
            },
            child: ProductItemWidget(
              index: index,
            ),
          );
        },
      ),
    );
  }
}
