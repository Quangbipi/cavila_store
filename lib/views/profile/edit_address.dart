import 'package:cavila_store/routes/route_paths.dart';
import 'package:cavila_store/widgets/app_bar.dart';
import 'package:cavila_store/widgets/background_circle.dart';
import 'package:cavila_store/widgets/widget_content_row.dart';
import 'package:flutter/material.dart';

import '../../constans.dart';
import '../../models/account_infor.dart';
import '../../secure_storage_service.dart';
import '../../utils.dart';

class EditAddress extends StatefulWidget {
  const EditAddress({super.key});

  @override
  State<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  AccountInfor? accountInfor;

  void getData() async {
    accountInfor = await SecureStorageService().getAccount();
    setState(() {});
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
   
    return Scaffold(
        backgroundColor: Constants.bgk,
        extendBodyBehindAppBar: true,
        appBar: AppBarWidget.appBarTitle('Địa chỉ của tôi', context),
        body: Stack(
          children: [
            BackgroundCircle.backgroundCircleTop(context),
            BackgroundCircle.backgroundCircleBottom(context),
            Padding(
              padding:  EdgeInsets.only(left: 10, top: screenHeight*0.1, right: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(
                      thickness: 3,
                    ),
                    ContentRow.contentRow(
                        'Địa chỉ', () {}, '', const SizedBox()),
                    const Divider(
                      thickness: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        accountInfor != null ? '${accountInfor!.fullName} | ${accountInfor!.phoneNumber}' : '',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                     Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        accountInfor != null ? accountInfor!.address : '',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Mặc định',
                        style: TextStyle(fontSize: 12, color: Colors.redAccent),
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RoutePaths.updateAddress);
                        },
                        child: const Text('Chỉnh sửa địa chỉ',
                            style: TextStyle(
                                fontSize: 18, color: Colors.redAccent)),
                      ),
                    )
                  ]),
            ),
          ],
        ));
  }
}
