import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:view_products/firebase/firebase_auth/fb_auth_controller.dart';
import 'package:view_products/firebase/firestore/fb_store_controller.dart';
import 'package:view_products/responsive/size_config.dart';
import 'package:view_products/widgets/list_tile_settings.dart';

//import 'package:view_products/widgets/Cardsbox.dart';
//mport 'package:view_products/widgets/list_tile_drawer.dart';
//import 'package:view_products/widgets/list_tile_drawer.dart';

class ProfileSetting extends StatefulWidget {
  const ProfileSetting({Key? key}) : super(key: key);

  @override
  _ProfileSettingState createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  late User _user;
  late String? pathImage;
  FirebaseFirestore _firebase = FirebaseFirestore.instance;
  var currentUser = FirebaseAuth.instance.currentUser;

  // Future<void> retrieveImage() async {
  //   UserData? userData = await FbStoreController()
  //       .getUser(collectionName: 'Admins');
  //   if (userData!.ImageUrl != null) {
  //       pathImage = userData.ImageUrl;
  //       print('path no null');
  //   }
  //   print('path is null');
  //   return pathImage = null;
  //
  //
  //
  //
  //
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _user = FbAuthController().user;
    // pathImage = null;
    // asyncInitState();
  }

  //
  // void asyncInitState() async {
  //   await retrieveImage();
  // }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: backButton,
      child: Scaffold(
          backgroundColor: Color(0xFF181D29),
          appBar: AppBar(
              backgroundColor: Color(0xFF181D29),
              elevation: 0,
              title: Text(
                'ProfileSetting',
                style: TextStyle(
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.w700,
                    fontSize: SizeConfig().scaleTextFont(28),
                    fontFamily: 'Montserrat'),
                textAlign: TextAlign.center,
              ),
              leading: IconButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/categories_screen');
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
              actions: [
                IconButton(
                  color: Colors.white,
                  onPressed: () {},
                  icon: Icon(Icons.edit),
                )
              ]),
          body: Stack(children: [
            Container(
              margin: EdgeInsetsDirectional.only(
                  top: SizeConfig().scaleHeight(196)),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.only(
                  topEnd: Radius.circular(40),
                ),
              ),
              child: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig().scaleWidth(20),
                ),
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: SizeConfig().scaleHeight(114),
                  ),
                  Text(
                    'GENERAL',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Montserrat',
                      color: Color(0XFF303030),
                      fontSize: SizeConfig().scaleTextFont(16),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig().scaleHeight(10),
                  ),
                  ListTileSettings(
                    title: 'Profile Settings',
                    subTitle: 'Update and modify your profile',
                    leadingIconData: Icons.settings,
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/change_profile');
                    },
                  ),
                  SizedBox(
                    height: SizeConfig().scaleHeight(20),
                  ),
                  ListTileSettings(
                    title: 'Privacy',
                    subTitle: 'Change your password',
                    leadingIconData: Icons.lock,
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, '/change_password');
                    },
                  ),
                  SizedBox(
                    height: SizeConfig().scaleHeight(20),
                  ),
                  ListTileSettings(
                    title: 'Change Email',
                    subTitle: 'Change your email settin..',
                    leadingIconData: Icons.email,
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/change_Email');
                    },
                  ),
                  SizedBox(
                    height: SizeConfig().scaleHeight(20),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 236,
              margin: EdgeInsetsDirectional.only(top: 37, start: 20, end: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(0, 6),
                    spreadRadius: 2,
                    blurRadius: 12,
                  ),
                ],
              ),
              child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  future: (_firebase.collection('Users').doc(currentUser!.uid))
                      .get(),
                  builder: (_, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData &&
                        snapshot.data!.data() != null) {
                      print('yes have data ');
                      var dataDocs = snapshot.data!.data();
                      // Iterable<QueryDocumentSnapshot> data = snapshot.data!.docs
                      //     .where((element) =>
                      // element.id == FbAuthController().user.uid);
                      return Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: SizeConfig().scaleHeight(20),
                              ),
                              Image(
                                image: NetworkImage(dataDocs!['ImageUrl']),
                                width: SizeConfig().scaleWidth(98),
                                height: SizeConfig().scaleHeight(98),
                              ),
                              SizedBox(
                                height: SizeConfig().scaleHeight(22),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    dataDocs['name'],
                                    style: TextStyle(
                                      color: Color(0XFF303030),
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Montserrat',
                                      fontSize: SizeConfig().scaleTextFont(16),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Icon(
                                    Icons.verified,
                                    color: Color(0XFFFDBC02),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig().scaleHeight(9),
                              ),
                              Text(
                                _user.email ?? 'no Email',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ]),
                      );
                    } else {
                      return Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: SizeConfig().scaleHeight(20),
                              ),
                              Image(
                                image: AssetImage('images/girl.png'),
                                width: SizeConfig().scaleWidth(98),
                                height: SizeConfig().scaleHeight(98),
                              ),
                              SizedBox(
                                height: SizeConfig().scaleHeight(22),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    _user.displayName ?? 'No Name',
                                    style: TextStyle(
                                      color: Color(0XFF303030),
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Montserrat',
                                      fontSize: SizeConfig().scaleTextFont(16),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Icon(
                                    Icons.verified,
                                    color: Color(0XFFFDBC02),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig().scaleHeight(9),
                              ),
                              Text(
                                _user.email ?? 'No Email',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ]),
                      );
                    }
                  }),
            ),
          ])),
    );
  }

  Future<bool> backButton() async {
    Navigator.pushReplacementNamed(context, '/categories_screen');

    return true;
  }
}

