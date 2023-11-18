import 'package:flutter/material.dart';

import '../../constans.dart';
import '../../models/account_infor.dart';
import '../../secure_storage_service.dart';
import '../../utils.dart';
import '../../widgets/widget_content_row.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  AccountInfor? accountInfor;
  
  void getData() async{
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
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 212, 222, 0),
        title: Text('Sửa hồ sơ'),
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
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                'Lưu',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Constants.pinkColor2),
              ))
        ],
      ),
      body: Column(children: [
        Divider(
          thickness: 3,
        ),
        Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 48,
                  backgroundImage: AssetImage('assets/images/anh.png'),
                ),
                Text('Chạm để thay đổi avatar')
              ],
            )),
        Expanded(
            flex: 3,
            child: Column(
              children: [
                Divider(thickness: 1,),
                ContentRow.contentRow(
                    'Tên',
                    () {},
                    accountInfor != null && Utils.checkAutoLogin(accountInfor!.token)? accountInfor!.fullName : '',
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Constants.pinkColor,
                    )),
                // Divider(
                //   thickness: 1,
                // ),
                // ContentRow.contentRow(
                //     'Giới tính',
                //     () {},
                //     'Thiết lập ngay',
                //     Icon(
                //       Icons.arrow_forward_ios,
                //       color: Constants.pinkColor,
                //     )),
                // Divider(
                //   thickness: 1,
                // ),
                // ContentRow.contentRow(
                //     'Ngày sinh',
                //     () {},
                //     'Thiết lập ngay',
                //     Icon(
                //       Icons.arrow_forward_ios,
                //       color: Constants.pinkColor,
                //     )),
                Divider(
                  thickness: 1,
                ),
                ContentRow.contentRow(
                    'Điện thoại',
                    () {},
                    accountInfor != null && Utils.checkAutoLogin(accountInfor!.token)? accountInfor!.phoneNumber : '',
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Constants.pinkColor,
                    )),
                Divider(
                  thickness: 1,
                ),
                ContentRow.contentRow(
                    'Email',
                    () {},
                    accountInfor != null && Utils.checkAutoLogin(accountInfor!.token)? accountInfor!.email : '',
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Constants.pinkColor,
                    )),
                Divider(
                  thickness: 1,
                ),
              ],
            ))
      ]),
    );
  }
}
