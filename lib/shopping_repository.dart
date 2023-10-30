import 'dart:async';
import 'catalog/catalog.dart';

const _delay = Duration(milliseconds: 800);

const _catalog = [
  'Code Smell',
  'Control Flow',
  '67',

];

class ShoppingRepository {
  final _items = <Item>[];

  Future<List<String>> loadCatalog() => Future.delayed(_delay, () => _catalog);

  Future<List<Item>> loadCartItems() => Future.delayed(_delay, () => _items);

  void addItemToCart(Item item) => _items.add(item);

  void removeItemFromCart(Item item) => _items.remove(item);
}
