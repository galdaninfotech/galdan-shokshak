part of 'cart_bloc.dart';

@immutable
sealed class CartEvent extends Equatable {
  const CartEvent();
}

final class CartStarted extends CartEvent {
  @override
  List<Object> get props => [];
}

class AddProductToCart extends CartEvent {
  final Product product;

  const AddProductToCart(this.product);

  @override
  List<Object> get props => [product];
}

final class RemoveProductFromCart extends CartEvent {
  const RemoveProductFromCart(this.product);

  final Product product;

  @override
  List<Object> get props => [product];
}
