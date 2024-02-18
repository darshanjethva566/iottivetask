import 'package:cmp_task/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../service/post/auth/login_api.dart';

class LoginProvider with ChangeNotifier{
  bool status = false;
  bool password = false;

  handlePass(){
    if(password){
      password = false;
    }
    else{
      password = true;
    }
    notifyListeners();
  }

  Future<void> getLogin (email,password,BuildContext context)async{
    status = true;
    notifyListeners();
    var respo = await LoginService().loginUser(email, password);
    if(respo.success!){
      Constant.showInSnackBar("Login successfully",context);
      Constant.addStorage('uid',respo.userId.toString());
      Constant.addStorage('token',respo.authToken.toString());



      Get.offAllNamed('/orderdetails');
    }
    else{
      Constant.showInSnackBar("Login failed",context);
    }
    status = false;
    notifyListeners();

  }
}