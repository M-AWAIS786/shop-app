import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/model/product_model.dart';

class ProductNotifier extends StateNotifier<List<Product>> {
  ProductNotifier() : super(products);

  // Method to toggle the favorite status of a product
  void toggleFavorite(String productId, int index) {
    state = [
      for (var productstate in state)
        if (productstate.id == productId)
          state[index].copyWith(
              isFavorite: state[index].isFavorite == true ? false : true)
        else
          productstate,
    ];

    // log(state.toString());
  }

  void showFavoritesOnly() {
    state = state
        .where((productfavourites) => productfavourites.isFavorite == true)
        .toList();
  }

  void showAll() {
    state = [
      for (var product in products)
        state.firstWhere((productall) => productall.id == product.id,
            orElse: () => product)
    ];
  }
}

final productProvider =
    StateNotifierProvider<ProductNotifier, List<Product>>((ref) {
  return ProductNotifier();
});
