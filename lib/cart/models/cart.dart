import 'package:equatable/equatable.dart';
import '../../products/products.dart';

class Cart extends Equatable {
  const Cart({this.products = const <Product>[]});

  final List<Product> products;

  int get totalPrice {
    // return products.fold(0, (total, current) => total + current.price);
    return 1000;
  }

  @override
  List<Object> get props => [products];
}
