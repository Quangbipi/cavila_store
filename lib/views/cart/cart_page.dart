
import 'package:cavila_store/blocs/fc_check_login/state.dart';
import 'package:cavila_store/blocs/fc_product/bloc.dart';
import 'package:cavila_store/blocs/fc_product/state.dart';
import 'package:cavila_store/models/account_infor.dart';
import 'package:cavila_store/models/cart_model.dart';
import 'package:cavila_store/models/payment_model.dart';
import 'package:cavila_store/routes/route_paths.dart';
import 'package:cavila_store/widgets/app_bar.dart';
import 'package:cavila_store/widgets/cart_item.dart';
import 'package:cavila_store/widgets/widget_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import '../../blocs/fc_check_login/bloc.dart';
import '../../blocs/fc_product/event.dart';
import '../../blocs/fc_voucher/bloc.dart';
import '../../blocs/fc_voucher/event.dart';
import '../../secure_storage_service.dart';
import '../../utils.dart';
import '../../widgets/background_circle.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<LikedProductCart> products = [];
  AccountInfor? accountInfor;
  void getData() async {
    accountInfor = await SecureStorageService().getAccount();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(GetProductFromCartEvent());
    
    getData();
  }
  
  int totalPrice = 0;
  int totalPrice2 = 0;
  bool isSelect = false;
  List<ProductSelect> productSelects = [];

  
  @override
  Widget build(BuildContext context) {
    double screenHeight = Utils.screenHeight(context);
    double screenWidth = Utils.screenWidth(context);
    return ProgressHUD(
      child: BlocListener<CheckBloc,CheckLoginState>(
        listener: (context, state) {
          if(state is NotLogin){
            Utils.showAlert(context, 'Bạn cần đăng nhập để thực hiện chức năng này', (){
              Navigator.pop(context);
              Navigator.of(context).pushNamed(RoutePaths.signInPage);
            });
            
          }
        },
        child: Scaffold(
            backgroundColor: Colors.grey.shade100,
            body: BlocConsumer<ProductBloc, ProductState>(
              listener: (context, state) {
                if (state is GetProductFromCartSuccess) {
                  products = state.cartModel.likedProducts;
                  Future.delayed(Duration.zero, () {
                    var progress = ProgressHUD.of(context);
                    progress!.dismiss();
                  });
                }
                if(state is GetProductFromCartFail){
                  Future.delayed(Duration.zero, () {
                    var progress = ProgressHUD.of(context);
                    progress!.dismiss();
                  });
                }
                if (state is GetProductFromCartLoading ||
                    state is DeleteProductInCartLoading) {
                  Future.delayed(Duration.zero, () {
                    var progress = ProgressHUD.of(context);
                    progress!.show();
                  });
                }
                if (state is DeleteProductInCartSuccess) {
                  Future.delayed(Duration.zero, () {
                    var progress = ProgressHUD.of(context);
                    progress!.dismiss();
                  });
                  setState(() {
                    totalPrice = 0;
                    productSelects = [];
                  });
                  context.read<ProductBloc>().add(GetProductFromCartEvent());
                }
              },
              buildWhen: (previous, current) {
                return current is GetProductFromCartFail ||
                    current is GetProductFromCartLoading ||
                    current is GetProductFromCartSuccess;
              },
              builder: (context, state) => Stack(
                children: [
                  BackgroundCircle.backgroundCircleTop(context),
                  Positioned(
                      left: 0,
                      top: 0,
                      right: 0,
                      child: AppBarWidget.appBar(context)),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, screenHeight * 0.101, 10, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        state is GetProductFromCartSuccess
                            ? Expanded(
                                flex: 2,
                                child: products.isNotEmpty
                                    ? ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: products.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 5),
                                            child: CartItem(
                                              product: products[index],
                                              onCheckboxChanged: (value) {
                                                setState(() {
                                                  isSelect = value;
                                                });
                                              },
                                              onTotalPriceChanged: (value) {
                                                setState(() {
                                                  isSelect
                                                      ? totalPrice += value *
                                                          products[index]
                                                              .productId
                                                              .price
                                                      : totalPrice -= value *
                                                          products[index]
                                                              .productId
                                                              .price;
                                                  ProductSelect productSelect =
                                                      ProductSelect(
                                                          idProduct:
                                                              products[index]
                                                                  .productId
                                                                  .id,
                                                          quantity: value,
                                                          size: products[index]
                                                              .size,
                                                          color: products[index]
                                                              .color);
                                                  if (isSelect) {
                                                    if (!productSelects.contains(
                                                        productSelect)) {
                                                      productSelects
                                                          .add(productSelect);
                                                    }
                                                  }
                                                  if (isSelect == false) {
                                                    bool isInclude =
                                                        productSelects.contains(
                                                            productSelect);
                                                    if (isInclude == true) {
                                                      productSelects
                                                          .remove(productSelect);
                                                    }
                                                  }
                                                  print(
                                                      productSelects.toString());
                                                });
                                              },
                                            ),
                                          );
                                        })
                                    : Center(
                                        child: Text(
                                            'Chưa có sản phẩm được thêm vào'),
                                      ))
                            : Expanded(
                                flex: 2,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                )),
                        Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  const Divider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Tổng:',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      SizedBox(),
                                      Text(
                                        '${Utils.numberFormat(totalPrice)} đ',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  WidgetButton.buildButton(
                                      screenHeight * 0.06, screenWidth * 0.8, () {
                                    if(productSelects.isNotEmpty){
                                      PaymentModel paymentModel = PaymentModel(
                                        idUser: accountInfor!.id,
                                        products: productSelects,
                                        voucherId: "",
                                        finalPrice: totalPrice);
                                    context
                                        .read<VoucherBloc>()
                                        .add(GetVoucherEvent());
                                    Navigator.of(context).pushNamed(
                                        RoutePaths.paymentPage,
                                        arguments: paymentModel);
                                    }else{
                                      Utils.showAlert(context, 'Bạn chưa chọn sản phẩm', (){Navigator.pop(context);});
                                    }
                                  }, 'Thanh toán'),
                                ],
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
