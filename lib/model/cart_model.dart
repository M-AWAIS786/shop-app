// ignore_for_file: public_member_api_docs, sort_constructors_first
class Cart {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String imageUrl;

  Cart(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price,
      required this.imageUrl});

  Cart copyWith({
    String? id,
    String? title,
    int? quantity,
    double? price,
    String? imageUrl,
  }) {
    return Cart(
      id: id ?? this.id,
      title: title ?? this.title,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
