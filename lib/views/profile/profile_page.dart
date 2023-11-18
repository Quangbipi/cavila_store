import 'package:cavila_store/constans.dart';
import 'package:cavila_store/routes/route_paths.dart';
import 'package:cavila_store/widgets/app_bar.dart';
import 'package:cavila_store/widgets/icon_text_vertical.dart';
import 'package:cavila_store/widgets/widget_content_row.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.primaryColor,
        appBar: AppBarWidget.appBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Divider(
                thickness: 3,
              ),
              ContentRow.contentRowWithIcon(
                  Icon(
                    Icons.favorite_sharp,
                    color: Constants.pinkColor,
                    size: 36,
                  ),
                  'Yêu thích',
                  () {}),
              Divider(
                thickness: 1,
              ),
              ContentRow.contentRowWithIcon(
                  Icon(
                    Icons.list_alt,
                    size: 36,
                    color: Constants.pinkColor,
                  ),
                  'Đơn hàng',
                  () {
                    Navigator.of(context).pushNamed(RoutePaths.orderPage);
                  }),
              Divider(
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconTextVertical.iconTextVertical(
                        Icon(
                          Icons.account_balance_wallet_outlined,
                          size: 36,
                          color: Colors.grey
                        ),
                        'Chờ xác nhận', (){}),
                    IconTextVertical.iconTextVertical(
                        Image.asset('assets/images/box.png',width: 36, height: 36,color: Colors.grey),
                        'Chờ lấy hàng', (){}),
                    IconTextVertical.iconTextVertical(
                        Icon(
                          Icons.local_shipping_outlined,
                          size: 36,
                          color: Colors.grey
                        ),
                        'Đang giao', (){}),
                    IconTextVertical.iconTextVertical(
                        Icon(
                          Icons.star_rate_outlined,
                          size: 36,
                          color: Colors.grey
                        ),
                        'Đánh giá', (){}),
                        
                  ],
                ),
              ),
              Divider(thickness: 3,),
              ContentRow.contentRowWithIcon(
                  Icon(
                    Icons.extension_outlined,
                    color: Constants.pinkColor,
                    size: 36,
                  ),
                  'Tiện ích',
                  () {}),
              Divider(
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconTextVertical.iconTextVertical(
                        Image.asset('assets/images/vi.png',width: 36, height: 36,color: Colors.grey),
                        'Ví thanh toán', (){}),
                    IconTextVertical.iconTextVertical(
                        Image.asset('assets/images/voucher.png',width: 36, height: 36, color: Colors.grey,),
                        'Kho voucher', (){Navigator.of(context).pushNamed(RoutePaths.voucherPage);}),
                  ],
                ),
              ),
              Divider(thickness: 3,),
              ContentRow.contentRowWithIcon(
                  Icon(
                    Icons.person_outlined,
                    color: Constants.pinkColor,
                    size: 36,
                  ),
                  'Thiết lập tài khoản',
                  () {
                    Navigator.of(context).pushNamed(RoutePaths.accountSetting);
                  }),
              Divider(
                thickness: 1,
              ),
              ContentRow.contentRowWithIcon(
                  Icon(
                    Icons.forum_outlined,
                    color: Constants.pinkColor,
                    size: 36,
                  ),
                  'Chat với cửa hàng',
                  () {}),
              Divider(
                thickness: 1,
              ),
            ],
          ),
        ));
  }
}