/*
              child: StreamBuilder<QuerySnapshot>(
                  stream: FbStoreController().read(collectionName: 'Users'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData &&
                        snapshot.data!.docs.isNotEmpty) {
                      // List<QueryDocumentSnapshot> data = snapshot.data!.docs;
                      Iterable<QueryDocumentSnapshot> data = snapshot.data!.docs
                          .where((element) =>
                      element.id == FbAuthController().user.uid);
                      return Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: SizeConfig().scaleHeight(20),
                              ),
                              Image(
                                image:
                                NetworkImage(data.elementAt(0).get('ImageUrl')),
                                width: SizeConfig().scaleWidth(98),
                                height: SizeConfig().scaleHeight(98),
                              ),
                              SizedBox(
                                height: SizeConfig().scaleHeight(22),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    data.elementAt(0).get('name'),
                                    style: TextStyle(
                                      color: Color(0XFF303030),
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Montserrat',
                                      fontSize: SizeConfig().scaleTextFont(16),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Icon(
                                    Icons.verified,
                                    color: Color(0XFFFDBC02),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig().scaleHeight(9),
                              ),
                              Text(
                                _user.email ?? 'No Email',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ]),);
                    } else {
                      return Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                            SizedBox(
                            height: SizeConfig().scaleHeight(20),
                      ),
                    Image( image: AssetImage('images/girl.png'), width: SizeConfig().scaleWidth(98),
                    height: SizeConfig().scaleHeight(98),),


                    SizedBox(
                    height: SizeConfig().scaleHeight(22),
                    ),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text(
                   _user.displayName??'No Name',
                    style: TextStyle(
                    color: Color(0XFF303030),
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Montserrat',
                    fontSize: SizeConfig().scaleTextFont(16),
                    ),
                    textAlign: TextAlign.center,
                    ),
                    Icon(
                    Icons.verified,
                    color: Color(0XFFFDBC02),
                    ),
                    ],
                    ),
                    SizedBox(
                    height: SizeConfig().scaleHeight(9),
                    ),
                    Text(
                    _user.email ?? 'No Email',
                    style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade400,
                    ),
                    ),
                    ])
                    ,
                    );
                  }
                  }),

 */
/*
child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: SizeConfig().scaleHeight(20),
                  ),

                StreamBuilder<QuerySnapshot>(
                      stream: FbStoreController().read(collectionName: 'Admins'),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                          // List<QueryDocumentSnapshot> data = snapshot.data!.docs;
                          Iterable<QueryDocumentSnapshot> data = snapshot.data!.docs.where(
                                  (element) =>
                              element.id ==
                                 FbAuthController().user.uid);
                          return
                           Image(
                            image:  NetworkImage(data.elementAt(0).get('ImageUrl')),
                            width: SizeConfig().scaleWidth(98),
                            height: SizeConfig().scaleHeight(98),

                          );

                        } else {
                           return Image(
                            image: AssetImage('images/girl.png') ,
                            width: SizeConfig().scaleWidth(98),
                            height: SizeConfig().scaleHeight(98),

                          );
                        }
                      }),



                  SizedBox(
                    height: SizeConfig().scaleHeight(22),
                  ),
                  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _user.displayName ?? 'No Name',
                            style: TextStyle(
                              color: Color(0XFF303030),
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Montserrat',
                              fontSize: SizeConfig().scaleTextFont(16),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Icon(
                            Icons.verified,
                            color: Color(0XFFFDBC02),
                          ),
                        ],
                      ),

                  SizedBox(
                    height: SizeConfig().scaleHeight(9),
                  ),
                  Text(
                    _user.email ?? 'No Email',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
              /*child: Image(image: AssetImage('person.png')),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(5),
*/
            ),
 */
