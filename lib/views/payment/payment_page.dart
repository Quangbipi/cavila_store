import 'package:cavila_store/constans.dart';
import 'package:cavila_store/widgets/widget_button.dart';
import 'package:flutter/material.dart';

import '../../utils.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = Utils.screenHeight(context);
    double screenWidth = Utils.screenWidth(context);
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 212, 222, 0),
        title: Text('Thanh Toán'),
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Địa chỉ nhận',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Nguyễn Minh Quang',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('204 Trần Duy Hưng, Trung Hòa, Cầu Giấy, Hà Nội'),
                  Container(
                    width: screenWidth * 0.35,
                    child: TextButton(
                        style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                                Size(screenWidth * 0.3, screenHeight * 0.01)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white)),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/edit.png',
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              'Chỉnh sửa địa chỉ',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            )
                          ],
                        )),
                  ),
                  TextButton(
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                              Size(screenWidth * 0.3, screenHeight * 0.07)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)))),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/images/Discount.png'),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '1 Voucher',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          )
                            ],
                          ),
                          SizedBox(),
                          Icon(Icons.arrow_forward_ios, color: Colors.black,)
                        ],
                      )),
                ],
              )),
          Divider(
            thickness: 1,
          ),
          Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50,),
                  Text('Thanh Toán', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Giá', style: TextStyle(fontSize: 18, )),
                      SizedBox(),
                      Text('700000đ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Vận chuyển', style: TextStyle(fontSize: 18, )),
                      SizedBox(),
                      Text('7000000đ', style: TextStyle(fontSize: 18, decoration: TextDecoration.lineThrough )),  
                      Text('700000đ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold ))
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Giá', style: TextStyle(fontSize: 18, )),
                      SizedBox(),
                      Text('700000đ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold ))
                    ],
                  )

                ],
              )),
        ]),
      ),
      bottomNavigationBar: Container(
        height: 120,
        padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.payments_outlined, color: Color(0xFFC67C4E),),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SizedBox(
                    width: 90,
                    height: 30,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Constants.pinkColor),
                      ),
                      onPressed: (){}, 
                      child: Text('Tiền mặt', style: TextStyle(fontSize: 10, color: Colors.white),)),
                  ),
                ),
                Text('7000000đ', style: TextStyle(fontSize: 12, color: Colors.black),)
              ],
            ),
            SizedBox(
              height: 70,
              width: screenWidth,
              child: WidgetButton.buildButton(0, 0, (){}, 'Thanh toán ngay'),
            )
          ],
        ),
      ),
    );
  }
}
