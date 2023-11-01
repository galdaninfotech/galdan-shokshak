import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/view/cart_page.dart';
import '../../home/view/home_page.dart';
import '../../home/widgets/avatar.dart';
import '../../menu_items/view/menu_items_page.dart';
import '../bloc/app_bloc.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 230, 3, 41),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Avatar(photo: user.photo),
                const SizedBox(height: 4),
                Text(user.email ?? ''),
                const SizedBox(height: 4),
                Text(user.name ?? ''),
              ],
            ),
          ),
          ListTile(
            title: const Text('Home'),
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Menu Items'),
            leading: Icon(Icons.menu),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenuItemsPage()),
              );
            },
          ),
          ListTile(
            title: const Text('My Orders'),
            leading: Icon(Icons.production_quantity_limits_outlined),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('My Wishlist'),
            leading: Icon(Icons.favorite_border),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
          ListTile(
            title: const Text('My Cart'),
            leading: Icon(Icons.shopping_cart_outlined),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Profile'),
            leading: Icon(Icons.verified_user_outlined),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Settings'),
            leading: Icon(Icons.settings_accessibility_outlined),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Logout'),
            leading: Icon(Icons.logout_outlined),
            onTap: () {
              context.read<AppBloc>().add(const AppLogoutRequested());
            },
          ),

        ],
      ),
    );
  }
}
