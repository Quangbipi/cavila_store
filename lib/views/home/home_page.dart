import 'package:cavila_store/blocs/fc_product/bloc.dart';
import 'package:cavila_store/blocs/fc_product/event.dart';
import 'package:cavila_store/blocs/fc_product/state.dart';

import 'package:cavila_store/models/product.dart';
import 'package:cavila_store/utils.dart';
import 'package:cavila_store/widgets/app_bar.dart';
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(GetProductEvent());
    double screenHeight = Utils.screenHeight(context);
    double screenWidth = Utils.screenWidth(context);
    return ProgressHUD(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBarWidget.appBar(),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  child: Utils.textButton(screenHeight * 0.05,
                      screenWidth * 0.40, () {}, 'Nổi bật'),
                ),
                Flexible(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Utils.textButton(screenHeight * 0.05, screenWidth * 0.2,
                            () {}, 'Nam'),
                        Utils.textButton(screenHeight * 0.05, screenWidth * 0.2,
                            () {}, 'Nữ'),
                      ],
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            BlocConsumer<ProductBloc, ProductState>(listener: (context, state) {
              if (state is GetProductSuccess) {
                products = state.products;
              }
            }, buildWhen: (previous, current) {
              return current is GetProductSuccess || current is GetProductFail;
            }, builder: (context, state) {
              if (state is GetProductSuccess) {
                return Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
              }
              if(state is GetProductFail){
                return Center(child: Text('Không có dữ liệu'),);
              }
              return Container();
            })
          ]),
        ),
      ),
    );
  }
}
