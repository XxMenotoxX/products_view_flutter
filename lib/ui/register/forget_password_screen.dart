import 'package:flutter/material.dart';
import 'package:view_products/firebase/firebase_auth/fb_auth_controller.dart';
import 'package:view_products/responsive/size_config.dart';
import 'package:view_products/utils/helpers.dart';
import 'package:view_products/widgets/app_text_button.dart';
import 'package:view_products/widgets/app_text_field.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> with Helpers{
  late TextEditingController _email;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppTextButton(title: 'Login', onPressed: (){
              Navigator.pushNamed(context, '/login_screen');
            })
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
         decoration: BoxDecoration(
           color: Color(0XFF252F41),
           image: DecorationImage(
               image: AssetImage('images/background.png'), fit: BoxFit.cover),
         ),
        child: Container(
            height: SizeConfig().scaleHeight(450),
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
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            children: [
              Text(
                'Forget Password',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize:SizeConfig().scaleTextFont(35),
                    fontWeight: FontWeight.w900,
                    color: Colors.black),
              ),
              SizedBox(
                height: SizeConfig().scaleHeight(20),
              ),
              AppTextField(hint: 'Enter Email', controller: _email,textInputType: TextInputType.emailAddress,),
              SizedBox(
                height: SizeConfig().scaleHeight(10),
              ),


              SizedBox(
                height: SizeConfig().scaleHeight(18),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        begin: AlignmentDirectional.topStart,
                        end: AlignmentDirectional.bottomEnd,
                        colors: [
                          Color(0XFF273246),
                          Color(0XFF181D29),
                        ])),
                child: ElevatedButton(
                  onPressed: () async {await performForgetPassword();},
                  child: Text(
                    'Reset',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: SizeConfig().scaleTextFont(16),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      primary: Colors.transparent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> performForgetPassword() async {
    if (checkData()) {
      await forgetPassword();
    }
  }

  bool checkData() {
    if (_email.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context: context, content: 'Enter required data!',error: true);
    return false;
  }

  Future<void> forgetPassword() async {
    bool status = await FbAuthController().forgetPassword(context, email: _email.text);
    if(status){
      showSnackBar(context: context, content: 'Reset email sent successfully, check and confirm');
      Navigator.pop(context);
    }
  }
}
