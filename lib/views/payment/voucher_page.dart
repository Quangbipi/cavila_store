import 'package:cavila_store/blocs/fc_voucher/bloc.dart';
import 'package:cavila_store/blocs/fc_voucher/event.dart';
import 'package:cavila_store/blocs/fc_voucher/state.dart';
import 'package:cavila_store/models/voucher_model.dart';
import 'package:cavila_store/utils.dart';
import 'package:cavila_store/widgets/background_circle.dart';
import 'package:cavila_store/widgets/voucher_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

import '../../constans.dart';

class VoucherPage extends StatefulWidget {
  const VoucherPage({super.key});

  @override
  State<VoucherPage> createState() => _VoucherPageState();
}

class _VoucherPageState extends State<VoucherPage> {
  List<Voucher> vouchers = [];
  @override
  void initState() {
    super.initState();
    context.read<VoucherBloc>().add(GetVoucherEvent());
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = Utils.screenHeight(context);
    return ProgressHUD(
      child: Scaffold(
        backgroundColor: Constants.bgk,
        body: Stack(
          children: [
            BackgroundCircle.backgroundCircleTop(context),
            BackgroundCircle.backgroundCircleBottom(context),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Color.fromRGBO(255, 212, 222, 0),
                title: Text('Kho Voucher'),
                centerTitle: true,
                leading: InkWell(
                  onTap: () {
                    Navigator.of(context).pop(Voucher(id: "id", name: "name", code: "code", discountPrice: 0, quantity: 0,));
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
                          color: Constants.secondaryColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            BlocConsumer<VoucherBloc, VoucherState>(listener: (context, state) {
              if (state is GetVoucherSuccess) {
                Future.delayed(Duration.zero, () {
                  var progress = ProgressHUD.of(context);
                  progress!.dismiss();
                });
                vouchers = state.vouchers;
              }
              if (state is GetVoucherLoading) {
                Future.delayed(Duration.zero, () {
                  var progress = ProgressHUD.of(context);
                  progress!.show();
                });
              }
            }, buildWhen: (previous, current) {
              return current is GetVoucherSuccess;
            }, builder: (context, state) {
              if (vouchers.isEmpty) {
                return SafeArea(
                    child: Center(
                  child: Text('Không tìm thấy voucher'),
                ));
              }
              return SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.08, left: 10, right: 10),
                  child: Column(children: [
                    Divider(
                      thickness: 3,
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: vouchers.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).pop(vouchers[index]);
                                },
                                child: VoucherItem(voucher: vouchers[index],));
                            }))
                  ]),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
