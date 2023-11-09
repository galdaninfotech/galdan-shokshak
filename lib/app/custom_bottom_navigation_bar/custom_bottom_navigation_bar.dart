import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../../home/view/home_page.dart';

const List<TabItem> items = [
  TabItem(
    icon: Icons.home,
    // title: 'Home',
  ),
  TabItem(
    icon: Icons.food_bank_outlined,
    title: 'Menu',
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

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}


class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
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
                    MaterialPageRoute(builder: (context) => HomePage()));
            } else if(index == 3) {
              Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage()));
            }
          }),
        ),
      );
  }
}