import 'package:cavila_store/constans.dart';
import 'package:cavila_store/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import '../../utils.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = Utils.screenHeight(context);
    double screenWidth = Utils.screenWidth(context);
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      appBar: AppBarWidget.appBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text('Thời Trang Nữ', style: TextStyle(fontSize: 28),),
            ),
            SizedBox(height: 20,),
           Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            height: screenHeight*0.35,
            width: screenWidth,
            child:  ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Constants.FAKE_DATA.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Container(),
                      // child: ProductItemCard(product: Constants.FAKE_DATA[index]),
                    );
                }),
           ),
           SizedBox(height: 20,),
           Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text('Thời Trang Nam', style: TextStyle(fontSize: 28),),
            ),
            SizedBox(height: 20,),
           Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            height: screenHeight*0.35,
            width: screenWidth,
            child:  ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Constants.FAKE_DATA.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Container(),
                      //child: ProductItemCard(fakeData: Constants.FAKE_DATA[index]),
                    );
                }),
           )
          ],
        ),
      )
    );
  }
}