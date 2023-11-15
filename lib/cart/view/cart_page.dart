import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login/app/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:flutter_firebase_login/app/custom_drawer_bar/custom_drawer.dart';
import 'package:flutter_firebase_login/app/widgets/custom_appbar.dart';
import '../../cart/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Cart'),
      drawer: CustomDrawer(),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: const Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(32),
              child: CartList(),
            ),
          ),
          Divider(height: 4, color: Colors.black),
          // CartTotal(),
        ],
      ),
    );
  }
}

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    // final itemNameStyle = Theme.of(context).textTheme.titleLarge;

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return switch (state) {
          CartLoading() => const CircularProgressIndicator(),
          CartError() => const Text('Something went wrong!!'),
          CartLoaded() => ListView.separated(
              itemCount: state.cart.products.length,
              separatorBuilder: (_, __) => const SizedBox(height: 4),
              itemBuilder: (context, index) {
                final product = state.cart.products[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      state.cart.products[index].name,
                    ),
                    Text(
                      state.cart.products[index].minPrice,
                    ),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, cartState) {
                        return Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                final cartBloc = context.read<CartBloc>();
                                cartBloc.add(
                                  RemoveProductFromCart(product)
                                );
                              },
                              icon: Icon(Icons.remove_circle_outline),
                            ),
                            IconButton(
                              onPressed: () {
                                final cartBloc = context.read<CartBloc>();
                                cartBloc.add(
                                  AddProductToCart(product)
                                );
                              },
                              icon: Icon(Icons.add_circle_outline),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                );
              },
            ),
        };
      },
    );
  }
}

class CartTotal extends StatelessWidget {
  const CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final hugeStyle =
        Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 48);

    return SizedBox(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return switch (state) {
                  CartLoading() => const CircularProgressIndicator(),
                  CartError() => const Text('Something went wrong!'),
                  CartLoaded() =>
                    Text('\$${state.cart.totalPrice}', style: hugeStyle),
                };
              },
            ),
            const SizedBox(width: 24),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Buying not supported yet.')),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text('BUY'),
            ),
          ],
        ),
      ),
    );
  }
}
