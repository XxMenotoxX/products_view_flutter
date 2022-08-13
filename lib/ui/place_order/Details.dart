//import 'dart:html';

//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//'package:view_products/widgets/app_text_button.dart';
class Deatails extends StatefulWidget {
  const Deatails({Key? key}) : super(key: key);

  @override
  _DeatailsState createState() => _DeatailsState();
}

class _DeatailsState extends State<Deatails> {
  int SelectedValue=0 ;
  //int Selectedtitle=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFffffff),
        elevation: 10,
          title: Text(
            'Details',
            style: TextStyle(
                color: Color(0xFF181D29), fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          leading: IconButton(
            color: Color(0xFF181D29),
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios),
          ),
          actions: [
          Image(image: AssetImage('images/S.jpg',),width: 30,height: 50,)

          ],
      ),

      body:Padding(

        padding: const EdgeInsets.only(left: 14),

        child: Column(

          mainAxisAlignment:MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              mainAxisSize: MainAxisSize.max,
               children:[
                   SizedBox(height: 50,),
                 Card(

                     child: SingleChildScrollView(
                       child: Row(
                         mainAxisSize: MainAxisSize.max,
                         children: [

                        Text(" Search here",style: TextStyle(color: Colors.grey,fontSize: 20),),
                        SizedBox(width: 100,height: 40,),
                         Icon(Icons.search,size: 30,color: Colors.grey,),

                       ],
                       ),
                     ),
                 elevation: 6,),

                 SizedBox(width: 50,),

                 Card(

                   child: Row(children: [
                     Icon(Icons.location_searching_sharp,size: 30,color: Colors.grey,),],)
                   ,elevation: 6,),
               ],


            ),

            Card(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Radio(activeColor: Color(0xffFF8236),value: 1, groupValue: 1,
                        onChanged: (val ){print('value is $val');}),
                      Text(' Lorem ipsum',style:TextStyle(fontSize:20,fontWeight: FontWeight.bold ),
                        textAlign: TextAlign.start,),

                    ],
                  ),


                  Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Text(' LoremipsumLoremipsumLoremipsu',
                      style:TextStyle(fontSize:15 ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                        SizedBox(height: 10,),

                      Row(
                             children: [
                               SizedBox(width: 20,),

                               TextButton(style: TextButton.styleFrom(
                                 backgroundColor: Colors.grey,
                               ),onPressed: (){}, child: Text("back",
                                 style: TextStyle(color: Color(0xff252F42,)),),
                               ),
                                  SizedBox(width: 200,),
                               TextButton(style: TextButton.styleFrom(
                                 backgroundColor: Colors.indigoAccent,
                               ),onPressed: (){}, child: Text("delete",
                                 style: TextStyle(color: Color(0xff252F42)),),
                               )


                             ],
                           ),


                ],
              ),

            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Radio(value: 1, groupValue: 0,
                          onChanged: (val ){print('value is $val');}),
                      Text(' Bangalore-560016',style:TextStyle(fontSize:14 ),textAlign: TextAlign.start,),
                      Column(

                      )
                    ],
                  ),


                  Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Text(' Akshya Nagar 1st Block 1st Cross,Ramimurit nagar, Bangalore-560016',
                      style:TextStyle(fontSize:15 ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(height: 10,),

                  Row(
                    children: [
                      SizedBox(width: 20,),

                      TextButton(style: TextButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),onPressed: (){}, child: Text("Back",
                        style: TextStyle(color: Color(0xff252F42),),),
                      ),
                      SizedBox(width: 200,),
                      TextButton(style: TextButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),onPressed: (){}, child: Text("Delete",
                        style: TextStyle(color: Color(0xff252F42),),),
                      ),
                    ],
                  ),],),

            ),

            SizedBox(height: 10,),
            Column(

              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Card(

                  child: TextButton(style: TextButton.styleFrom(
                    padding: (
                        EdgeInsets.symmetric(horizontal: 85,vertical: 10)

    ),
                     backgroundColor: Color(0xff0EA44F)
                  ),onPressed: (){},
                    child: Text(
                    'Add News Addreess',
                    style: TextStyle(fontSize: 20,color: Color(0xff36596A)),
                    textAlign: TextAlign.center,),
                  ),
                ),

                SizedBox(height: 10,),
                Column(

                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Card(

                      child: TextButton(style: TextButton.styleFrom(
                          padding: (
                              EdgeInsets.symmetric(horizontal: 85,vertical: 10)

                          ),
                          backgroundColor: Color(0xff252F42)
                      ),onPressed: (){},
                        child: Text(
                          'Place Order',
                          style: TextStyle(fontSize: 20,color: Color(0xffffffff)),
                          textAlign: TextAlign.center,),
                      ),
                    ),


                  ],
            ),
          ],
        ),
]
      ),


),
    );
  }
}
