import 'package:cavila_store/constans.dart';
import 'package:flutter/material.dart';

class AppBarWidget{
  static PreferredSizeWidget appBar(){
    return AppBar(
        backgroundColor: Colors.transparent,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/logo.jpg'),
            ),
          )
        ],
        leading: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
            ),
            const Icon(
              Icons.apps,
              color: Constants.secondaryColor,
            )
          ],
        ),
      );
  }
}