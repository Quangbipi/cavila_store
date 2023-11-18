import 'package:flutter/material.dart';

class VoucherItem extends StatelessWidget {
  const VoucherItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Image.asset('assets/images/voucher_item.png'),
                    Container(
                      width: 80,
                      padding: EdgeInsets.only(left: 10),
                      child: Text('Thẻ giảm giá 30%', style: TextStyle(color: Colors.white),))
                  ],
                )),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text('Thẻ giảm giá 30% cho hóa đơn của bạn', style: TextStyle(fontSize: 18, color: Colors.black),),
                ))
            ],
          ),
        ),
        Divider(thickness: 1,)
      ],
    );
  }
}