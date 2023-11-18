import 'package:cavila_store/views/auth/sign_up_page.dart';
import 'package:cavila_store/views/bottombar_page.dart';
import 'package:cavila_store/views/cart/order_page.dart';
import 'package:cavila_store/views/home/home_page.dart';
import 'package:cavila_store/views/payment/payment_page.dart';
import 'package:cavila_store/views/payment/voucher_page.dart';
import 'package:cavila_store/views/product/product_detail_page.dart';
import 'package:cavila_store/views/profile/account_setting.dart';
import 'package:cavila_store/views/profile/edit_address.dart';
import 'package:cavila_store/views/profile/edit_profile.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../views/auth/sign_in_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => BottomBarPage());
      case '/homePage':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/signInPage':
        return MaterialPageRoute(builder: (_) => SignInPage());
      case '/signUpPage':
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case '/productDetailPage':
        if (args is Product) {
          return MaterialPageRoute(
              builder: (_) => ProductDetailPage(product: args));
        }
        return _errorRoute();
      case '/paymentPage':
        return MaterialPageRoute(builder: (_) => PaymentPage());
      case '/accountSetting':
        return MaterialPageRoute(builder: (_) => AccountSetting());
      case '/editProfile':
        return MaterialPageRoute(builder: (_) => EditProfile());
      case '/editAddress':
        return MaterialPageRoute(builder: (_) => EditAddress());
      case '/orderPage':
        return MaterialPageRoute(builder: (_) => OrderPage());
      case '/voucherPage':
        return MaterialPageRoute(builder: (_) => VoucherPage());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
