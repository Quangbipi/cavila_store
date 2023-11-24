import 'package:cached_network_image/cached_network_image.dart';
import 'package:cavila_store/models/product.dart';
import 'package:flutter/material.dart';

import '../routes/route_paths.dart';
import '../utils.dart';
// import '../utils.dart';

class ProductItemCard extends StatelessWidget {
  final Product product;
  ProductItemCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // double screenHeight = Utils.screenHeight(context);
    double screenWidth = Utils.screenWidth(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(RoutePaths.productDetailPage, arguments: product);
      },
      child: SizedBox(
        width: screenWidth*0.45,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: product.images.length >0 ? product.images.first : "https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/themes/2149061419/settings_images/L3H2ZQtxQ6qfdaIMWf7q_file.jpg",
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider, 
                                fit: BoxFit.cover,
                                
                                ),
                      ),
                      );
                    },
                    
                    placeholder: (context, url) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Center(
                        child: Icon(Icons.error),
                      );
                    },
                  ),
                ),
              ]),
            ),
            SizedBox(height: 10,),
            Expanded(
              flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),), 
                Text('${Utils.numberFormat(product.price)} đ', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),)],
            )),
            
          ],
        ),
      ),
    );
  }
}
