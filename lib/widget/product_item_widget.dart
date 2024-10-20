import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/state/cart_state_notifier.dart';
import 'package:shop_app/state/product_state_notifier.dart';

class ProductItemWidget extends ConsumerWidget {
  const ProductItemWidget({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productprovider = ref.watch(productProvider);
    final productdata = productprovider[index];
    // final cartNotifier = ref.read(cartProvider.notifier);
    ref.watch(cartProvider);
    return GridTile(
      footer: GridTileBar(
        backgroundColor: Colors.black87,
        title: Text(productdata.title),
        leading: IconButton(
          icon: Icon(
            productdata.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: productdata.isFavorite ? Colors.red : Colors.white,
          ),
          onPressed: () {
            ref
                .read(productProvider.notifier)
                .toggleFavorite(productdata.id, index);
          },
        ),
        trailing: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              //cart badge
              ref.read(cartProvider.notifier).addItem(productdata.id,
                  productdata.title, productdata.price, productdata.imageUrl);

              log(productdata.id.toString());
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              // show a snackbar
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const Text('Product is added to cart'),
                duration: const Duration(seconds: 2),
                action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      ref
                          .read(cartProvider.notifier)
                          .removeOneItem(productdata.id);
                    }),
              ));
              log('sucessful');
            }),
      ),
      child: Image.network(productdata.imageUrl),
    );
  }
}
