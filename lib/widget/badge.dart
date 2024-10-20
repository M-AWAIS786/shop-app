import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/state/cart_state_notifier.dart';

class BadgeCart extends ConsumerWidget {
  const BadgeCart({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(cartProvider);
    return Positioned(
      right: 8,
      top: 8,
      child: CircleAvatar(
        radius: 8,
        backgroundColor: Colors.red,
        child: Text(
          ref.read(cartProvider.notifier).totalcart.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 10),
        ),
      ),
    );
  }
}
