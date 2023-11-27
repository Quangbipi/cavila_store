import 'package:cavila_store/blocs/fc_bottom_bar/bloc.dart';
import 'package:cavila_store/blocs/fc_bottom_bar/event.dart';
import 'package:cavila_store/blocs/fc_bottom_bar/state.dart';
import 'package:cavila_store/constans.dart';
import 'package:cavila_store/views/cart/cart_page.dart';
import 'package:cavila_store/views/home/home_page.dart';
import 'package:cavila_store/views/product/product_page.dart';
import 'package:cavila_store/views/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/fc_check_login/bloc.dart';
import '../blocs/fc_check_login/event.dart';

class BottomBarPage extends StatefulWidget {
  
  BottomBarPage({super.key});

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
    // setState(() {
    //   selectIndex = index;
    // });
    if(index == 2){
      context.read<CheckBloc>().add(CheckEvent());
    }
    context.read<BottomBarBloc>().add(BottomBarChangeEvent(index));
  }
  @override
  void initState() {
    
    super.initState();
    context.read<BottomBarBloc>().add(BottomBarInitialEvent());
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<BottomBarBloc, BottomBarState>(
      listener: (context, state) {
        if(state is BottomBarChangeSuccess){
          setState(() {
            selectIndex = state.selectIndex;
          });
        }
      },
      child: Scaffold(
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
              activeIcon: Icon(Icons.home, color: Constants.secondaryColor,),
              label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              activeIcon: Icon(Icons.menu, color: Constants.secondaryColor,),
              label: 'Product'),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), 
              activeIcon: Icon(Icons.shopping_cart, color: Constants.secondaryColor,),
              label: 'Cart'),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person, color: Constants.secondaryColor,),
              label: 'Profile')
          ]),
      ),
    );
  }
}
