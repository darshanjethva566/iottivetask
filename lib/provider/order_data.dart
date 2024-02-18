import 'package:cmp_task/model/orderdetails.dart';
import 'package:cmp_task/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../service/post/homescreen/orderdetails.dart';


class OrderDetailsProvider with ChangeNotifier{


  List <Data> orders = <Data>[];
  List <Data> duborders = <Data>[];

  void filterSearchResults(String query) {
    if(query.isNotEmpty) {
      orders =
       duborders
          .where((order) => order.product!.any((product) =>
          product.productName!.toUpperCase().contains(query.toUpperCase())))
          .toList();
      
    }
    else{
      orders = duborders;
    }
    notifyListeners();
  }
  Future<void> getorders (BuildContext context)async{

    var respo = await OrderDetailsService().orderService();
    if(respo.success!){
      orders = respo.data!;
      duborders = respo.data!;
    }
    else{
      Constant.showInSnackBar("Something went wrong",context);
    }

    notifyListeners();

  }
}