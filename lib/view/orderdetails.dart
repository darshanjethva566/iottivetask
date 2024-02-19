import 'package:cached_network_image/cached_network_image.dart';
import 'package:cmp_task/provider/order_data.dart';
import 'package:cmp_task/utils/common.dart';
import 'package:cmp_task/view/product_details.dart';
import 'package:cmp_task/viewmodel/liner.dart';
import 'package:cmp_task/viewmodel/spacer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

import '../provider/common.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  late OrderDetailsProvider provider;
  @override
  void initState() {
    Future.delayed(Duration.zero,() {
      Provider.of<CommonProvider>(context,listen: false).toggleOrientation(true);

      Provider.of<OrderDetailsProvider>(context,listen: false).getorders(context);
    },);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    var height  =  MediaQuery.of(context).size.height;
    var width  =  MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:AppBar(
        actions: [
          IconButton(onPressed: () {
            Constant.logout();
          }, icon:const Icon( Icons.login)),

        ],
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Constant.transp,
        title: Constant.textWithPro("Home", 16.0,FontWeight.w600,Constant.purple),

      ) ,
      body: Scrollbar(
        interactive: true,
        thumbVisibility: true,
        trackVisibility: true,
        thickness: 5,
        child: SingleChildScrollView(
          child: Column(

            children: [
              LinerW(width: width,clr: Constant.purple,),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                   Consumer<OrderDetailsProvider>(builder: (context, val, child) {
                     return  TextField(

                       onChanged: (value) {
                         val.filterSearchResults(value);
                       },
                       decoration: InputDecoration(
                         filled: true,
                         fillColor: const Color(0xfff1f1f1),
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(8),
                           borderSide: BorderSide.none,
                         ),
                         hintText: "Search here",
                         hintStyle: const TextStyle(fontSize: 12,fontWeight: FontWeight.w400),

                         prefixIcon: const Icon(Icons.search),
                         prefixIconColor: Colors.black,
                       ),
                     );
                   },),
                    Consumer<OrderDetailsProvider>(builder: (context, value, child) {
                        return value.orders.isEmpty?Padding(
                          padding:  EdgeInsets.only(top: height*0.2),
                          child: Constant.textWithPro("No data found", 16, FontWeight.w500, Constant.black),
                        )
                            :ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),itemCount: value.orders.length,shrinkWrap: true,itemBuilder: (context, index) {
                          var indeX =  index;
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              width: width,
                              decoration: BoxDecoration(
                                color: Constant.grey,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,bottom: 10,top: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Constant.textWithPro('Order ID : ${value.orders[index].orderID} ', 14.0, FontWeight.w400, Colors.black),
                                        Constant.textWithPro('Date : ${Constant.dateConverter(value.orders[index].date)} ', 14.0, FontWeight.w400, Colors.black),
                                        Constant.textWithPro('Amount : ${value.orders[index].paidAmount} ', 14.0, FontWeight.w400, Colors.black),
                                        Constant.textWithPro('Status : ${value.orders[index].paymentStatus} ', 14.0, FontWeight.w400, Colors.black),
                                        Constant.textWithPro('No.of Product : ${value.orders[index].product!.length} ', 14.0, FontWeight.w400, Colors.black),
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding:  const EdgeInsets.all(5.0),
                                    child: LinerW(width: width,clr:Constant.purple),
                                  ),
                                  RawScrollbar(
                                    thumbColor: Constant.black,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 15),
                                      child: SizedBox(
                                        height: 60,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,shrinkWrap: true,itemCount: value.orders[index].product!.length,itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              Get.to(()=>ProductDetails(product:value.orders[indeX].product![index] ,count :value.orders[indeX].product!.length.toInt() ,indeX: indeX,),fullscreenDialog: true,);
                                            },
                                            child: Hero(
                                              transitionOnUserGestures: true,

                                              tag:  'tag$indeX ${value.orders[indeX].product![index].productId}',
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 10),
                                                child:CachedNetworkImage(
                                                  width: 100,
                                                  imageUrl: value.orders[indeX].product![index].productOtherUrl.toString(),
                                                  placeholder: (context, url) => const Icon(Icons.insert_photo_rounded),
                                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                                ),
                                              ),
                                            ),
                                          );
                                        },),
                                      ),
                                    ),
                                  ),
                                  const SizerR(height: 10,width: 0,),

                                ],
                              ),
                            ),
                          );
                        },);
                    },)
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }


}




