import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/screen/order_screen.dart';
import 'package:shop_app/state/cart_state_notifier.dart';
import 'package:shop_app/state/order_state_notifier.dart';
// Assuming CartNotifier is in this file

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final totalAmount = ref.read(cartProvider.notifier).totalAmount;

    ref.watch(orderProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            color: Colors.white,
            elevation: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('Total Amount'),
                Chip(
                    backgroundColor: Colors.blue.shade400,
                    label: Text(
                      '\$${totalAmount.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.white),
                    )),
                TextButton(
                    onPressed: () {
                      ref
                          .read(orderProvider.notifier)
                          .addOrder(cart.values.toList(), totalAmount);
                      ref.read(cartProvider.notifier).clearItem();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OrderScreen()));
                    },
                    child: const Text('Order Now')),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (ctx, index) {
                final cartItem = cart.values.toList()[index];

                return Dismissible(
                  key: ValueKey(cartItem.id),
                  // direction: DismissDirection.endToStart,
                  confirmDismiss: (direction) {
                    return showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Are you sure?'),
                        content: const Text(
                            'Do you want to remove the item from the cart?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: const Text('No')),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(true);
                              },
                              child: const Text('Yes')),
                        ],
                      ),
                    );
                  },
                  onDismissed: (direction) {
                    ref.read(cartProvider.notifier).removeItem(cartItem.id);
                  },
                  background: Container(
                    color: Colors.red,
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  child: Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: Image.network(
                        cartItem.imageUrl,
                        width: 80,
                        height: 80,
                      ),
                      title: Text(cartItem.title),
                      subtitle: Text('Quantity: ${cartItem.quantity}'),
                      trailing: Text('\$${cartItem.price * cartItem.quantity}'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
