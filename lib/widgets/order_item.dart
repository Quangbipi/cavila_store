import 'package:cached_network_image/cached_network_image.dart';

import 'package:cavila_store/utils.dart';
import 'package:cavila_store/widgets/widget_button.dart';
import 'package:flutter/material.dart';


import '../models/order_data.dart';
import '../models/product.dart';

class OrderItem extends StatefulWidget {
  final OrderModel orderModel;
  final List<Product> listProduct;
  const OrderItem({super.key, required this.orderModel, required this.listProduct});

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  
  String image = "";
  Product getProduct( ProductElement productElement){
    return widget.listProduct.firstWhere((procuct) => procuct.id == productElement.product!.id);
  }
  String getStatus(int status){
    switch(status){
      case 0:
        return 'Chờ duyệt';
      case 1:
        return 'Đã duyệt';
      case 2:
        return 'Đã hủy';
      case 3:
        return 'Đã giao';
      default:
        return '';
    }
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = Utils.screenHeight(context);
    double screenWidth = Utils.screenWidth(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Material(
        shadowColor: Colors.grey,
        elevation: 2,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.orderModel.products.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                  imageUrl:
                                      getProduct(widget.orderModel.products[index]).images.first,
                                  imageBuilder: (context, imageProvider) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.fitHeight)),
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(getProduct(widget.orderModel.products[index]).name, style: TextStyle(fontSize: 18),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('Số lượng:    ', style: TextStyle(fontSize: 14)),
                                      SizedBox(height: 10,),
                                      Text('${widget.orderModel.products[index].quantity}',style: TextStyle(fontSize: 14))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('Màu sắc:   ', style: TextStyle(fontSize: 14)),
                                      SizedBox(height: 10,),
                                      Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Utils.getColor(widget.orderModel.products[index].color)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('Size:           ', style: TextStyle(fontSize: 14)),
                                      SizedBox(height: 10,),
                                      Container(
                                        width: 24,
                                        height: 24,
                                        alignment: Alignment.center,
                                        decoration:  BoxDecoration(
                                            color: Colors.grey.shade100,
                                            shape: BoxShape.circle),
                                        child: Text(widget.orderModel.products[index].size),
                                      ),
                                    ],
                                  )
                                ],
                              ))
                        ]),
                        
                        widget.orderModel.isConfirm == 3 ? WidgetButton.buildButtonSmall(
                          screenHeight*0.03, 
                          screenWidth*0.1, 
                          (){
                            Utils.showAlertCustom(context, widget.orderModel.products[index].product!.id);
                          }, 
                          'Đánh giá'):Container()
                      ],
                    );
                  }),
              Divider(
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trạng thái:',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(getStatus(widget.orderModel.isConfirm),
                        style: TextStyle(fontSize: 18, color: Colors.redAccent))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tổng hóa đơn:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(Utils.numberFormat(widget.orderModel.finalPrice),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
