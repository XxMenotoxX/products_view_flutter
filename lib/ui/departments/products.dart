import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:view_products/firebase/firestore/fb_store_controller.dart';
import 'package:view_products/model/product_model.dart';
import 'package:view_products/responsive/size_config.dart';
import 'package:view_products/ui/departments/products_details.dart';
import 'package:view_products/utils/helpers.dart';
import 'package:view_products/widgets/app_search_field.dart';

class ProductsScreen extends StatefulWidget {
  late String idSubCategories;
  late String nameSubCategories;

  ProductsScreen(
      {required this.idSubCategories, required this.nameSubCategories});

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> with Helpers{
  late TextEditingController _controller;
  late String? _value;
  late Iterable<QueryDocumentSnapshot> data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
    _value = null;
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
      backgroundColor: Color(0XFF273246),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 60,
        titleSpacing: 0,
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
          widget.nameSubCategories,
          style: TextStyle(
              fontSize: SizeConfig().scaleTextFont(28),
              // fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontFamily: 'Montserrat'),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: SizeConfig().scaleHeight(30),
          right: SizeConfig().scaleWidth(15),
          left: SizeConfig().scaleWidth(15),
          bottom: SizeConfig().scaleHeight(13),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
              colors: [
                Color(0XFF273246),
                Color(0XFF181D29),
              ]),
        ),
        child: ListView(
          children: [
            AppTextField(
              controller: _controller,
              onChange: (value) {
                setState(() {
                  _value = value;
                });
              },
              onPressed: () {
                setState(() {
                  _controller.text = ' ';
                  _value = null;
                });
              },
            ),
            SizedBox(
              height: SizeConfig().scaleHeight(30),
            ),
            StreamBuilder<QuerySnapshot>(
                stream: FbStoreController().read(collectionName: 'Products'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasData &&
                      snapshot.data!.docs.isNotEmpty) {
                    data = _value != null
                        ? snapshot.data!.docs.where((element) =>
                            (element.get('idSubCategories') ==
                                widget.idSubCategories) &&
                            (element.get('name') == _value))
                        : snapshot.data!.docs.where((element) =>
                            element.get('idSubCategories') ==
                            widget.idSubCategories);
                    return GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: SizeConfig().scaleWidth(20),
                          mainAxisSpacing: SizeConfig().scaleHeight(15),
                          childAspectRatio: (SizeConfig().scaleWidth(164)) /
                              (SizeConfig().scaleHeight(287)),
                        ),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailsScreen(
                                    products: getProduct(
                                      data.elementAt(index),
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                              ),
                              height: SizeConfig().scaleHeight(320),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Image.asset(
                                    //   'images/softdrink.jpg',
                                    //   fit: BoxFit.cover,
                                    //   height: SizeConfig().scaleHeight(196),
                                    //   width: double.infinity,
                                    // ),
                                    Image(
                                      height: SizeConfig().scaleHeight(196),
                                      width: double.infinity,
                                      image: NetworkImage(
                                        data.elementAt(index).get('imagePath'),
                                      ),
                                    ),
                                    SizedBox(
                                      height: SizeConfig().scaleHeight(10),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        right: SizeConfig().scaleHeight(10),
                                        left: SizeConfig().scaleHeight(10),
                                      ),
                                      child: Text(
                                        data.elementAt(index).get('name'),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        right: SizeConfig().scaleHeight(10),
                                        left: SizeConfig().scaleHeight(10),
                                        top: SizeConfig().scaleHeight(5),
                                      ),
                                      child: RichText(
                                        overflow: TextOverflow.ellipsis,
                                        text: TextSpan(
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 10,
                                          ),
                                          text: data
                                              .elementAt(index)
                                              .get('shortDescription'),
                                        ),
                                      ),
                                    ),

                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            right: SizeConfig().scaleHeight(10),
                                            left: SizeConfig().scaleHeight(10),
                                          ),
                                          child: Text(
                                            data.elementAt(index).get('price') +
                                                '\$',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            right: SizeConfig().scaleHeight(10),
                                            left: SizeConfig().scaleHeight(10),
                                          ),
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.shopping_cart,
                                              color: Colors.black,
                                            ),
                                            onPressed: () async {
                                              await AddToCart(getProduct(data.elementAt(index)));
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
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
                })
          ],
        ),
      ),
    );
  }

  Products getProduct(QueryDocumentSnapshot snapshot) {
    Products products = Products();
    products.path = snapshot.id;
    products.name = snapshot.get('name');
    products.price = snapshot.get('price');
    products.imagePath = snapshot.get('imagePath');
    products.description = snapshot.get('description');
    products.shortDescription = snapshot.get('shortDescription');
    products.subCategoriesName = widget.nameSubCategories;

    return products;
  }

  Future<void> AddToCart(Products products) async {
     bool status = await FbStoreController().addProductCart(products: products);
   if(status){
     showSnackBar(context: context, content: 'Successfully Add to Cart');
   }
   else{
     showSnackBar(context: context, content: 'Error in Add to Cart',error: true);
   }

  }
}
