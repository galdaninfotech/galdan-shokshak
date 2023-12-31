import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login/app/app.dart';
import 'package:flutter_firebase_login/app/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:flutter_firebase_login/home/home.dart';
import 'package:flutter_firebase_login/products/products.dart';

import '../../app/custom_drawer_bar/custom_drawer.dart';
import '../../app/widgets/custom_appbar.dart';
import '../../cart/view/cart_page.dart';
import '../../products/view/products_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: CustomAppBar(title: 'Home'),
      body: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Avatar(photo: user.photo),
            const SizedBox(height: 4),
            Text(user.email ?? '', style: textTheme.titleLarge),
            const SizedBox(height: 4),
            Text(user.name ?? '', style: textTheme.headlineSmall),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProductsPage()));
              },
              child: Text("Go to Products"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CartPage()));
              },
              child: Text("Go to Cart"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text("Go to Cart"),
            ),
          ],
        ),
      ),
      drawer: CustomDrawer(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
