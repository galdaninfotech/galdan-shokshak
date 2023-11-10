import 'dart:async';

import '../../products/products.dart';

const _delay = Duration(milliseconds: 800);

const _catalog = [
  'Code Smell',
  'Control Flow',
  'Interpreter',
  'Recursion',
  'Sprint',
  'Heisenbug',
  'Spaghetti',
  'Hydra Code',
  'Off-By-One',
  'Scope',
  'Callback',
  'Closure',
  'Automata',
  'Bit Shift',
  'Currying',
];

class ShoppingRepository {
  final _products = <Product>[];

  Future<List<String>> loadCatalog() => Future.delayed(_delay, () => _catalog);

  Future<List<Product>> loadCartProducts() => Future.delayed(_delay, () => _products);

  void addProductToCart(Product product) => _products.add(product);

  void removeProductFromCart(Product product) => _products.remove(product);
}
