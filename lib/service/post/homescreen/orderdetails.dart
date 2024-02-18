
import 'package:cmp_task/utils/apiurls.dart';
import 'package:cmp_task/utils/common.dart';
import 'package:get/get_connect/connect.dart';

import '../../../model/orderdetails.dart';

class OrderDetailsService{
  Future<OrderDetails> orderService() async {

    try{
      FormData formData = FormData({
        
        'authToken':'f94d2624-d252-4cf0-8c59-ad8c3cbad3ab,
        'userId':1394
      });
      //for dynamic
       // 'authToken':Constant.getStorage("token"),
       // 'userId':Constant.getStorage("uid"),

      var response = await GetConnect().post(
          ApiUrls.baseUrl+ApiUrls.orders,formData
      );

      return OrderDetails.fromJson(response.body);
    }
    catch(e){
      throw '$e';
    }
  }



}
