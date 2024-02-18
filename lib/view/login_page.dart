
import 'package:cmp_task/provider/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../provider/login.dart';
import '../utils/common.dart';
import '../viewmodel/liner.dart';
import '../viewmodel/spacer.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _key = GlobalKey<FormState>();

 @override
  void initState() {
   Future.delayed(Duration.zero,() {
     Provider.of<CommonProvider>(context,listen: false).toggleOrientation(false);

   },);
    // TODO: implement initState
    super.initState();
  }
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var height  =  MediaQuery.of(context).size.height;
    var width  =  MediaQuery.of(context).size.width;

    final  provider = Provider.of<LoginProvider>(context,listen: false);
    return Scaffold(

      body: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: width*0.06),
          child: SingleChildScrollView(
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Constant.textWithPro("Login", 18.0, FontWeight.w600,Constant.purple ),
                  Constant.textWithPro("Enter your login details", 14.0, FontWeight.w400, Colors.black),

                  SizerR(height: height*0.15,width: 0.0,),


                  TextFormField(
                    controller: _email,
                    autovalidateMode:
                    AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.emailAddress,
                    inputFormatters: [
                      // FilteringTextInputFormatter.allow(
                      //     RegExp("[0-9a-zA-Z-@.]")),
                      FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    ],
                    validator: (val) {
                      if (val!.trim().isEmpty) {
                        return "Please enter email";
                      } else if (!RegExp(r'^([a-zA-Z0-9_.+-])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+$')
                          .hasMatch(val)) {
                        return "Please enter a valid email id";
                      }
                      return null;
                    },

                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      prefixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.mail_outline, color: Constant.purple),

                          Liner(width: width, height: height)
                        ],
                      ),

                    ),
                  ),
                  SizerR(height: height*0.02,width: 0.0,),
                   Consumer<LoginProvider>(builder: (context, value, child) {
                     return  TextFormField(
                       controller: _pass,
                       obscureText:  provider.password,
                       autovalidateMode:
                       AutovalidateMode.onUserInteraction,

                       validator: (val) {
                         if (val!.trim().isEmpty) {
                           return "Please enter Password";
                         } else if (!RegExp(
                             r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                             .hasMatch(val)) {
                           return "The password must contain at least one uppercase letter,\none lowercase letter, one number, and one special \ncharacter,Must be at least 8 characters in length ";
                         }
                         return null;
                       },

                       decoration: InputDecoration(
                         hintText: "Enter your password",

                         suffixIcon: Consumer<LoginProvider>(builder: (context, value, child) {
                           return IconButton(
                             onPressed: () {

                               value.handlePass();
                             },
                             icon: Icon(
                                 provider.password? Icons.remove_red_eye
                                     :
                                 Icons.visibility_off_outlined,
                                 color: Constant.purple,weight: 1),
                           );
                         },),
                         prefixIcon: Row(
                           mainAxisSize: MainAxisSize.min,
                           children: [
                             Icon(Icons.password_sharp, color: Constant.purple),
                             Liner(width: width, height: height)

                           ],
                         ),

                       ),
                     );
                   },),
                   SizerR(height: height*0.1,width: 0.0,),

                  SizedBox(
                    height: height*0.055,
                    width: width,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 5.0,
                            backgroundColor: Constant.purple,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(20))),
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            FocusManager.instance.primaryFocus
                                ?.unfocus();
                            provider.getLogin(_email.text, _pass.text,context);

                          }
                        },
                        child:Consumer<LoginProvider>(
                          builder: (context, value, child) {
                           return value.status?CircularProgressIndicator(color: Constant.white,): Constant.textWithPro( "LOG IN", 14,FontWeight.w700, Constant.white);
                          },
                        )),
                  ),



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



}



