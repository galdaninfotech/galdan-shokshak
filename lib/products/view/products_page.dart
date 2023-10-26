import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: ProductsPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products Page'),
      ),
      body: Center(
        child: ProductsList(),
      ),
    );
  }
}

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}