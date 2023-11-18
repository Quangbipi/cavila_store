import 'package:cavila_store/blocs/fc_auth/event.dart';
import 'package:cavila_store/routes/route_paths.dart';
import 'package:cavila_store/widgets/widget_button.dart';
import 'package:cavila_store/widgets/widget_content_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/fc_auth/bloc.dart';
import '../../constans.dart';
import '../../utils.dart';

class AccountSetting extends StatelessWidget {
  const AccountSetting({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = Utils.screenHeight(context);
    double screenWidth = Utils.screenWidth(context);
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 212, 222, 0),
        title: Text('Thiết lập tài khoản'),
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
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Color.fromRGBO(233, 110, 110, 1),
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Divider(thickness: 3,),
          ContentRow.contentRow(
            'Hồ sơ của tôi', 
            (){
              Navigator.of(context).pushNamed(RoutePaths.editProfile);
            },
            '',
            Icon(Icons.arrow_forward_ios, color: Constants.pinkColor,)),
          Divider(thickness: 1,),
          ContentRow.contentRow('Tên người dùng', (){}, 'Nguyễn Minh Q', SizedBox()),
          Divider(thickness: 1,),
          ContentRow.contentRow('Điện thoại', (){}, '0989xxx', SizedBox()),
          Divider(thickness: 1,),
          ContentRow.contentRow('Đổi mật khẩu', (){}, '',Icon(Icons.arrow_forward_ios, color: Constants.pinkColor,)),
          Divider(thickness: 1,),
          ContentRow.contentRow('Địa chỉ của tôi', (){
            Navigator.of(context).pushNamed(RoutePaths.editAddress);
          }, '',Icon(Icons.arrow_forward_ios, color: Constants.pinkColor,)),
          Divider(thickness: 1,),
          SizedBox(height: 15,),
          WidgetButton.buildButton(
            screenHeight*0.06, 
            screenWidth, 
            (){
              context.read<AuthBloc>().add(SignOutEvent());
              Navigator.of(context).pushNamedAndRemoveUntil(RoutePaths.signInPage, (route) => false);
            }, 
            'Đăng xuất')
        ]),
      ),
      );
  }
}