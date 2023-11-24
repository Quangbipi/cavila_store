import 'package:cavila_store/blocs/fc_auth/bloc.dart';
import 'package:cavila_store/blocs/fc_auth/event.dart';
import 'package:cavila_store/widgets/background_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/fc_auth/state.dart';
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
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  bool isEdit = false;
  void getData() async {
    accountInfor = await SecureStorageService().getAccount();
    setState(() {
      phoneNumber.text = accountInfor!.phoneNumber;
      email.text = accountInfor!.email;
      name.text = accountInfor!.fullName;
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
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        Navigator.of(context)..pop()..pop();
      },
      child: Scaffold(
          backgroundColor: Constants.bgk,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(255, 212, 222, 0),
            title: const Text('Sửa hồ sơ'),
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
            actions: [
              TextButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(UpdateProfileEvent(name.text, phoneNumber.text, email.text));
                  },
                  child: const Text(
                    'Lưu',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Constants.secondaryColor),
                  ))
            ],
          ),
          body: Stack(
            children: [
              BackgroundCircle.backgroundCircleTop(context),
              BackgroundCircle.backgroundCircleBottom(
                context,
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.1),
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: screenHeight,
                    child: Column(children: [
                      const Divider(
                        thickness: 3,
                      ),
                      const Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                radius: 48,
                                backgroundImage: NetworkImage('https://cdn.sforum.vn/sforum/wp-content/uploads/2023/10/avatar-trang-4.jpg'),
                              ),
                              Text('Chạm để thay đổi avatar')
                            ],
                          )),
                      Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Icon(
                                    Icons.edit,
                                    color: Constants.secondaryColor,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isEdit = true;
                                      });
                                    },
                                    child: const Text(
                                      'Sửa',
                                      style:
                                          TextStyle(color: Constants.secondaryColor),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              ContentRow.contentRowWithTextField(
                                  'Tên',
                                  () {},
                                  name,
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Constants.secondaryColor,
                                  ),
                                  isEdit),
                              const Divider(
                                thickness: 1,
                              ),
                              ContentRow.contentRowWithTextField(
                                  'Điện thoại',
                                  () {},
                                  phoneNumber,
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Constants.secondaryColor,
                                  ),
                                  isEdit),
                              const Divider(
                                thickness: 1,
                              ),
                              ContentRow.contentRowWithTextField(
                                  'Email',
                                  () {},
                                  email,
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Constants.secondaryColor,
                                  ),
                                  isEdit),
                              const Divider(
                                thickness: 1,
                              ),
                            ],
                          ))
                    ]),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
