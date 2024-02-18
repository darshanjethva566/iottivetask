
import 'package:cmp_task/view/login_page.dart';
import 'package:cmp_task/view/orderdetails.dart';
import 'package:get/get.dart';



class AppRoute {
  static List<GetPage> routes = [

    GetPage(
        name: '/login',
        page: () =>  const Login(),
    ),
    GetPage(
      name: '/orderdetails',
      page: () =>  const OrderDetails(),
    ),
  ];
}