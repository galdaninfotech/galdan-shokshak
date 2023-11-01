import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login/menu_items/models/menu_items_model.dart';

import '../../app/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import '../../app/custom_drawer_bar/custom_drawer.dart';
import '../../app/widgets/custom_appbar.dart';
import '../menu_items.dart';

class MenuItemsPage extends StatelessWidget {
  const MenuItemsPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: MenuItemsPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Menu Items'),
      body: BlocBuilder<MenuItemsBloc, MenuItemsState>(
        builder: (context, state) {
          if (state is MenuItemsLoading) {
            return Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          }

          if (state is MenuItemsLoaded) {
            final List<MenuItems> menuItems = state.menuItems.toList();
            // final List<MenuItems> menuItems = [];

            return GridView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 16.0,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.15,
              ),
              itemCount: menuItems.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: Text(menuItems[index].name),
                );
              },
            );
          } else {
            return Text('Something went wrong');
          }
        },
      ),
      drawer: CustomDrawer(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
