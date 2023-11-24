import 'package:cavila_store/blocs/fc_order/bloc.dart';
import 'package:cavila_store/blocs/fc_order/state.dart';
import 'package:cavila_store/blocs/fc_product/state.dart';
import 'package:cavila_store/constans.dart';
import 'package:cavila_store/models/order_data.dart';
import 'package:cavila_store/widgets/app_bar.dart';
import 'package:cavila_store/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import '../../blocs/fc_product/bloc.dart';
import '../../models/product.dart';
import '../../utils.dart';
import '../../widgets/background_circle.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<String> orderStatus = [
    'Chờ xác nhận',
    'Chờ lấy hàng',
    'Đang giao',
    'Đã giao',
    'Bị hủy',
    'Trả hàng'
  ];
  OrderData orderData = OrderData(success: false, data: []);
  List<Product> products = [];
  int x = 0;
  List<OrderModel> getList(int index, List<OrderModel> orderModels) {
    switch (index) {
      case 0:
        return orderModels
            .where(
              (orderModel) => orderModel.isConfirm == 0,
            )
            .toList();
      case 1:
        return orderModels
            .where(
              (orderModel) => orderModel.isConfirm == 1,
            )
            .toList();
      case 2:
        return orderModels
            .where(
              (orderModel) => orderModel.isConfirm == 1,
            )
            .toList();
      case 3:
        return orderModels
            .where(
              (orderModel) => orderModel.isConfirm == 3,
            )
            .toList();
      case 4:
        return orderModels
            .where(
              (orderModel) => orderModel.isConfirm == 2,
            )
            .toList();
      case 5:
        return orderModels
            .where(
              (orderModel) => orderModel.isConfirm == 2,
            )
            .toList();
      default:
        return [];
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = Utils.screenHeight(context);
    double screenWidth = Utils.screenWidth(context);

    return ProgressHUD(
      child: MultiBlocListener(
        listeners: [
          BlocListener<OrderBloc, OrderState>(
            listener: (context, state) {
              if (state is GetOderSuccess) {
                Future.delayed(Duration.zero, () {
                  var progress = ProgressHUD.of(context);
                  progress!.dismiss();
                });
                orderData = state.orderData;
                setState(() {});
              }
              if (state is GetOrderLoading) {
                Future.delayed(Duration.zero, () {
                  var progress = ProgressHUD.of(context);
                  progress!.show();
                });
              }
              if (state is GetOrderFail) {
                Future.delayed(Duration.zero, () {
                  var progress = ProgressHUD.of(context);
                  progress!.dismiss();
                });
              }
            },
          ),
          BlocListener<ProductBloc, ProductState>(
            listener: (context, state){
              if(state is GetProductSuccess){
                products = state.products;
              }
            })
        ],
        child: Scaffold(
            backgroundColor: Constants.bgk,
            body: Stack(
              children: [
                BackgroundCircle.backgroundCircleTop(context),
                BackgroundCircle.backgroundCircleBottom(context),
                Positioned(child: AppBarWidget.appBarTitle('Đơn mua', context)),
                Padding(
                  padding: EdgeInsets.only(
                      left: 10, top: screenHeight * 0.08, right: 10),
                  child: SafeArea(
                    child: Column(children: [
                      Divider(
                        thickness: 3,
                      ),
                      Container(
                        height: screenHeight * 0.03,
                        width: screenWidth,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: orderStatus.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        x = index;
                                      });
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            border: x == index
                                                ? Border(
                                                    bottom: BorderSide(
                                                        width: 1,
                                                        color: Constants
                                                            .pinkColor))
                                                : null),
                                        child: Text(
                                          orderStatus[index],
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ))),
                              );
                            }),
                      ),
                      Divider(
                        thickness: 1,
                        indent: 0,
                      ),
                      Expanded(
                          child: orderData.data.isEmpty || products.isEmpty
                              ? Center(
                                  child: Text('Không có dữ liệu'),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: getList(x, orderData.data).length,
                                  itemBuilder: (context, index) {
                                    return OrderItem(
                                      orderModel:
                                          getList(x, orderData.data)[index],
                                      listProduct: products,
                                    );
                                  }))
                    ]),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
