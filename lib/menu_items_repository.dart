import 'package:cloud_firestore/cloud_firestore.dart';
import 'menu_items/models/models.dart';

class MenuItemsRepository {
  final FirebaseFirestore _firebaseFirestore;

  MenuItemsRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Stream<List<MenuItems>> getAllMenuItems() {
    return _firebaseFirestore
        .collection('products')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => MenuItems.fromSnapshot(doc)).toList();
    });
  }
}

// import 'dart:async';
// import 'catalog/catalog.dart';

// const _delay = Duration(milliseconds: 800);

// const _catalog = [
//   'Code Smell',
//   'Control Flow',
//   '67',
// ];

// class MenuItemsRepository {
//   final _items = <Item>[];

//   Future<List<String>> loadCatalog() => Future.delayed(_delay, () => _catalog);

//   Future<List<Item>> loadCartItems() => Future.delayed(_delay, () => _items);

//   void addItemToCart(Item item) => _items.add(item);

//   void removeItemFromCart(Item item) => _items.remove(item);

//   Future<List<Item>> getAllProducts() => Future.delayed(_delay, () => _items);
// }
