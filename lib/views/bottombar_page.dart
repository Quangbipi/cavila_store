import 'package:cavila_store/constans.dart';
import 'package:cavila_store/views/cart/cart_page.dart';
import 'package:cavila_store/views/home/home_page.dart';
import 'package:cavila_store/views/product/product_page.dart';
import 'package:cavila_store/views/profile/profile_page.dart';
import 'package:flutter/material.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({super.key});

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {

  static final List<Widget> _widgetPage = [
    const HomePage(),
    const ProductPage(),
    const CartPage(),
    const ProfilePage(),
  ];
  int selectIndex = 0;
  void bottomBarItemOnTap(int index){
    setState(() {
      selectIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetPage[selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectIndex,
        onTap: bottomBarItemOnTap,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: const Color.fromRGBO(192, 192, 192, 1),
        items:const[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home, color: Constants.pinkColor,),
            label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            activeIcon: Icon(Icons.menu, color: Constants.pinkColor,),
            label: 'Product'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined), 
            activeIcon: Icon(Icons.shopping_cart, color: Constants.pinkColor,),
            label: 'Cart'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person, color: Constants.pinkColor,),
            label: 'Profile')
        ]),
    );
  }
}
