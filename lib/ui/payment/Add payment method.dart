import 'package:flutter/material.dart';
class AddPayment extends StatefulWidget {
  const AddPayment({Key? key}) : super(key: key);

  @override
  _AddPaymentState createState() => _AddPaymentState();
}

class _AddPaymentState extends State<AddPayment> {
  final NameController = TextEditingController();
  final NumberController=TextEditingController();
  final NumberExpridateController=TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xffc0d5df),
      appBar: AppBar(
        backgroundColor: Color(0xffc0d5df),
        elevation: 0,
        title: Text(
          'Address',
          style: TextStyle(
              color: Color(0xFFffffff), fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        leading: IconButton(

          color: Color(0xFFffffff),
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          Image(image: AssetImage('images/S.jpg',),width: 50,height: 50,)

        ],

      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Card(
                  child: Row(
                    children: [
                      Image(image: AssetImage('images/mastercard.png',),width: 50,height: 50,),
                      SizedBox(width: 10,),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Credit card',style: TextStyle(fontSize: 14),),
                          SizedBox(height: 10,),
                          Text('1234 **** **** 5642',style: TextStyle(fontSize: 14),),

                        ],


                      ),
                      SizedBox(width: 100,),
                      Radio( activeColor: Color(0xffFF8236),value: 1, groupValue: 1, onChanged: (value){})
                    ],
                  ),
                ),
                Card(
                     color: Color(0xffc0d5df),
                  child: Row(

                    children: [

                      Image(image: AssetImage('images/PayPal.png',),width: 50,height: 50,),
                      SizedBox(width: 10,),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(' PayPal',style: TextStyle(fontSize: 14),),
                          SizedBox(height: 10,),
                          Text('  Themadbrains',style: TextStyle(fontSize: 14),),

                        ],


                      ),
                      SizedBox(width: 125,),
                      Radio( activeColor: Color(0xffFF8236),value: 1, groupValue: 0, onChanged: (value){}),

                    ],
                  ),
                ),
                SizedBox(height: 10,),

              ],
            ),
          ),
           Container(

                   child:  Positioned(
                        top: 140,
                           bottom: 0,
                               left: 0,
                                  right: 0,
                              child: Card(
                                 color: Colors.white,
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusDirectional.only(
                                topEnd: Radius.circular(40),
                                topStart: Radius.circular(40),

                                ),
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Add Payment Method',
                                          style: TextStyle(fontSize: 20,fontWeight:FontWeight.normal),),
                                        SizedBox(height: 10,),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Card name*',style: TextStyle(
                                               fontSize: 15,
                                              fontWeight: FontWeight.normal,),),
                                            SizedBox(height: 5,),
                                            Container(
                                              width:350 ,
                                              height: 40,

                                              child: TextField(

                                                controller:NameController ,
                                                decoration: InputDecoration(
                                                  contentPadding: EdgeInsets.symmetric(vertical: 1.0),

                                                  border: OutlineInputBorder(

                                                  ),

                                                ),

                                                  keyboardType: TextInputType.text,
                                              ),
                                            ),
                                               SizedBox(height: 5,),
                                            Text('Card Number*',style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal,),),
                                            SizedBox(height: 10,),

                                            Container(
                                              width:350 ,
                                              height: 40,
                                              child: TextField(

                                                controller: NumberController,
                                                decoration: InputDecoration(
                                                  contentPadding: EdgeInsets.symmetric(vertical: 1.0),

                                                  border: OutlineInputBorder(


                                                  ),
                                                  suffix: Image(image: AssetImage('images/mastercard.png'),),

                                                ),

                                                keyboardType: TextInputType.visiblePassword,
                                              ),
                                            ),
                                            
                                            SizedBox(height: 5,),
                                            Text('Expiedate*',style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal,),),
                                                  Container(
                                                    width:350 ,
                                                    height: 40,
                                                    child: TextField(

                                                controller: NumberExpridateController,
                                                     decoration: InputDecoration(
                                                       contentPadding: EdgeInsets.symmetric(vertical: 1.0),

                                                          border: OutlineInputBorder(


                                                    ),
                                           ),

                                               keyboardType: TextInputType.datetime,
                                               ),
                                                  ),

                                            SizedBox(height: 5,),
                                            Text('CW*',style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal,),),
                                            Container(
                                              width:350 ,
                                              height: 40,
                                              child: TextField(

                                                controller: NumberExpridateController,
                                                decoration: InputDecoration(
                                                  contentPadding: EdgeInsets.symmetric(vertical: 1.0),

                                                  border: OutlineInputBorder(


                                                  ),

                                                  suffixIcon: Icon(Icons.help),
                                                ),

                                                keyboardType: TextInputType.number,
                                              ),
                                            ),
                                            SizedBox(height: 20,),
                                            Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,

                                              children: [
                                                TextButton(onPressed: (){},
                                                  child: Text('ConfirmPayment',style: TextStyle(fontSize: 18),
                                                  textAlign: TextAlign.center,)

                                                  ,style: TextButton.styleFrom(
                                                   // \\padding: EdgeInsets.symmetric(horizontal: 150),

                                                    backgroundColor: Color(0xff253043),
                                                  ),

                                                ),
                                              ],
                                            )
                                      ],
                                    ),

                                         ]
                                ),
                                  ),
                                ),
                                ),


           ),
           ),
        ],
      ),
    );
  }
}
