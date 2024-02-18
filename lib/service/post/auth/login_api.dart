import 'package:cmp_task/model/login_data.dart';
import 'package:cmp_task/utils/apiurls.dart';
import 'package:get/get_connect/connect.dart';

class LoginService{
  Future<LoginData> loginUser(email,password) async {

   try{
     FormData formData = FormData({
       //there is only static login thats why i did'nt use device info related stuff
       'email': email,
       'password': password,
       'phoneMafacturer':'apple',
       'phoneModel':'iphone 6s plus',
       'OSVersion':'13.0',
       'languageCode':'en',
       'platform':'ios'
     });
     var response = await GetConnect().post(
       ApiUrls.baseUrl+ApiUrls.login,formData
     );

     return LoginData.fromJson(response.body);
   }
   catch(e){

     throw 'Something went wrong : $e';
   }
   }



}