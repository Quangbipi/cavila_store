import 'package:cavila_store/blocs/fc_check_login/event.dart';
import 'package:cavila_store/blocs/fc_check_login/state.dart';
import 'package:cavila_store/blocs/fc_product/event.dart';
import 'package:cavila_store/constans.dart';
import 'package:cavila_store/routes/route_paths.dart';
import 'package:cavila_store/widgets/app_bar.dart';
import 'package:cavila_store/widgets/icon_text_vertical.dart';
import 'package:cavila_store/widgets/widget_content_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/fc_check_login/bloc.dart';
import '../../blocs/fc_order/bloc.dart';
import '../../blocs/fc_order/event.dart';
import '../../blocs/fc_product/bloc.dart';
import '../../models/account_infor.dart';
import '../../secure_storage_service.dart';
import '../../utils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AccountInfor? accountInfor;
  String userId = "";
  bool isLogin = false;
  void getData()async{
    accountInfor = await SecureStorageService().getAccount();
    
    setState(() {
      if(accountInfor != null){
        userId = accountInfor!.id;
      }
      
    });
    
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CheckBloc>().add(CheckEvent());
    getData();
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = Utils.screenHeight(context);
    double screenWidth = Utils.screenWidth(context);
    return BlocListener<CheckBloc, CheckLoginState>(
      listener: (context, state) {
        if(state is IsLogin){
          setState(() {
            isLogin = true;
          });
        }
      },
      child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          extendBodyBehindAppBar: true,
          appBar: AppBarWidget.appBar(context),
          body: Stack(
            children: [
              Positioned(
                top: -(screenWidth * 0.25),
                child: Container(
                  width: screenWidth * 0.5,
                  height: screenWidth * 0.5,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(106, 224, 217, 0.49),
                  ),
                ),
              ),
              Positioned(
                left: -(screenWidth * 0.25),
                child: Container(
                  width: screenWidth * 0.5,
                  height: screenWidth * 0.5,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(106, 224, 217, 0.49),
                  ),
                ),
              ),
              Positioned(
                bottom: -(screenWidth * 0.25),
                right: 0,
                child: Container(
                  width: screenWidth * 0.5,
                  height: screenWidth * 0.5,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(106, 224, 217, 0.49),
                  ),
                ),
              ),
              Positioned(
                right: -(screenWidth * 0.25),
                bottom: 0,
                child: Container(
                  width: screenWidth * 0.5,
                  height: screenWidth * 0.5,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(106, 224, 217, 0.49),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: 10, right: 10, top: screenHeight*0.12),
                child: Column(
                  children: [
                    const Divider(
                      thickness: 3,
                    ),
                    ContentRow.contentRowWithIcon(
                        const Icon(
                          Icons.favorite_sharp,
                          color: Constants.secondaryColor,
                          size: 36,
                        ),
                        'Yêu thích',
                        () {
                          Utils.showAlert(context, 'Chức năng đang được phát triển', (){Navigator.pop(context);});
                        }),
                    const Divider(
                      thickness: 1,
                    ),
                    ContentRow.contentRowWithIcon(
                        const Icon(
                          Icons.list_alt,
                          size: 36,
                          color: Constants.secondaryColor,
                        ),
                        'Đơn hàng', () {
                          if(accountInfor != null){
                            context.read<ProductBloc>().add(GetProductEvent());
                          context.read<OrderBloc>().add(GetOrderEvent(userId));
                      Navigator.of(context).pushNamed(RoutePaths.orderPage);
                          }else{
                            Utils.showAlert(context, 'Bạn cần đăng nhập để thực hiện chức năng này', (){Navigator.pop(context);});
                          }
                    }),
                    const Divider(
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconTextVertical.iconTextVertical(
                              const Icon(Icons.account_balance_wallet_outlined,
                                  size: 36, color: Colors.grey),
                              'Chờ xác nhận',
                              () {Utils.showAlert(context, 'Chức năng đang được phát triển', (){Navigator.pop(context);});}),
                          IconTextVertical.iconTextVertical(
                              Image.asset('assets/images/box.png',
                                  width: 36, height: 36, color: Colors.grey),
                              'Chờ lấy hàng',
                              () {Utils.showAlert(context, 'Chức năng đang được phát triển', (){Navigator.pop(context);});}),
                          IconTextVertical.iconTextVertical(
                              const Icon(Icons.local_shipping_outlined,
                                  size: 36, color: Colors.grey),
                              'Đang giao',
                              () {Utils.showAlert(context, 'Chức năng đang được phát triển', (){Navigator.pop(context);});}),
                          IconTextVertical.iconTextVertical(
                              const Icon(Icons.star_rate_outlined,
                                  size: 36, color: Colors.grey),
                              'Đánh giá',
                              () {Utils.showAlert(context, 'Chức năng đang được phát triển', (){Navigator.pop(context);});}),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 3,
                    ),
                    ContentRow.contentRowWithIcon(
                        const Icon(
                          Icons.extension_outlined,
                          color: Constants.secondaryColor,
                          size: 36,
                        ),
                        'Tiện ích',
                        () {Utils.showAlert(context, 'Chức năng đang được phát triển', (){Navigator.pop(context);});}),
                    const Divider(
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconTextVertical.iconTextVertical(
                              Image.asset('assets/images/vi.png',
                                  width: 36, height: 36, color: Colors.grey),
                              'Ví thanh toán',
                              () {Utils.showAlert(context, 'Chức năng đang được phát triển', (){Navigator.pop(context);});}),
                          IconTextVertical.iconTextVertical(
                              Image.asset(
                                'assets/images/voucher.png',
                                width: 36,
                                height: 36,
                                color: Colors.grey,
                              ),
                              'Kho voucher', () {
                            Navigator.of(context)
                                .pushNamed(RoutePaths.voucherPage);
                          }),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 3,
                    ),
                    ContentRow.contentRowWithIcon(
                        const Icon(
                          Icons.person_outlined,
                          color: Constants.secondaryColor,
                          size: 36,
                        ),
                        'Thiết lập tài khoản', () {
                      Navigator.of(context).pushNamed(RoutePaths.accountSetting);
                    }),
                    const Divider(
                      thickness: 1,
                    ),
                    ContentRow.contentRowWithIcon(
                        const Icon(
                          Icons.forum_outlined,
                          color: Constants.secondaryColor,
                          size: 36,
                        ),
                        'Chat với cửa hàng',
                        () {}),
                    const Divider(
                      thickness: 1,
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
