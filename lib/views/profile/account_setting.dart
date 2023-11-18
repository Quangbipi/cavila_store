import 'package:cavila_store/blocs/fc_auth/event.dart';
import 'package:cavila_store/models/account_infor.dart';
import 'package:cavila_store/routes/route_paths.dart';
import 'package:cavila_store/secure_storage_service.dart';
import 'package:cavila_store/widgets/widget_button.dart';
import 'package:cavila_store/widgets/widget_content_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/fc_auth/bloc.dart';
import '../../constans.dart';
import '../../utils.dart';

class AccountSetting extends StatefulWidget {
  const AccountSetting({super.key});

  @override
  State<AccountSetting> createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  AccountInfor? accountInfor;

  void getData() async {
    accountInfor = await SecureStorageService().getAccount();
    setState(() {
      
    });
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
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 212, 222, 0),
        title: const Text('Thiết lập tài khoản'),
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
          const Divider(
            thickness: 3,
          ),
          ContentRow.contentRow('Hồ sơ của tôi', () {
            if (accountInfor != null &&
                Utils.checkAutoLogin(accountInfor!.token)) {
              Navigator.of(context).pushNamed(RoutePaths.editProfile);
            } else {
              Navigator.of(context).pushNamed(RoutePaths.signInPage);
            }
          },
              '',
              const Icon(
                Icons.arrow_forward_ios,
                color: Constants.pinkColor,
              )),
          const Divider(
            thickness: 1,
          ),
          ContentRow.contentRow(
              'Tên người dùng',
              () {},
              accountInfor != null
                  ? accountInfor!.fullName
                  : '',
              const SizedBox()),
          const Divider(
            thickness: 1,
          ),
          ContentRow.contentRow(
              'Điện thoại',
              () {},
              accountInfor != null && Utils.checkAutoLogin(accountInfor!.token)
                  ? accountInfor!.phoneNumber
                  : '',
              const SizedBox()),
          const Divider(
            thickness: 1,
          ),
          ContentRow.contentRow('Đổi mật khẩu', () {
            if (accountInfor != null &&
                Utils.checkAutoLogin(accountInfor!.token)) {
            } else {
              Navigator.of(context).pushNamed(RoutePaths.signInPage);
            }
          },
              '',
              const Icon(
                Icons.arrow_forward_ios,
                color: Constants.pinkColor,
              )),
          const Divider(
            thickness: 1,
          ),
          ContentRow.contentRow('Địa chỉ của tôi', () {
            if (accountInfor != null &&
                Utils.checkAutoLogin(accountInfor!.token)) {
              Navigator.of(context).pushNamed(RoutePaths.editAddress);
            } else {
              Navigator.of(context).pushNamed(RoutePaths.signInPage);
            }
          },
              '',
              const Icon(
                Icons.arrow_forward_ios,
                color: Constants.pinkColor,
              )),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(
            height: 15,
          ),
          WidgetButton.buildButton(screenHeight * 0.06, screenWidth, () {
            if (accountInfor != null &&
                Utils.checkAutoLogin(accountInfor!.token)) {
              context.read<AuthBloc>().add(SignOutEvent());
              Navigator.of(context).pushReplacementNamed(RoutePaths.signInPage);
            } else {
              Navigator.of(context).pushReplacementNamed(RoutePaths.signInPage);
            }
          },
              accountInfor != null && Utils.checkAutoLogin(accountInfor!.token)
                  ? 'Đăng xuất'
                  : 'Đăng nhập')
        ]),
      ),
    );
  }
}
