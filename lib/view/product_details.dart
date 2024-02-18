import 'package:cached_network_image/cached_network_image.dart';
import 'package:cmp_task/model/orderdetails.dart';
import 'package:cmp_task/viewmodel/prodetails.dart';
import 'package:cmp_task/viewmodel/spacer.dart';
import 'package:flutter/material.dart';
import '../utils/common.dart';

class ProductDetails extends StatelessWidget {

final Product product;
final int count;
final int indeX;
  const ProductDetails({super.key, required this.product,required this.count,required this.indeX});

  @override
  Widget build(BuildContext context) {
    var height  =  MediaQuery.of(context).size.height;
    var width  =  MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(

        centerTitle: true,
        backgroundColor: Constant.white,
        title: Constant.textWithPro("Product", 16.0,FontWeight.w600,Constant.purple),

      ),
        body: LayoutBuilder(

        builder: (context, constraints) {
          if (constraints.maxWidth > constraints.maxHeight) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Hero(tag: product.productName.toString(),child: imaGE(height*2, width*0.5,product.productOtherUrl)),
                ProDetails(width: height,product: product,count: count,)
              ],
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height*0.1,),
                  Hero(
                    transitionOnUserGestures: true,
                      tag: 'tag$indeX ${product.productId}',
                    child: Center(
                      child: imaGE(height, width,product.productOtherUrl),
                    ),
                  ),
                  const SizerR(height: 30, width: 0),
                  ProDetails(width: width,product: product,count : count)

                ],
              ),
            );
          }

        },
      ),
    );
  }

  Widget imaGE(double height, double width,url) {
    return  CachedNetworkImage(
      imageUrl: url,
      height: height*0.2,
      width: width*0.5,
      placeholder: (context, url) => const Icon(Icons.insert_photo_rounded),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}




