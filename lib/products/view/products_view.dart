// import 'dart:js_interop';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login/app/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:flutter_firebase_login/app/custom_drawer_bar/custom_drawer.dart';
import 'package:flutter_firebase_login/app/widgets/custom_appbar.dart';

import '../products.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProductsBloc>();
    return Container(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Products'),
        drawer: CustomDrawer(),
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (bloc.state is ProductsLoading) {
              return Text('ProductsLoading');
            } else {
              return Text('bbbbbbbbbbb');
            }
          },
        ),
      ),
    );
  }
}
