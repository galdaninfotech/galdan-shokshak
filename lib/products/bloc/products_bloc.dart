import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_firebase_login/products/product_repository.dart';

import '../models/models.dart';
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc({required this.productRepository}) : super(ProductsLoading()) {
    on<LoadProducts>(_onLoadProducts);
  }

  final ProductRepository productRepository;

  Future<void> _onLoadProducts(
    LoadProducts event,
    Emitter<ProductsState> emit,
  ) async {
    emit(ProductsLoading());
    try {
      final List<Product> products = await productRepository.getProducts();
      emit(ProductsLoaded(products));
    } catch (_) {
      emit(ProductsError());
    }
  }
  
}

