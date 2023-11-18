import 'package:cached_network_image/cached_network_image.dart';
import 'package:cavila_store/constans.dart';
import 'package:cavila_store/models/fake_data.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

class CartItem extends StatefulWidget {
  final FakeData fakeData;
  const CartItem({super.key, required this.fakeData});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = Utils.screenHeight(context);
    double screenWidth = Utils.screenWidth(context);
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            width: screenWidth * 0.22,
            height: screenHeight * 0.17,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: widget.fakeData.index,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.fitHeight)),
                  );
                },
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 2,
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Áo dài',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      '1000\$',
                      style: TextStyle(fontSize: 18),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.grey),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            width: 32,
                            height: 32,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Text('XL'),
                          ),
                        ),
                        Container(
                          width: 32,
                          height: 32,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Text('2'),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete_outline_outlined),
                      color: Constants.pinkColor2,
                    ),
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                          fillColor:
                              MaterialStateProperty.all(Constants.pinkColor2),
                          value: true,
                          onChanged: (value) {}),
                    )
                  ],
                )
              ],
            ))
      ],
    );
  }
}
