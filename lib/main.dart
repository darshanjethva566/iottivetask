import 'package:cmp_task/provider/common.dart';
import 'package:cmp_task/provider/login.dart';
import 'package:cmp_task/provider/order_data.dart';
import 'package:cmp_task/utils/common.dart';
import 'package:cmp_task/utils/routes.dart';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

void main() async{
  await GetStorage.init();
  final login  = Constant.getStorage('uid');

  runApp( MyApp(login:login));
}

class MyApp extends StatelessWidget {
  final login;
  const MyApp({super.key, required this.login}) ;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CommonProvider(),),
        ChangeNotifierProvider(create: (context) => LoginProvider(),),
        ChangeNotifierProvider(create: (context) => OrderDetailsProvider(),)

      ],

      child: GetMaterialApp(
        initialRoute :login==null?'/login':'/orderdetails',
        getPages: AppRoute.routes,
        debugShowCheckedModeBanner: false,

      ),
    );
  }
}


