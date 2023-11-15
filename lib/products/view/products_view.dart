// import 'dart:js_interop';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login/app/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:flutter_firebase_login/app/custom_drawer_bar/custom_drawer.dart';
import 'package:flutter_firebase_login/app/widgets/custom_appbar.dart';

import '../../cart/cart.dart';
import '../products.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsBloc = context.read<ProductsBloc>();
    return Container(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Products'),
        drawer: CustomDrawer(),
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (BuildContext context, state) {
            if (state is ProductsLoading) {
              return Center(
                  child: Column(
                children: [
                  CircularProgressIndicator(),
                ],
              ));
            } else if (state is ProductsLoaded) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: productsBloc.state.products.length,
                    itemBuilder: (context, index) {
                      
                      return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        productsBloc.state.products[index].name,
                      ),
                      Text(
                        productsBloc.state.products[index].minPrice,
                      ),
                      BlocBuilder<CartBloc, CartState>(
                        builder: (context, cartState) {
                          return Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  final cartBloc = context.read<CartBloc>();
                                  final product = productsBloc.state.products[index];
                                  cartBloc.add(
                                    RemoveProductFromCart(product)
                                  );
                                },
                                icon: Icon(Icons.remove_circle_outline),
                              ),
                              IconButton(
                                onPressed: () {
                                  final cartBloc = context.read<CartBloc>();
                                  final product = productsBloc.state.products[index];
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
                ),
              );
            } else {
              return Center(child: Text('Error Loading Products!'));
            }
          },
        ),
      ),
    );
  }
}
