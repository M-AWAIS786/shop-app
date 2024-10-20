import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/state/product_state_notifier.dart';

class ProductDetailScreen extends ConsumerWidget {
  const ProductDetailScreen({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productprovider = ref.watch(productProvider);
    final productData = productprovider[index];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 200,
            child: Image.network(
              productData.imageUrl,
              fit: BoxFit.fill,
            ),
          ),
          Text(productData.title),
          Text(productData.description),
          Text(productData.price.toString()),
        ],
      ),
    );
  }
}
