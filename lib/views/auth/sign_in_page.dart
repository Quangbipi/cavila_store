import 'package:cavila_store/blocs/fc_auth/bloc.dart';
import 'package:cavila_store/blocs/fc_auth/event.dart';
import 'package:cavila_store/constans.dart';
import 'package:cavila_store/routes/route_paths.dart';
import 'package:cavila_store/utils.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

import '../../blocs/fc_auth/state.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = Utils.screenWidth(context);
    final screenHeight = Utils.screenHeight(context);
    return ProgressHUD(
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if(state is SignInSuccess){
             Future.delayed(Duration.zero, () {
                  var progress = ProgressHUD.of(context);
                  progress!.dismiss();
                });
            Navigator.of(context).pushReplacementNamed(RoutePaths.mainPage);
          }
          if(state is SignInLoading){
            Future.delayed(Duration.zero, () {
                  var progress = ProgressHUD.of(context);
                  progress!.show();
                });
          }
          if(state is SignInFail){
             Future.delayed(Duration.zero, () {
                  var progress = ProgressHUD.of(context);
                  progress!.dismiss();
                });
            Utils.showAlert(
              context, 
              'Tài khoản hoặc mật khẩu không chính xác', 
              (){Navigator.pop(context);});
          }
        },
        child: Scaffold(
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
                        'Welcome back!',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DottedBorder(
                          strokeWidth: 1,
                          color: Colors.grey,
                          dashPattern: [8, 6],
                          padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                          child: Image.asset('assets/images/image_login.png')),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: TextField(
                          controller: email,
                          decoration: InputDecoration(
                              hintText: 'Tài khoản',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 22)),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: TextField(
                          controller: password,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: 'Mật khẩu',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 22)),
                        ),
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
                                if(email.text.isEmpty || password.text.isEmpty){
                                  Utils.showAlert(context, 'Vui lòng nhập đủ thông tin', (){Navigator.pop(context);});
                                }
                                if(password.text.isNotEmpty && email.text.isNotEmpty){
                                  context.read<AuthBloc>().add(SignInEvent(email.text, password.text));
                                }
                                
                              },
                              child: const Text(
                                'Đăng nhập',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ))),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Bạn chưa có tài khoản? '),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, RoutePaths.signUpPage);
                            },
                            child: Text('Đăng ký', style: TextStyle(color: Constants.secondaryColor),))
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
        )),
      ),
    );
  }
}
