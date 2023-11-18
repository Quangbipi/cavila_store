import 'package:cavila_store/constans.dart';
import 'package:cavila_store/routes/route_paths.dart';
import 'package:cavila_store/widgets/app_bar.dart';
import 'package:cavila_store/widgets/cart_item.dart';
import 'package:cavila_store/widgets/widget_button.dart';
import 'package:flutter/material.dart';

import '../../utils.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = Utils.screenHeight(context);
    double screenWidth = Utils.screenWidth(context);
    return Scaffold(
        backgroundColor: Constants.primaryColor,
        appBar: AppBarWidget.appBar(),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 2,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: Constants.FAKE_DATA.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                          child: CartItem(fakeData: Constants.FAKE_DATA[index]),
                        );
                      })),
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        
                        const Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Tổng:', style: TextStyle(fontSize: 18),),
                            SizedBox(),
                            Text('70000đ',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                          ],
                        ),
                        const SizedBox(height: 40,),
                        WidgetButton.buildButton(
                          screenHeight*0.06, 
                          screenWidth*0.8, 
                          (){
                            Navigator.of(context).pushNamed(RoutePaths.paymentPage);
                          }, 
                          'Thanh toán'),
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
