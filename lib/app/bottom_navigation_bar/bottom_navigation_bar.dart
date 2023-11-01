import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../../catalog/view/catalog_page.dart';
import '../../cart/view/cart_page.dart';
import '../../home/view/home_page.dart';

const List<TabItem> items = [
  TabItem(
    icon: Icons.home,
    // title: 'Home',
  ),
  TabItem(
    icon: Icons.search_sharp,
    title: 'Shop',
  ),
  TabItem(
    icon: Icons.favorite_border,
    title: 'Wishlist',
  ),
  TabItem(
    icon: Icons.shopping_cart_outlined,
    title: 'Cart',
  ),
  TabItem(
    icon: Icons.account_box,
    title: 'profile',
  ),
];

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}


class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int visit = 0;
  double height = 30;
  Color colorSelect = const Color(0XFF0686F8);
  Color color = const Color(0XFF7AC0FF);
  Color color2 = const Color(0XFF96B1FD);
  Color bgColor = const Color(0XFF1752FE);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: BottomBarFloating(
          items: items,
          backgroundColor: const Color.fromARGB(255, 237, 22, 6),
          color: Colors.white,
          colorSelected: Colors.orange,
          indexSelected: visit,
          paddingVertical: 24,
          onTap: (int index) => setState(() {
            visit = index;
            if(index == 0) {
              Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomePage()));
            } else if(index == 1) {
              Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CatalogPage()));
            } else if(index == 3) {
              Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => CartPage()));
            }
          }),
        ),
      );
  }
}