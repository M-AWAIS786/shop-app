import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/model/cart_model.dart';
import 'package:shop_app/model/order_model.dart';

final orderProvider = StateNotifierProvider<OrderNotifier, List<Order>>((ref) {
  return OrderNotifier();
});

class OrderNotifier extends StateNotifier<List<Order>> {
  OrderNotifier() : super([]);

  void addOrder(List<Cart> cart, double amount) {
    state = [
      ...state,
      Order(
          id: DateTime.now().toString(),
          amount: amount,
          products: cart,
          dateTime: DateTime.now())
    ];
  }
}
