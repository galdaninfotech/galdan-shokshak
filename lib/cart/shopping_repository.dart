import 'dart:async';
import '../../../products/products.dart';

const _delay = Duration(milliseconds: 800);

class ShoppingRepository {
  final _products = <Product>[];

  // Future<List<Product>> loadCatalog() => Future.delayed(_delay, () => _products);

  Future<List<Product>> loadCartProducts() => Future.delayed(_delay, () => _products);

  void addProductToCart(Product product) => _products.add(product);

  void removeProductFromCart(Product product) => _products.remove(product);
}
