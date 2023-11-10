import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../cart/cart.dart';
import '../../products/products.dart';
// import '../../products/models/product_model.dart';
import '../../shopping_repository.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({required this.shoppingRepository}) : super(CartLoading()) {
    on<CartStarted>(_onStarted);
    on<CartProductAdded>(_onProductAdded);
    on<CartProductRemoved>(_onProductRemoved);
  }

  final ShoppingRepository shoppingRepository;

  Future<void> _onStarted(CartStarted event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      final products = await shoppingRepository.loadCartProducts();
      emit(CartLoaded(cart: Cart(products: [...products])));
    } catch (_) {
      emit(CartError());
    }
  }

  Future<void> _onProductAdded(
    CartProductAdded event,
    Emitter<CartState> emit,
  ) async {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        shoppingRepository.addProductToCart(event.product);
        emit(CartLoaded(cart: Cart(products: [...state.cart.products, event.product])));
      } catch (_) {
        emit(CartError());
      }
    }
  }

  void _onProductRemoved(CartProductRemoved event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        shoppingRepository.removeProductFromCart(event.product);
        emit(
          CartLoaded(
            cart: Cart(
              products: [...state.cart.products]..remove(event.product),
            ),
          ),
        );
      } catch (_) {
        emit(CartError());
      }
    }
  }
}
