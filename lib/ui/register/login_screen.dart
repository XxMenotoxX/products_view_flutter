import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:view_products/firebase/firebase_auth/fb_auth_controller.dart';
import 'package:view_products/firebase/firestore/fb_store_controller.dart';
import 'package:view_products/responsive/size_config.dart';
import 'package:view_products/utils/helpers.dart';
import 'package:view_products/widgets/app_button_main.dart';
import 'package:view_products/widgets/app_text_button.dart';
import 'package:view_products/widgets/app_text_field.dart';
import 'package:view_products/widgets/app_text_montserat.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Helpers {
  late TextEditingController _username;
  late TextEditingController _email;
  late TextEditingController _password;
  late TextEditingController _confirmPassword;
  FirebaseFirestore _firebaseLogin = FirebaseFirestore.instance;


  @override
  void initState() {
    super.initState();
    _username = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _confirmPassword = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _username.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppTextButton(
                title: 'Sign Up',
                onPressed: () {
                  {
                    Navigator.pushNamed(context, '/sign_up_screen');
                  }
                }),
          ),
        ],
        backgroundColor: Colors.transparent,
        // title: Text(
        //   'Login',
        //   style: TextStyle(
        //     fontWeight: FontWeight.w500,
        //     fontSize: 16,
        //     fontFamily: 'Montserrat',
        //   ),
        // ),
        leadingWidth: 80,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.bottomCenter,
        // decoration: BoxDecoration(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [
                  Color(0XFF273246),
                  Color(0XFF181D29),
                ])),
        //   image: DecorationImage(
        //       image: AssetImage('images/imagefruit.png'), fit: BoxFit.cover),
        // ),
        child: Container(

          height: SizeConfig().scaleHeight(400),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(40),
            ),
          ),
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadiusDirectional.only(
          //     topEnd: Radius.circular(40),
          //   ),
          // ),
          child: ListView(
           // physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig().scaleWidth(20),
              vertical: SizeConfig().scaleHeight(20),
            ),
            children: [
              AppTexMontseratBlack(titleOfButton: 'Get login',),
              SizedBox(
                height: SizeConfig().scaleHeight(16),
              ),
              AppTextField(
                hint: 'Enter Email',
                controller: _email,
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: SizeConfig().scaleHeight(10),
              ),
              AppTextField(
                hint: ' Enter Password',
                controller: _password,
                obscure: true,
              ),
              SizedBox(
                height: SizeConfig().scaleHeight(32),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/forget_password_screen');
                },
                child: Text(
                  'Forget Password ?',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0XFFFAA100),
                    fontSize: SizeConfig().scaleTextFont(16),
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig().scaleHeight(18),
              ),
              AppButtonMain(
                title: 'Login',
                onPressed: () async {
                  await performSignIn();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> performSignIn() async {
    if (checkData()) {
      await signIn();
    }
  }

  bool checkData() {
    if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context: context, content: 'Enter required data!',error: true);
    return false;
  }

  Future<void> signIn() async {
    bool status = await FbAuthController()
        .signIn(context, email: _email.text, password: _password.text);
    if (status) {

      Navigator.pushReplacementNamed(context, '/categories_screen');

    }
  }
}

