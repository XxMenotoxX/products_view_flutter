import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:view_products/firebase/firestore/fb_store_controller.dart';
import 'package:view_products/model/product_model.dart';
import 'package:view_products/responsive/size_config.dart';
import 'package:view_products/ui/departments/products.dart';
import 'package:view_products/widgets/app_search_field.dart';

class SubCategoriesScreen extends StatefulWidget {
  late String mainIdCategories;
  late String nameMainCategories;

  SubCategoriesScreen({required this.mainIdCategories, required this.nameMainCategories});

  @override
  _SubCategoriesScreenState createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
 late  Iterable<QueryDocumentSnapshot> data ;
 late TextEditingController _controller;
 late String? _value ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _value = null;
    _controller = TextEditingController();
  }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       // extendBodyBehindAppBar: true,
      backgroundColor:  Color(0XFF273246),
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        leadingWidth: 60,
        titleSpacing: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(
        //       Icons.search,
        //       color: Colors.white,
        //     ),
        //   ),
        // ],
        title: Text(
         widget.nameMainCategories,
          style: TextStyle(
               fontSize: SizeConfig().scaleTextFont(28),
            // fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontFamily: 'Montserrat'),
        ),
      ),

      body: Container(
        margin: EdgeInsetsDirectional.only(top: 25),
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(
          top: SizeConfig().scaleHeight(30),
          right: SizeConfig().scaleWidth(15),
          left: SizeConfig().scaleWidth(15),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadiusDirectional.only(topEnd: Radius.circular(40)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig().scaleWidth(10),
                ),
                child: AppTextField(
                  controller: _controller,
                  onChange: (value) {
                    setState(() {
                      _value = value;
                    });
                  },
                  onPressed: (){
                    setState(() {
                      _controller.text= ' ';
                      _value = null;

                    });

                  },
                ),
              ),
              SizedBox(height: SizeConfig().scaleHeight(10),),
              StreamBuilder<QuerySnapshot>(
                  stream:
                  FbStoreController().read(collectionName: 'Subcategories'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData &&
                        snapshot.data!.docs.isNotEmpty) {
                      // List<QueryDocumentSnapshot> data = snapshot.data!.docs;

                      data = _value != null
                          ? snapshot.data!.docs.where((element) =>
                      (element.get('idMainCategories') ==
                          widget.mainIdCategories) &&
                          (element.get('name')==
                              _value))
                          : snapshot.data!.docs.where((element) =>
                      element.get('idMainCategories') ==
                          widget.mainIdCategories);

                      return ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          padding:
                          EdgeInsets.only(right: 15, left: 15, top: 20),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductsScreen(
                                      idSubCategories: data.elementAt(index).id,
                                      nameSubCategories: data.elementAt(index).get('name'),
                                    ),
                                  ),


                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      offset: Offset(0, 2),
                                      blurRadius: 12,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                  color: Colors.white,
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.local_drink_outlined),
                                    SizedBox(
                                        width: SizeConfig().scaleWidth(20)),
                                    Expanded(
                                      child: Text(
                                        data.elementAt(index).get('name'),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize:
                                          SizeConfig().scaleTextFont(26),
                                          color: Color(0XFF303030),
                                          fontFamily: 'Montserrat',
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                    ),
                                    // IconButton(
                                    //   onPressed: () async {
                                    //     await deleteSubCategories(
                                    //         path: data.elementAt(index).id);
                                    //   },
                                    //   icon: Icon(Icons.delete),
                                    // )
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 20,
                            );
                          },
                          itemCount: data.length);
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
                              style:
                              TextStyle(fontSize: 22, color: Colors.grey),
                            ),
                          ],
                        ),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    //    body: Container(
    //      margin: EdgeInsetsDirectional.only(top: 25),
    //        height: double.infinity,
    //        width: double.infinity,
    //        padding: EdgeInsets.only(
    //          top: SizeConfig().scaleHeight(30),
    //          right: SizeConfig().scaleWidth(15),
    //          left: SizeConfig().scaleWidth(15),
    //        ),
    //        decoration: BoxDecoration(
    //          color: Colors.white,
    //          borderRadius:
    //          BorderRadiusDirectional.only(topEnd: Radius.circular(40)),
    //        ),
    //        child: SingleChildScrollView(
    //          child: Column(
    //              children: [
    //          Padding(
    //          padding: EdgeInsets.symmetric(
    //          horizontal: SizeConfig().scaleWidth(10),
    //        ),
    //        child: AppTextField(
    //          controller: _controller,
    //          onChange: (value) {
    //            setState(() {
    //              _value = value;
    //            });
    //          },
    //          onPressed: (){
    //            setState(() {
    //              _controller.text= ' ';
    //              _value = null;
    //
    //            });
    //
    //          },
    //        ),
    //      ),
    //       StreamBuilder<QuerySnapshot>(
    //         stream: FbStoreController().read(collectionName: 'Subcategories'),
    //         builder: (context, snapshot) {
    //           if (snapshot.connectionState == ConnectionState.waiting) {
    //             return Center(
    //               child: CircularProgressIndicator(),
    //             );
    //           } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
    //             // List<QueryDocumentSnapshot> data = snapshot.data!.docs;
    //
    //             // data.where((QueryDocumentSnapshot document) {
    //             //   return document.get('idMainCategories') ==
    //             //       widget.mainIdCategories;
    //             // });
    //             data = _value != null
    //                 ? snapshot.data!.docs.where((element) =>
    //             (element.get('idMainCategories') ==
    //                 widget.mainIdCategories) &&
    //                 (element.get('name')==
    //                     _value))
    //                 : snapshot.data!.docs.where((element) =>
    //             element.get('idMainCategories') ==
    //                 widget.mainIdCategories);
    //
    //             return Container(
    //               height: double.infinity,
    //               width: double.infinity,
    //               margin: EdgeInsets.only(
    //                   top: SizeConfig().scaleHeight(10)
    //               ),
    //               decoration: BoxDecoration(
    //                 color: Colors.white,
    //                 borderRadius:
    //                 BorderRadiusDirectional.only(topEnd: Radius.circular(40)),
    //               ),
    //
    //                   child: ListView.separated(
    //                       physics: NeverScrollableScrollPhysics(),
    //                       padding:
    //                       EdgeInsets.only(right: 15, left: 15, top: 20),
    //                       shrinkWrap: true,
    //                       itemBuilder: (context, index) {
    //                         return GestureDetector(
    //                             onTap: () {
    //
    //                               Navigator.push(
    //                                 context,
    //                                 MaterialPageRoute(
    //                                   builder: (context) => ProductsScreen(
    //                                     idSubCategories: data.elementAt(index).id,
    //                                     nameSubCategories: data.elementAt(index).get('name'),
    //                                   ),
    //                                 ),
    //                               );
    //                             },
    //                           child: Container(
    //                             padding: EdgeInsets.symmetric(vertical: 10),
    //                             height: 85,
    //                             decoration: BoxDecoration(
    //                               borderRadius: BorderRadius.circular(15),
    //                               boxShadow: [
    //                                 BoxShadow(
    //                                   color: Colors.grey.withOpacity(0.5),
    //                                   offset: Offset(0, 2),
    //                                   blurRadius: 12,
    //                                   spreadRadius: 1,
    //                                 ),
    //                               ],
    //                               color: Colors.white,
    //                             ),
    //                             child: ListTile(
    //                               leading:  Icon(Icons.local_drink_outlined),
    //                               title: Text(
    //                                 data.elementAt(index).get('name'),
    //                                 style: TextStyle(
    //                                   fontWeight: FontWeight.w700,
    //                                   fontSize: SizeConfig().scaleTextFont(28),
    //                                   color: Color(0XFF303030),
    //                                   fontFamily: 'Montserrat',
    //                                 ),
    //                               ),
    //                               trailing: Icon(
    //                                 Icons.arrow_forward_ios_outlined,
    //                                 color: Colors.black,
    //                               ),
    //                             ),
    //                           ),
    //                         );
    //                       },
    //                       separatorBuilder: (context, index) {
    //                         return SizedBox(
    //                           height: 20,
    //                         );
    //                       },
    //                       itemCount: data.length),
    //             );
    //           } else {
    //             return Center(
    //               child: Column(
    //                 children: [
    //                   Icon(
    //                     Icons.warning,
    //                     size: 85,
    //                   ),
    //                   Text(
    //                     'No Data',
    //                     style: TextStyle(fontSize: 22, color: Colors.grey),
    //                   ),
    //                 ],
    //               ),
    //             );
    //           }
    //         }),
    //   ] ),
    // ),
    //    )
    );
  }
}
