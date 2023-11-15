part of 'products_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object?> get props => [];

  get products => null;
}

final class ProductsLoading extends ProductsState {}

final class ProductsLoaded extends ProductsState {
  const ProductsLoaded(this.products);

  final List<Product> products;

  @override
  List<Object?> get props => [products];
}

final class ProductsError extends ProductsState {}
