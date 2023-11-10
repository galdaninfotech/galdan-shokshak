part of 'cart_bloc.dart';

@immutable
sealed class CartEvent extends Equatable {
  const CartEvent();
}

final class CartStarted extends CartEvent {
  @override
  List<Object> get props => [];
}

final class CartProductAdded extends CartEvent {
  const CartProductAdded(this.product);

  final Product product;

  @override
  List<Object> get props => [product];
}

final class CartProductRemoved extends CartEvent {
  const CartProductRemoved(this.product);

  final Product product;

  @override
  List<Object> get props => [product];
}
