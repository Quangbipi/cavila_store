import 'package:cavila_store/blocs/fc_payment/bloc.dart';
import 'package:cavila_store/blocs/fc_payment/event.dart';
import 'package:cavila_store/blocs/fc_payment/state.dart';
import 'package:cavila_store/blocs/fc_product/bloc.dart';
import 'package:cavila_store/blocs/fc_product/event.dart';
import 'package:cavila_store/blocs/fc_voucher/bloc.dart';
import 'package:cavila_store/blocs/fc_voucher/state.dart';
import 'package:cavila_store/constans.dart';
import 'package:cavila_store/models/payment_model.dart';
import 'package:cavila_store/models/voucher_model.dart';
import 'package:cavila_store/routes/route_paths.dart';
import 'package:cavila_store/widgets/background_circle.dart';
import 'package:cavila_store/widgets/widget_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import '../../blocs/fc_order/bloc.dart';
import '../../blocs/fc_order/event.dart';
import '../../models/account_infor.dart';
import '../../secure_storage_service.dart';
import '../../utils.dart';

class PaymentPage extends StatefulWidget {
  final PaymentModel paymentModel;
  const PaymentPage({super.key, required this.paymentModel});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int count=0;
  String idVoucher = "";
  int priceUsed = 0;
  bool isSelect = false;
  Voucher voucher = Voucher(id: "id", name: "name", code: "code", discountPrice: 0, quantity: 0,);
  AccountInfor? accountInfor;
  String userId= "";
  void getData()async{
    accountInfor = await SecureStorageService().getAccount();
    setState(() {
      userId = accountInfor!.id;
    });
  }
  int getFinalPrice(String idVoucher, int priceUsed){
    return idVoucher.isNotEmpty && priceUsed <= widget.paymentModel.finalPrice 
    ? widget.paymentModel.finalPrice - voucher.discountPrice : widget.paymentModel.finalPrice;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = Utils.screenHeight(context);
    double screenWidth = Utils.screenWidth(context);
    return ProgressHUD(
      child: BlocListener<PaymentBloc, PaymentState>(
        listener: (context, state) {
          if(state is PaymentLoading){
            Future.delayed(Duration.zero, () {
              var progress = ProgressHUD.of(context);
              progress!.show();
            });
          }
          if(state is PaymentSuccess){
            Future.delayed(Duration.zero, () {
              var progress = ProgressHUD.of(context);
              progress!.dismiss();
            });
            widget.paymentModel.products.forEach((product) { 
              context.read<ProductBloc>().add(DeleteProductInCart(product.idProduct));
            });
            Utils.showAlert(context, 'Bạn đã đặt hàng thành công', (){
              context.read<ProductBloc>().add(GetProductEvent());
              context.read<OrderBloc>().add(GetOrderEvent(userId));
              Navigator.of(context).pushReplacementNamed(RoutePaths.orderPage);
              
              Navigator.pop(context);
            });
          }
          if(state is PaymentLoading){
            Future.delayed(Duration.zero, () {
              var progress = ProgressHUD.of(context);
              progress!.dismiss();
            });
          }
        },
        child: Scaffold(
          backgroundColor: Constants.bgk,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(255, 212, 222, 0),
            title: const Text('Thanh Toán'),
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
          ),
          body: Stack(
            children: [
              BackgroundCircle.backgroundCircleTop(context),
              Padding(
            padding:  EdgeInsets.only(left: 20, right: 20, top: screenHeight*0.15),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'Địa chỉ nhận',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        accountInfor != null ? accountInfor!.fullName : '',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(accountInfor != null ? accountInfor!.address : '',),
                      Container(
                        width: screenWidth * 0.35,
                        child: TextButton(
                            style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(
                                    Size(screenWidth * 0.3, screenHeight * 0.01)),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/edit.png',
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                InkWell(
                                  onTap: (){
                                    Navigator.pushNamed(context, RoutePaths.accountSetting);
                                  },
                                  child: Text(
                                    'Chỉnh sửa địa chỉ',
                                    style:
                                        TextStyle(color: Colors.black, fontSize: 12),
                                  ),
                                )
                              ],
                            )),
                      ),
                      TextButton(
                          style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(
                                  Size(screenWidth * 0.3, screenHeight * 0.07)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)))),
                          onPressed: () {},
                          child: BlocListener<VoucherBloc, VoucherState>(
                            listener: (context, state) {
                              if(state is GetVoucherSuccess){
                                setState(() {
                                  count = state.vouchers.length;
                                });
                              }
                            },
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, RoutePaths.voucherPage).then((value) {
                                  setState(() {
                                    dynamic result = value;
      
                                    voucher = result;
                                    idVoucher = result.id;
                                    priceUsed = result.priceUsed ?? 0;
                                    isSelect = true;
                                  });
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset('assets/images/Discount.png'),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    voucher.name == 'name' ? '$count Voucher': voucher.name,
                                    style: TextStyle(color: Colors.black, fontSize: 18),
                                  )
                                    ],
                                  ),
                                  const SizedBox(),
                                  const Icon(Icons.arrow_forward_ios, color: Colors.black,)
                                ],
                              ),
                            ),
                          )),
                    ],
                  )),
              const Divider(
                thickness: 1,
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50,),
                      Text('Thanh Toán', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Giá', style: TextStyle(fontSize: 18, )),
                          SizedBox(),
                          idVoucher.isNotEmpty && priceUsed > 0
                          && priceUsed <= widget.paymentModel.finalPrice
                          ? Text("${Utils.numberFormat(widget.paymentModel.finalPrice)} đ", style: TextStyle(fontSize: 18, decoration: TextDecoration.lineThrough )): Text(''),
                          Text(getFinalPrice(idVoucher, priceUsed) >= 0 ? "${Utils.numberFormat(getFinalPrice(idVoucher, priceUsed))} đ" : '0 đ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Vận chuyển', style: TextStyle(fontSize: 18, )),
                          SizedBox(),
                          //Text('7000000đ', style: TextStyle(fontSize: 18, decoration: TextDecoration.lineThrough )),  
                          Text('0 đ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold ))
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tổng thanh toán', style: TextStyle(fontSize: 18, )),
                          SizedBox(),
                          Text(getFinalPrice(idVoucher, priceUsed) >= 0?'${Utils.numberFormat(getFinalPrice(idVoucher, priceUsed))} đ':'0 đ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold ))
                        ],
                      )
      
                    ],
                  )),
            ]),
          ),
            ],
          ),
          bottomNavigationBar: Container(
            height: 120,
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.payments_outlined, color: Color(0xFFC67C4E),),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: SizedBox(
                        width: 90,
                        height: 30,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Constants.secondaryColor),
                          ),
                          onPressed: (){}, 
                          child: const Text('Tiền mặt', style: TextStyle(fontSize: 10, color: Colors.white),)),
                      ),
                    ),
                    Text(getFinalPrice(idVoucher, priceUsed) >= 0?'${Utils.numberFormat(getFinalPrice(idVoucher, priceUsed))} đ':'0 đ', style: TextStyle(fontSize: 12, color: Colors.black),)
                  ],
                ),
                SizedBox(
                  height: 70,
                  width: screenWidth,
                  child: WidgetButton.buildButton(0, 0, (){
                    PaymentModel paymentModelFinal = PaymentModel(
                      idUser: widget.paymentModel.idUser, 
                      products: widget.paymentModel.products, 
                      voucherId: idVoucher.isEmpty ? "" : idVoucher, 
                      finalPrice: getFinalPrice(idVoucher, priceUsed) >= 0 ? getFinalPrice(idVoucher, priceUsed) : 0);
                    context.read<PaymentBloc>().add(AccessPaymentEvent(paymentModelFinal));
                  }, 'Thanh toán ngay'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//&& voucher.expiryDate == null || voucher.expiryDate!.compareTo(DateTime.now())>= 0