import 'package:cavila_store/models/payment_model.dart';
import 'package:cavila_store/views/auth/change_pass_page.dart';
import 'package:cavila_store/views/auth/sign_up_page.dart';
import 'package:cavila_store/views/bottombar_page.dart';
import 'package:cavila_store/views/cart/cart_page.dart';
import 'package:cavila_store/views/cart/order_page.dart';
import 'package:cavila_store/views/home/home_page.dart';
import 'package:cavila_store/views/payment/payment_page.dart';
import 'package:cavila_store/views/payment/voucher_page.dart';
import 'package:cavila_store/views/product/product_detail_page.dart';
import 'package:cavila_store/views/profile/account_setting.dart';
import 'package:cavila_store/views/profile/edit_address.dart';
import 'package:cavila_store/views/profile/edit_profile.dart';
import 'package:cavila_store/views/profile/update_address.dart';
import 'package:cavila_store/views/splash_screen.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../views/auth/sign_in_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => BottomBarPage());
      case '/splashScreen':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/homePage':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/signInPage':
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case '/signUpPage':
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case '/productDetailPage':
        if (args is Product) {
          return MaterialPageRoute(
              builder: (_) => ProductDetailPage(product: args));
        }
        return _errorRoute();
      case '/paymentPage':
        if (args is PaymentModel) {
          return MaterialPageRoute(
              builder: (_) => PaymentPage(
                    paymentModel: args,
                  ));
        }
        return _errorRoute();
      case '/accountSetting':
        return MaterialPageRoute(builder: (_) => const AccountSetting());
      case '/editProfile':
        return MaterialPageRoute(builder: (_) => const EditProfile());
      case '/editAddress':
        return MaterialPageRoute(builder: (_) => const EditAddress());
      case '/orderPage':
        return MaterialPageRoute(builder: (_) => const OrderPage());
      case '/voucherPage':
        return MaterialPageRoute(builder: (_) => const VoucherPage());
      case '/cartPage':
        return MaterialPageRoute(builder: (_) => const CartPage());
      case '/changePassPage':
        return MaterialPageRoute(builder: (_) => ChangePassPage());
      case '/updateAddress':
        return MaterialPageRoute(builder: (_) => const UpdateAddress());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
