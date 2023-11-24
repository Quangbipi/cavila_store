import 'package:cavila_store/blocs/fc_product/bloc.dart';
import 'package:cavila_store/blocs/fc_product/event.dart';
import 'package:cavila_store/blocs/fc_product/state.dart';

import 'package:cavila_store/models/product.dart';
import 'package:cavila_store/utils.dart';
import 'package:cavila_store/widgets/app_bar.dart';
import 'package:cavila_store/widgets/background_circle.dart';
import 'package:cavila_store/widgets/product_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> products = [];
  bool cn = true;
  void checkConnect()async{
    bool connectivity = await Utils.checkConnectivity();
    setState(() {
      cn = connectivity;
    });
  }
  @override
  void initState() {
    super.initState();
    checkConnect();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      context.read<ProductBloc>().add(GetProductEvent());
      setState(() {
        
      });
    } else if (state == AppLifecycleState.paused) {
      // Ứng dụng chuyển vào background
      context.read<ProductBloc>().add(GetProductEvent());
    }
  }


  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(GetProductEvent());
    double screenHeight = Utils.screenHeight(context);
    double screenWidth = Utils.screenWidth(context);
    return ProgressHUD(
      child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: Stack(
            children: [
              BackgroundCircle.backgroundCircleTop(context),
              Positioned(
                top: 0.0,
                left: 0.0,
                right: 0.0,
                child: AppBarWidget.appBar(context)),
              Padding(
                padding: EdgeInsets.fromLTRB(8, screenHeight*0.1, 8, 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cavila Store',
                        style: TextStyle(color: Colors.black, fontSize: 28),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey.shade500,
                          ),
                          hintText: 'Tìm kiếm',
                          hintStyle: TextStyle(color: Colors.grey.shade500),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Utils.textButton(
                                screenHeight * 0.05, screenWidth * 0.40, () {
                              context
                                  .read<ProductBloc>()
                                  .add(GetNewProductEvent());
                            }, 'Nổi bật'),
                          ),
                          Flexible(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Utils.textButton(
                                      screenHeight * 0.05, screenWidth * 0.2,
                                      () {
                                    context
                                        .read<ProductBloc>()
                                        .add(GetProductGenderEvent('M'));
                                  }, 'Nam'),
                                  Utils.textButton(
                                      screenHeight * 0.05, screenWidth * 0.2,
                                      () {
                                    context
                                        .read<ProductBloc>()
                                        .add(GetProductGenderEvent('L'));
                                  }, 'Nữ'),
                                ],
                              ))
                        ],
                      ),
                      BlocConsumer<ProductBloc, ProductState>(
                          listener: (context, state) {
                        if (state is GetProductSuccess) {
                          products = state.products;
                        }
                        if (state is GetNewProductSuccess) {
                          products = state.products;
                        }
                        if (state is GetProductGenderSuccess) {
                          products = state.productGender.products;
                        }
                      }, buildWhen: (previous, current) {
                        return current is GetProductSuccess ||
                            current is GetProductFail ||
                            current is GetProductGenderSuccess ||
                            current is GetProductGenderFail ||
                            current is GetNewProductSuccess ||
                            current is GetNewProductFail;
                      }, builder: (context, state) {
                        if (state is GetProductFail ||
                            products.isEmpty ||
                            state is GetNewProductFail ||
                            state is GetProductGenderFail) {
                          return Center(
                            child: Text('Không có dữ liệu'),
                          );
                        }
                        return Expanded(
                          child: GridView.builder(
                            shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 15,
                                      mainAxisSpacing: 15,
                                      childAspectRatio: 2 / 3.5),
                              itemCount: products.length,
                              itemBuilder: (context, index) {
                                return ProductItemCard(
                                    product: products[index]);
                              }),
                        );
                      })
                    ]),
              ),
              
            ],
          )
        ),
    );
  }
}
