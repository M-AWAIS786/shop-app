import 'package:shop_app/model/cart_model.dart';

class Order {
  final String id;
  final double amount;
  final List<Cart> products;
  final DateTime dateTime;

  Order(
      {required this.id,
      required this.amount,
      required this.products,
      required this.dateTime});
}
