import 'package:cavila_store/widgets/widget_content_row.dart';
import 'package:flutter/material.dart';

import '../../constans.dart';

class EditAddress extends StatelessWidget {
  const EditAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 212, 222, 0),
        title: Text('Địa chỉ của tôi'),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Divider(thickness: 3,),
          ContentRow.contentRow('Địa chỉ', (){}, '', SizedBox()),
          Divider(thickness: 1,),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text('Nguyễn Minh Quang | xxxxx154', style: TextStyle(fontSize: 18, color: Colors.black),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text('204, Trần Duy Hưng, XX, Hà Nội', style: TextStyle(fontSize: 18, color: Colors.black),),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text('Mặc đinh', style: TextStyle(fontSize: 12, color: Colors.redAccent),),
            ),
          Divider(thickness: 1,),
          Container(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: (){}, 
              child: Text('Chỉnh sửa địa chỉ', style: TextStyle(fontSize: 18, color: Colors.redAccent)),),
          )
        ]),
      ),
      );
  }
}