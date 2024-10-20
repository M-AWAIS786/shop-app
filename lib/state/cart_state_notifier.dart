import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/model/cart_model.dart';

final cartProvider =
    StateNotifierProvider<CartNotifier, Map<String, Cart>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<Map<String, Cart>> {
  CartNotifier() : super({});

  // Add item to the cart
  void addItem(String productId, String title, double price, String imageUrl) {
    if (state.containsKey(productId)) {
      // If the item already exists in the cart, update the quantity
      state = {
        ...state,
        productId: Cart(
          id: productId,
          title: title,
          quantity: state[productId]!.quantity + 1,
          price: price,
          imageUrl: imageUrl,
        ),
      };
    } else {
      // If the item does not exist in the cart, add it
      state = {
        ...state,
        productId: Cart(
          id: productId,
          title: title,
          quantity: 1,
          price: price,
          imageUrl: imageUrl,
        ),
      };
    }
  }

  void removeItem(String productId) {
    if (!state.containsKey(productId)) {
      return;
    }
    state = {...state}..remove(productId);
  }

  void removeOneItem(String productId) {
    if (!state.containsKey(productId)) {
      return;
    }
    if (state[productId]!.quantity > 1) {
      state = {
        ...state,
        productId: state[productId]!
            .copyWith(quantity: state[productId]!.quantity - 1),
      };
    } else {
      final updatedState = {...state};
      updatedState.remove(productId);
      state = updatedState;
    }
  }

  // Calculate total amount
  double get totalAmount {
    double total = 0.0;
    state.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  int get totalcart {
    int total = 0;

    state.forEach(
      (key, value) => total += value.quantity,
    );
    return total;
  }

  // Remove all items from the cart
  void clearItem() {
    state = {};
  }
}
