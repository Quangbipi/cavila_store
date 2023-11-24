import 'package:cavila_store/constans.dart';
import 'package:cavila_store/routes/route_paths.dart';
import 'package:flutter/material.dart';

class AppBarWidget{
  static PreferredSizeWidget appBar(BuildContext context){
    return AppBar(
        backgroundColor: Colors.transparent,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage('https://cdn.sforum.vn/sforum/wp-content/uploads/2023/10/avatar-trang-4.jpg'),
            ),
          )
        ],
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(RoutePaths.mainPage, (route) => false);
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
              const Icon(
                Icons.apps,
                color: Constants.secondaryColor,
              )
            ],
          ),
        ),
      );
  }

  static PreferredSizeWidget appBarTitle(String title, BuildContext context){
    return AppBar(
        backgroundColor: Colors.transparent,
        title: Text(title),
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
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Constants.secondaryColor,
                ),
              )
            ],
          ),
        ),
      );
  }
}