
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class Constant {
 static GetStorage storage = GetStorage();

  static  Color black = Colors.black;
  static Color purple = Colors.purple ;
  static Color white = Colors.white ;
 static Color transp = Colors.transparent;
  static Color grey = Colors.grey;


  static void showInSnackBar(String value,BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }

  static OutlineInputBorder borDer( Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide:
      BorderSide(width: 1, color: color),
    );
  }
  static void addStorage(key , value){
    storage.write(key, value);
  }
  static  getStorage(key){
    return   storage.read(key);
  }
 static  logout(){
   Future.delayed(Duration.zero,() {

     storage.remove('uid');
     storage.remove('token');
     Get.offNamed('/login');

   },);
 }
  static  dateConverter (int val){
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(val);
    return DateFormat('dd-MMMM-yyyy').format(dateTime);
  }

  static  Widget textWithPro(String text,double font,FontWeight weight,Color color,) {
    return Text(text,
        style: TextStyle(
            fontSize: font,fontWeight: weight,
            color: color,
            fontFamily: "Poppins"));
  }
}
