import 'package:cavila_store/blocs/fc_auth/bloc.dart';
import 'package:cavila_store/blocs/fc_auth/event.dart';
import 'package:cavila_store/blocs/fc_auth/state.dart';
import 'package:cavila_store/constans.dart';
import 'package:cavila_store/routes/route_paths.dart';
import 'package:cavila_store/widgets/background_circle.dart';
import 'package:cavila_store/widgets/widget_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

import '../../utils.dart';
import '../../widgets/app_bar.dart';

class ChangePassPage extends StatefulWidget {
  ChangePassPage({super.key});

  @override
  State<ChangePassPage> createState() => _ChangePassPageState();
}

class _ChangePassPageState extends State<ChangePassPage> {
  TextEditingController oldPass = TextEditingController();

  TextEditingController newPass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final screenWidth = Utils.screenWidth(context);
    final screenHeight = Utils.screenHeight(context);
    return ProgressHUD(
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if(state is ChangePassLoading){
            Future.delayed(Duration.zero, () {
                  var progress = ProgressHUD.of(context);
                  progress!.show();
                });
          }
          if(state is ChangePassSuccess){
            Future.delayed(Duration.zero, () {
                  var progress = ProgressHUD.of(context);
                  progress!.dismiss();
                });
            Utils.showAlert(context, 'Thay đổi mật khẩu thành công', (){
              context.read<AuthBloc>().add(SignOutEvent());
              Navigator.pushNamedAndRemoveUntil(context, RoutePaths.mainPage, (route) => false);
            });
          }
        },
        child: Scaffold(
          backgroundColor: Constants.bgk,
          extendBodyBehindAppBar: true,
          appBar: AppBarWidget.appBarTitle('Đổi mật khẩu', context),
          body: Stack(
            children: [
              BackgroundCircle.backgroundCircleTop(context),
              BackgroundCircle.backgroundCircleBottom(context),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Divider(thickness: 3,),
                      SizedBox(height: 10,),
                      TextField(
                        controller: oldPass,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey.shade500,
                          ),
                          hintText: 'Mật khẩu cũ',
                          hintStyle: TextStyle(color: Colors.grey.shade500),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextField(
                        controller: newPass,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey.shade500,
                          ),
                          hintText: 'Mật khẩu mới',
                          hintStyle: TextStyle(color: Colors.grey.shade500),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextField(
                        controller: confirmPass,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey.shade500,
                          ),
                          hintText: 'Nhập lại mật khẩu mới',
                          hintStyle: TextStyle(color: Colors.grey.shade500),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      SizedBox(height: 30,),
                      WidgetButton.buildButton(
                        screenHeight*0.06, 
                        screenWidth, 
                        (){
                          if(Utils.validateConfirmPass(newPass.text, confirmPass.text) == 1){
                            context.read<AuthBloc>().add(ChangePassEvent(oldPass.text, newPass.text));
                          }else{
                            Utils.showAlert(context, 'Mật khẩu nhập lại không khớp', (){Navigator.pop(context);});
                          }
                        }, 
                        'Đổi mật khẩu')
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
