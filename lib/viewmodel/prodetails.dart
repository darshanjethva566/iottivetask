import 'package:cmp_task/utils/common.dart';
import 'package:cmp_task/viewmodel/details_page.dart';
import 'package:cmp_task/viewmodel/liner.dart';
import 'package:flutter/material.dart';

import '../model/orderdetails.dart';


class ProDetails extends StatelessWidget {
  const ProDetails({
    super.key,
    required this.width,
    required this.product,
    required this.count
  });

  final double width;
  final Product product;
  final int count ;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Details(width: width,title: 'Product name',respo: product.productName.toString(),),
          LinerW(width: width, clr: Constant.white),
          Details(width: width,title: 'Product ID',respo: product.productId.toString(),),
          LinerW(width: width, clr: Constant.white),
          Details(width: width,title: 'Price',respo: product.perProductPrice.toString(),),
          LinerW(width: width, clr: Constant.white),
          Details(width: width,title: 'Count',respo: count.toString(),),
        ],
      ),
    );
  }
}