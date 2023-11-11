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
    // final productsBloc = context.read<ProductsBloc>();
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
              return Center(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.products[index].name,
                              ),
                              Text(
                                state.products[index].minPrice,
                              ),
                              BlocBuilder<CartBloc, CartState>(
                                builder: (context, cartState) {
                                  return IconButton(
                                    onPressed: () {
                                      final cartBloc = context.read<CartBloc>();
                                      cartBloc.add(
                                        AddProductToCart(state.products[index])
                                      );
                                    },
                                    icon:
                                        Icon(Icons.add_shopping_cart_outlined),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
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
