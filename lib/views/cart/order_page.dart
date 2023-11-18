import 'package:cavila_store/constans.dart';
import 'package:flutter/material.dart';

import '../../utils.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<String> orderStatus =[
    'Chờ xác nhận',
    'Chờ lấy hàng',
    'Đang giao',
    'Đã giao',
    'Đã hủy',
    'Trả hàng'
  ] ;
  int x = 0;
  @override
  Widget build(BuildContext context) {
    double screenHeight = Utils.screenHeight(context);
    double screenWidth = Utils.screenWidth(context);
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      appBar:  AppBar(
        backgroundColor: Color.fromRGBO(255, 212, 222, 0),
        title: Text('Đơn mua'),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Color.fromRGBO(233, 110, 110, 1),
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Divider(thickness: 3,),
          Container(
            height: screenHeight*0.03,
            width: screenWidth,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: orderStatus.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        x = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: x == index ? Border(bottom: BorderSide(
                          width: 1,
                          color: Constants.pinkColor
                        )) : null
                      ),
                      child: Text(orderStatus[index], style: TextStyle(fontSize: 15, color: Colors.black),))),
                );
            }),
          ),
          Divider(thickness: 1, indent: 0,)
        ]),
      ),
    );
  }
}