import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login/products/product_repository.dart';

import '../products.dart';
import 'products_view.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({
    Key? key,
  }) : super(key: key);

  static Page<void> page() => const MaterialPage<void>(child: ProductsPage());
  @override
  Widget build(BuildContext context) {
    final ProductRepository productRepository = new ProductRepository();
    return BlocProvider(
      create: (context) => ProductsBloc(productRepository: productRepository)..add(LoadProducts()),
      child: const ProductsView(),
    );
  }
}
