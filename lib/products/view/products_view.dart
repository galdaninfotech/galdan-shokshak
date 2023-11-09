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
    // final bloc = context.read<ProductsBloc>();
    // print(bloc.state);
    return Container(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Products'),
        drawer: CustomDrawer(),
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (BuildContext context, state) {
            print('sssssssssssssssssssssssssssssssssss');
            print(state);
            if (state is ProductsLoading) {
              return Center(child: Column(
                children: [
                  CircularProgressIndicator(),
                  ElevatedButton(
                    onPressed: (){
                      context.read<ProductsBloc>().add(LoadProducts());
                    }, 
                    child: Text('Load Products'),
                  )
                ],
              ));
            } else if(state is ProductsLoaded) {
              print(state);
              return Center(child: Text('state.products[0].name'));
            } else {
              return Center(child: Text('Error Loading Products!'));
            }
          },
        ),
      ),
    );
  }
}
