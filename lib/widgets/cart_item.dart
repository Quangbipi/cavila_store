import 'package:cached_network_image/cached_network_image.dart';
import 'package:cavila_store/blocs/fc_product/bloc.dart';
import 'package:cavila_store/blocs/fc_product/event.dart';
import 'package:cavila_store/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/cart_model.dart';
import '../utils.dart';

// ignore: must_be_immutable
class CartItem extends StatefulWidget {
  final LikedProductCart product;
  final ValueChanged<bool> onCheckboxChanged;
  final ValueChanged<int> onTotalPriceChanged;
  CartItem(
      {super.key,
      required this.product,
      required this.onCheckboxChanged,
      required this.onTotalPriceChanged});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int number = 1;
  bool isSelect = false;
  int totalPrice = 0;

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
                imageUrl: widget.product.productId.images.first,
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
                      widget.product.productId.name,
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      Utils.numberFormat(widget.product.productId.price),
                      style: TextStyle(fontSize: 18),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Utils.getColor(widget.product.color)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            width: 32,
                            height: 32,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Text(widget.product.size),
                          ),
                        ),
                        Container(
                          width: 32,
                          height: 32,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Text(number.toString()),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                            width: 64,
                            height: 32,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (number == 1) return;
                                      number--;
                                      widget.onCheckboxChanged(isSelect);
                                      if (isSelect) {
                                        widget.onTotalPriceChanged(-1);
                                      }
                                    });
                                  },
                                  child: Container(
                                      width: 16,
                                      height: 32,
                                      child: Text(
                                        '-',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      )),
                                ),
                                VerticalDivider(
                                  thickness: 1,
                                  indent: 0,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      number++;
                                      widget.onCheckboxChanged(isSelect);
                                      if (isSelect) {
                                        widget.onTotalPriceChanged(1);
                                      }
                                    });
                                  },
                                  child: Container(
                                      height: 32,
                                      width: 16,
                                      child: Text(
                                        '+',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      )),
                                ),
                              ],
                            )),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        context.read<ProductBloc>().add(
                            DeleteProductInCart(widget.product.productId.id));
                        setState(() {
                          isSelect = false;
                          widget.onCheckboxChanged(isSelect);
                        });
                      },
                      icon: Icon(Icons.delete_outline_outlined),
                      color: Constants.secondaryColor,
                    ),
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                          fillColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            // Màu của ô khi chưa được chọn
                            if (states.contains(MaterialState.selected)) {
                              return Constants.secondaryColor; // Màu khi checkbox được chọn
                            }
                            return Colors
                                .white; // Màu khi checkbox không được chọn
                          }),
                          value: isSelect,
                          onChanged: (value) {
                            setState(() {
                              isSelect = value!;
                              widget.onCheckboxChanged(isSelect);
                              widget.onTotalPriceChanged(number);
                            });
                          }),
                    )
                  ],
                )
              ],
            ))
      ],
    );
  }
}
