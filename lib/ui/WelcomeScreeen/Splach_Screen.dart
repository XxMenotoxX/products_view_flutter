import 'dart:ui';

import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:view_products/firebase/firebase_auth/fb_auth_controller.dart';
import 'package:view_products/responsive/size_config.dart';
class Splachscreen extends StatefulWidget {


  @override
  _SplachscreenState createState() => _SplachscreenState();
}

class _SplachscreenState extends State<Splachscreen> {
  void initState() {

    super.initState();
    // don't delete this line ///

    String route = FbAuthController().isLoggedIn?'/categories_screen':'/login_screen';
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, route);

    });
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().designWidth(3.75).designHeight(8.13).init(context);

    return Scaffold(

backgroundColor: Color(0XFF242E40),
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                begin: AlignmentDirectional.topEnd,
                end: AlignmentDirectional.bottomStart,
                colors: [
                  Color(0XFF273246),
                  Color(0XFF181D29),
                  Color(0XFF242E41),

                ])),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(height:SizeConfig().scaleHeight(250) ,width:SizeConfig().scaleWidth(300),
              child:Lottie.asset('assets/59196-drink.json'),),

          ],
        ),
      ),
    );
  }
}
