import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:view_products/firebase/firebase_auth/fb_auth_controller.dart';
import 'package:view_products/firebase/firestore/fb_store_controller.dart';
import 'package:view_products/responsive/size_config.dart';
import 'package:view_products/ui/departments/subcategories.dart';
import 'package:view_products/utils/helpers.dart';
import 'package:view_products/widgets/list_tile_drawer.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> with Helpers {
  late User _user;

  FirebaseFirestore _firebase = FirebaseFirestore.instance;
  var currentUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _user = FbAuthController().user;
    print('Uid is ' + currentUser!.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF273246),
      // bottomNavigationBar:
      // Container(
      //   clipBehavior: Clip.antiAlias,
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadiusDirectional.only(topEnd: Radius.circular(40),),
      //   ),
      //   child: BottomNavigationBar(
      //     backgroundColor: Color(0XFFFDBC02),
      //     fixedColor: Colors.white,
      //     showSelectedLabels: false,
      //     showUnselectedLabels: false,
      //     unselectedItemColor: Colors.white,
      //     type: BottomNavigationBarType.fixed,
      //     items: [
      //     BottomNavigationBarItem(icon:Icon(Icons.home),label: 'Home'),
      //     BottomNavigationBarItem(icon:Icon(Icons.shopping_cart_sharp),label: 'Cart'),
      //     BottomNavigationBarItem(icon:Icon(Icons.favorite),label: 'Favorite'),
      //     BottomNavigationBarItem(icon:Icon(Icons.person),label: 'Profile'),
      //   ],),
      // ),
      // backgroundColor: Colors.blue,

      // backgroundColor: Colors.transparent,
      drawer: Drawer(
        child: Container(
          color: Color(0XFF181D29),
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 50,
              ),

              FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                future:
                    (_firebase.collection('Users').doc(currentUser!.uid)).get(),
                builder: (_, snapshot) {
                  if (snapshot.hasError) {
                    print('error no  data ');
                    return Text('Error = ${snapshot.error}');
                  }
                  else if (snapshot.hasData&& snapshot.data!.data()!= null) {
                    var data = snapshot.data!.data();
                     // var value = data['name']; // <-- Your value
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(data!['ImageUrl']),
                      ),
                      title: Text(
                        data['name'],
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: Text(
                        _user.email ?? 'No Email',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    );
                  }
                  else {
                    print('no data ');

                    return ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('images/person.png'),
                      ),
                      title: Text(
                        _user.displayName ?? 'No Name',
                        style: TextStyle(
                          fontSize: SizeConfig().scaleTextFont(16),
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: Text(
                        _user.email ?? 'No Email',
                        style: TextStyle(
                          fontSize: SizeConfig().scaleTextFont(12),
                          color: Colors.grey,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    );
                  }
                },
              ),

              // StreamBuilder<QuerySnapshot>(
              //     stream: FbStoreController().readUserData(collectionName: 'Users'),
              //     builder: (context, snapshot) {
              //       if (snapshot.connectionState == ConnectionState.waiting) {
              //         return Center(
              //           child: CircularProgressIndicator(),
              //         );
              //       } else if (snapshot.hasData &&
              //           snapshot.data!.docs.isNotEmpty) {
              //         // List<QueryDocumentSnapshot> data = snapshot.data!.docs;
              //         Iterable<QueryDocumentSnapshot> data = snapshot.data!.docs
              //             .where((element) =>
              //         element.id == FbAuthController().user.uid);
              //         return ListTile(
              //           leading: CircleAvatar(
              //             radius: 30,
              //             backgroundImage: NetworkImage(data.elementAt(0).get('ImageUrl')),
              //           ),
              //           title: Text(
              //             data.elementAt(0).get('name'),
              //             style: TextStyle(
              //               fontSize: 16,
              //               color: Colors.white,
              //               fontFamily: 'Montserrat',
              //               fontWeight: FontWeight.w700,
              //             ),
              //           ),
              //           subtitle: Text(
              //             _user.email??'No Email',
              //             style: TextStyle(
              //               fontSize: 12,
              //               color: Colors.grey,
              //               fontFamily: 'Montserrat',
              //               fontWeight: FontWeight.w700,
              //             ),
              //           ),
              //         );
              //       } else {
              //         return
              //           ListTile(
              //           leading: CircleAvatar(
              //             radius: 30,
              //             backgroundImage: AssetImage('images/person.png'),
              //           ),
              //           title: Text(
              //             _user.displayName??'No Name',
              //             style: TextStyle(
              //               fontSize: SizeConfig().scaleTextFont(16),
              //               color: Colors.white,
              //               fontFamily: 'Montserrat',
              //               fontWeight: FontWeight.w700,
              //             ),
              //           ),
              //           subtitle: Text(
              //             _user.email??'No Email',
              //             style: TextStyle(
              //               fontSize: SizeConfig().scaleTextFont(12),
              //               color: Colors.grey,
              //               fontFamily: 'Montserrat',
              //               fontWeight: FontWeight.w700,
              //             ),
              //           ),
              //         );
              //       }
              //     }),
              SizedBox(
                height: SizeConfig().scaleHeight(69),
              ),
              DrawerListTile(
                title: 'Home',
                iconData: Icons.home_rounded,
                onTab: () {},
              ),
              SizedBox(
                height: SizeConfig().scaleHeight(30),
              ),

              DrawerListTile(
                title: 'Basket',
                iconData: Icons.shopping_cart,
                onTab: () {
                  Navigator.pushNamed(context, '/my_cart_screen');
                },
              ),
              SizedBox(
                height: SizeConfig().scaleHeight(30),
              ),

              DrawerListTile(
                title: 'Settings',
                iconData: Icons.settings,
                onTab: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/profile_settings');
                },
              ),
              SizedBox(
                height: SizeConfig().scaleHeight(30),
              ),
              DrawerListTile(
                  iconData: Icons.logout,
                  title: 'Exit',
                  onTab: () async {
                    await signOut();
                    showSnackBar(
                        context: context, content: 'Logout successfully');
                  }),
              SizedBox(
                height: SizeConfig().scaleHeight(30),
              ),
            ],
          ),
        ),
      ),
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back_ios,
        //     color: Colors.white,
        //   ),
        //   onPressed: () {},
        // ),
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.pushNamed(context, '/my_cart_screen');
            },
            icon: Icon(
              Icons.shopping_cart_sharp,
              color: Colors.white,
            ),
          ),
        ],
        title: Text(
          'Categories',
          style: TextStyle(
              fontSize: SizeConfig().scaleTextFont(28),
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontFamily: 'Montserrat'),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FbStoreController().read(collectionName: 'MainCategories'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
              List<QueryDocumentSnapshot> data = snapshot.data!.docs;
              return Container(
                height: double.infinity,
                // decoration: BoxDecoration(
                //   gradient: LinearGradient(
                //     begin: AlignmentDirectional.topStart,
                //       end: AlignmentDirectional.bottomEnd,
                //       colors: [
                //     Color(0XFF273246),
                //     Color(0XFF181D29),
                //   ]),
                // ),
                child: ListView.separated(
                    padding: EdgeInsets.only(top: 145, right: 13, left: 13),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SubCategoriesScreen(
                                mainIdCategories: data[index].id,
                                nameMainCategories: data[index].get('name'),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          alignment: AlignmentDirectional.bottomStart,
                          height: SizeConfig().scaleHeight(200),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              colorFilter: new ColorFilter.mode(
                                  Colors.black.withOpacity(0.6),
                                  BlendMode.dstATop),
                              image: NetworkImage(
                                data[index].get('imagePath'),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 15),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data[index].get('name'),
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  data[index].get('description'),
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: data.length),
              );
            } else {
              return Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.warning,
                      size: 85,
                    ),
                    Text(
                      'No Data',
                      style: TextStyle(fontSize: 22, color: Colors.grey),
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }

  Future<void> signOut() async {
    await FbAuthController().signOut();
    Navigator.pushReplacementNamed(context, '/login_screen');
  }
}
