import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//import 'package:view_products/responsive/size_config.dart';
import 'package:view_products/ui/WelcomeScreeen/Splach_Screen.dart';
import 'package:view_products/ui/WelcomeScreeen/lanch_screen0.dart';

//import 'package:view_products/Screens/WelcomeScreeen/lanch_screen_1.dart';
import 'package:view_products/ui/WelcomeScreeen/lanch_screen_1.dart';
import 'package:view_products/ui/WelcomeScreeen/lanch_screen_2.dart';
import 'package:view_products/ui/WelcomeScreeen/welcom_sceen_main.dart';
import 'package:view_products/ui/cart/my_cart_screen.dart';
import 'package:view_products/ui/payment/Confrmation.dart';
import 'package:view_products/ui/register/forget_password_screen.dart';
import 'package:view_products/ui/register/login_screen.dart';

import 'package:view_products/ui/register/sign_up_screen.dart';
import 'package:view_products/ui/settings/ProfileSetting.dart';
import 'package:view_products/ui/settings/change_email.dart';
import 'package:view_products/ui/settings/change_password.dart';
import 'package:view_products/ui/settings/change_profile.dart';
//import 'model/cart_model.dart';
import 'ui/departments/categories.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0XFF273246),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/splash_screen',
      debugShowCheckedModeBanner: false,
      routes: {
        '/login_screen': (context) => LoginScreen(),
        '/sign_up_screen': (context) => SignUpScreen(),
        '/forget_password_screen': (context) => ForgetPassword(),
        '/launch_screen': (context) => LaunchScreen(),
        '/categories_screen': (context) => Categories(),
        '/splash_screen': (context) => Splachscreen(),
        '/launch_screen': (context) => LaunchScreen(),
        '/lanch_screen_1': (context) => Welcome(),
        '/Lanch_screen_2': (context) => Lanch_screen_2(),
        '/profile_settings': (context) => ProfileSetting(),
        '/welcome_screen': (context) => OutBoardingScreen(),
        '/my_cart_screen': (context) => MyCart(),
        '/change_password': (context) => ChangePassword(),
        '/change_Email': (context) => ChangeEmail(),
        '/change_profile': (context) => ChangeProfile(),
        '/confirm_screen': (context) => Confrimation(),
      },
    );
  }
}

class AddPayment {
}
