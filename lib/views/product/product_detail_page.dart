import 'package:cached_network_image/cached_network_image.dart';
import 'package:cavila_store/constans.dart';
import 'package:cavila_store/utils.dart';
import 'package:cavila_store/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import '../../models/product.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  List<String> productSize = ['S', 'M', 'L', 'XL'];
  List<String> productColors = ['91A1B0', 'B11D1D', '1F44A3', '9F632A', '1D752B', '000000'];
  //'Red', 'Orange', 'Yellow', 'Green', 'Blue', 'Indigo', 'Violet'
  Color getColor(String colorName){
    switch(colorName){
      case 'Red':
        return Colors.red;
      case 'Orange':
        return Colors.orange;
      case 'Yellow':
        return Colors.yellow;
      case 'Green':
        return Colors.green;
      case 'Blue':
        return Colors.blue;
      case 'Indigo':
        return Colors.indigo;
      case 'Violet':
        return Colors.purple;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = Utils.screenHeight(context);
    double screenWidth = Utils.screenWidth(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 212, 222, 1),
      appBar: AppBarWidget.appBar(),
      body: Column(
        children: [
          CachedNetworkImage(
            imageUrl: widget.product.images.first,
            imageBuilder: (context, imageProvider) {
              return Container(
                width: screenWidth,
                height: screenHeight * 0.5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.fill)),
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text(
                          widget.product.name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                    Expanded(
                        flex: 1,
                        child: Text(
                          '${Utils.numberFormat(widget.product.price)} đ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Cỡ',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: List.generate(
                                  widget.product.sizes.length,
                                  (index) => Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 8, 0),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                            width: 32,
                                            height: 32,
                                            alignment: Alignment.center,
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle),
                                            child: Text(widget.product.sizes[index]),
                                          ),
                                        ),
                                      )),
                            )
                          ],
                        )),
                    Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Số lượng',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Container(
                              width: 80,
                              height: 40,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all()),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Expanded(flex: 2, child: Text('1')),
                                    const VerticalDivider(
                                      thickness: 1,
                                      width: 2,
                                      indent: 0,
                                      color: Colors.black,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: IconButton(
                                          padding: EdgeInsets.zero,
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          )),
                                    )
                                  ]),
                            )
                          ],
                        ))
                  ],
                ),
                const SizedBox(height: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Màu',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: List.generate(
                          widget.product.colors.length,
                          (index) => Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: 32,
                                    height: 32,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: getColor(widget.product.colors[index]),
                                        shape: BoxShape.circle),
                                    
                                  ),
                                ),
                              )),
                    )
                  ],
                ),
                const SizedBox(height: 40,),
                TextButton(
                  
                  onPressed: (){},
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(screenWidth*0.8, screenHeight*0.06)),
                    backgroundColor: MaterialStateProperty.all(Constants.pinkColor),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      )
                    )
                  ),
                  child: const Text('Thêm vào giỏ hàng', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),))
              ],
            ),
          )
        ],
      ),
    );
  }
}
