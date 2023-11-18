import 'package:cavila_store/blocs/fc_product/state.dart';
import 'package:cavila_store/constans.dart';
import 'package:cavila_store/models/product.dart';
import 'package:cavila_store/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/fc_product/bloc.dart';
import '../../blocs/fc_product/event.dart';
import '../../utils.dart';
import '../../widgets/product_item_card.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Product> maleProducts = [];
  List<Product> femalProducts = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetFemaleProductBloc>().add(GetProductGenderLEvent('L'));
    context.read<GetMaleProductBloc>().add(GetProductGenderMEvent('M'));
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = Utils.screenHeight(context);
    double screenWidth = Utils.screenWidth(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarWidget.appBar(),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
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
            SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.only(top: screenHeight*0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text(
                      'Thời Trang Nữ',
                      style: TextStyle(fontSize: 28),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BlocConsumer<GetFemaleProductBloc, ProductState>(
                      listener: (context, state) {
                        if(state is GetProductGenderLSuccess){
                          femalProducts = state.productGender.products;
                        }
                      },
                      buildWhen: (previous, current) {
                        return current is GetProductGenderLSuccess
                          || current is GetProductGenderLFail;
                      },
                      builder: (context, state) {
                        return Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          height: screenHeight * 0.35,
                          width: screenWidth,
                          child: state is GetProductGenderLSuccess
                              ? ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: femalProducts.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                      child: ProductItemCard(
                                          product: femalProducts[index]),
                                    );
                                  })
                              : Center(
                                  child: Text('Không có dữ liệu'),
                                ),
                        );
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text(
                      'Thời Trang Nam',
                      style: TextStyle(fontSize: 28),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BlocConsumer<GetMaleProductBloc, ProductState>(
                      listener: (context, state) {
                        if(state is GetProductGenderMSuccess){
                          maleProducts = state.productGender.products;
                        }
                      },
                      buildWhen: (previous, current) {
                        return current is GetProductGenderMSuccess
                         || current is GetProductGenderMFail;
                      },
                      builder: (context, state) {
                        return Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          height: screenHeight * 0.35,
                          width: screenWidth,
                          child: state is GetProductGenderMSuccess
                              ? ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: maleProducts.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                      child: ProductItemCard(
                                          product: maleProducts[index]),
                                    );
                                  })
                              : Center(
                                  child: Text('Không có dữ liệu'),
                                ),
                        );
                      })
                ],
              ),
            ),
          ),
          ],
        ));
  }
}
