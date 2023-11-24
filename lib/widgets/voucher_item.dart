import 'package:cavila_store/models/voucher_model.dart';
import 'package:flutter/material.dart';

class VoucherItem extends StatelessWidget {
  final Voucher voucher;
  const VoucherItem({super.key, required this.voucher});

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
                      child: Text(voucher.name, style: TextStyle(color: Colors.white),maxLines: 2,))
                  ],
                )),
              Expanded(
                flex: 2,
                child: Text(voucher.name, style: TextStyle(fontSize: 18, color: Colors.black),
                ))
            ],
          ),
        ),
        Divider(thickness: 1,)
      ],
    );
  }
}