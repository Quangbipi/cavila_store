import 'package:cavila_store/blocs/fc_auth/bloc.dart';
import 'package:cavila_store/blocs/fc_auth/event.dart';
import 'package:cavila_store/constans.dart';
import 'package:cavila_store/routes/route_paths.dart';
import 'package:cavila_store/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  int valiEmail = 1;
  int valiPass = 1;
  int valiConfirmPass = 1;
  int valiPhone = 1;
  int valiAddress = 1;
  @override
  Widget build(BuildContext context) {
    final screenWidth = Utils.screenWidth(context);
    final screenHeight = Utils.screenHeight(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: screenHeight,
        child: Stack(
          children: [
            Positioned(
              top: screenHeight * 0.25,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Chào mừng bạn đến với Cavila',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Cavila nơi bạn thỏa sức mua sắm'),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      controller: emailController,
                      onChanged: (value) {
                        setState(() {
                          valiEmail = Utils.validateEmail(value);
                        });
                      },
                      decoration: InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 22),
                          errorText: valiEmail == 1 ? null : 'Email không hợp lệ'
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      controller: passController,
                      onChanged: (value) {
                        setState(() {
                          valiPass = Utils.validatePass(value);
                        });
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Mật khẩu',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 22),
                          errorText: valiPass == 1 ? null : 'Mật khẩu phải lớn hơn 6 ký tự'),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      controller: confirmPassController,
                      onChanged: (value) {
                        setState(() {
                          valiConfirmPass = Utils.validateConfirmPass(passController.text, value);
                        });
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Nhập lại mật khẩu',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 22),
                          errorText: valiConfirmPass == 1 ? null : 'Mật khẩu không khớp',),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                          hintText: 'Họ và tên',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 22)),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      controller: addressController,
                      onChanged: (value) {
                        setState(() {
                          valiAddress = Utils.validateAddress(value);
                        });
                      },
                      decoration: InputDecoration(
                          hintText: 'Địa chỉ',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 22),
                          errorText: valiAddress == 1 ? null : 'Địa chỉ không rõ ràng'),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter
                                  .digitsOnly // Chỉ cho phép nhập số
                            ],
                      onChanged: (value) {
                        setState(() {
                          valiPhone = Utils.validatePhone(value);
                        });
                      },
                      decoration: InputDecoration(
                          hintText: 'Số điện thoại',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 22),
                          errorText: valiPhone == 1 ? null : 'Số điện thoại phải chứa ít nhất 10 chữ số'),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextButton(
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                                Size(screenWidth, screenHeight * 0.07)),
                            backgroundColor: MaterialStateProperty.all(
                                Constants.secondaryColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          onPressed: () {
                            if(Utils.validateAll(
                              emailController,
                              passController, 
                              confirmPassController, 
                              nameController, 
                              addressController, 
                              phoneNumberController, 
                              context) == 0){
                                return;
                              }
                            context.read<AuthBloc>().add(SignUpEvent(
                                emailController.text,
                                passController.text,
                                addressController.text,
                                nameController.text,
                                phoneNumberController.text));
                          },
                          child: const Text(
                            'Đăng ký',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ))),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Bạn đã có tài khoản? '),
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, RoutePaths.signInPage);
                          },
                          child: Text(
                            'Đăng nhập',
                            style: TextStyle(color: Constants.secondaryColor),
                          ))
                    ],
                  )
                ],
              ),
            ),
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
          ],
        ),
      ),
    ));
  }
}
