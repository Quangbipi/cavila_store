import 'package:cavila_store/widgets/voucher_item.dart';
import 'package:flutter/material.dart';

import '../../constans.dart';

class VoucherPage extends StatefulWidget {
  const VoucherPage({super.key});

  @override
  State<VoucherPage> createState() => _VoucherPageState();
}

class _VoucherPageState extends State<VoucherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      appBar:  AppBar(
        backgroundColor: Color.fromRGBO(255, 212, 222, 0),
        title: Text('Kho Voucher'),
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
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Divider(thickness: 3,),
          Expanded(child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index){
            return VoucherItem();
          }))
        ]),
      ),);
  }
}