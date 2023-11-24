import 'package:cavila_store/blocs/fc_auth/bloc.dart';
import 'package:cavila_store/blocs/fc_auth/event.dart';
import 'package:cavila_store/blocs/fc_auth/state.dart';
import 'package:cavila_store/widgets/app_bar.dart';
import 'package:cavila_store/widgets/background_circle.dart';
import 'package:cavila_store/widgets/widget_content_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constans.dart';

import '../../utils.dart';

class UpdateAddress extends StatefulWidget {
  const UpdateAddress({super.key});

  @override
  State<UpdateAddress> createState() => _UpdateAddressState();
}

class _UpdateAddressState extends State<UpdateAddress> {
  TextEditingController province = TextEditingController();
  TextEditingController district = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
     double screenHeight = Utils.screenHeight(context);
    double screenWidth = Utils.screenWidth(context);
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is UpdateAddressSuccess){
          Utils.showAlert(context, 'Sửa địa chỉ thành công', (){Navigator.of(context)..pop()..pop()..pop();});
        }
      },
      child: Scaffold(
          backgroundColor: Constants.bgk,
          extendBodyBehindAppBar: true,
          appBar: AppBarWidget.appBarTitle('Địa chỉ mới', context),
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
                        child: TextField(
                          controller: province,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            
                            hintText: 'Tỉnh/Tp, Quận/Huyện, Phường/Xã',
                            hintStyle: TextStyle(color: Colors.grey.shade500),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: TextField(
                          controller: district,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            
                            hintText: 'Tên đường, Tòa nhà, Số nhà',
                            hintStyle: TextStyle(color: Colors.grey.shade500),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      const Divider(
                        thickness: 1,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Utils.textButton(
                          screenHeight*0.06, 
                          screenWidth, 
                          (){
                            context.read<AuthBloc>().add(UpdateAddressEvent(district.text + ", "+province.text ));
                        }, 
                        'Hoàn thành')
                      )
                    ]),
              ),
            ],
          )),
    );
  }
}
