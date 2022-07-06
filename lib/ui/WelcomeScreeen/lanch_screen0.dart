//import 'dart:html';
//import 'dart:ui';

//import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:view_products/responsive/size_config.dart';
class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
      decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(
          'images/milkjuice.jpg'
      ),
        fit: BoxFit.cover
    ),

    ),
          ),


//     Positioned(
//     top: 450,
//     bottom: 0,
//     left: 0,
//     right: 0,
//     child: Card(
//     color: Colors.white,
//     shape: RoundedRectangleBorder(
//     borderRadius: BorderRadiusDirectional.only(
//     topEnd: Radius.circular(40),
//
//     ),
//
//     ),
//       child: SingleChildScrollView(
//         child: Column(
//
//           children: [
//             Text( 'Get start',
//     style: TextStyle(color: Colors.black87,
//     fontSize: SizeConfig().scaleTextFont(28),
//
//     fontFamily:'Montserrat',
//     fontWeight: FontWeight.bold,
//     ),
//               textAlign: TextAlign.center,
//     ),
//
//             SizedBox(height: 1,),
//             Text( 'If you want the best orange juice cocktails possible, squeeze the juice yourself.',
//               style: TextStyle(color: Colors.black87.withOpacity(0.4),
//                 fontSize: 14,
//
//                 fontFamily:'Montserrat',
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 1,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   width: 8,
//                   height: 8,
//                   margin: EdgeInsets.symmetric(horizontal:3 ,vertical:1 ),
//                   decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.black87,
//                   ),
//                 ),
//
//                 Container(
//                   width: 8,
//                   height: 8,
//                   margin: EdgeInsets.symmetric(horizontal:3 ,vertical:10 ),
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 Container(
//                   width: 8,
//                   height: 8,
//                   margin: EdgeInsets.symmetric(horizontal:3 ,vertical:10 ),
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.grey,
//
//                   ),
//                 ),
//                 Container(
//                   width: 8,
//                   height: 8,
//                   margin: EdgeInsets.symmetric(horizontal:3 ,vertical:10 ),
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ],
//
//             ),
//            SizedBox(width: 10),
//               Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
//                       child: TextButton(
//
//                       onPressed: (){},
//                       child: Text(' Login',
//                           style: TextStyle(color: Color(0xffffffff),
//                               fontFamily: 'Montserrat ',fontWeight: FontWeight.w400,fontSize: 15)
//                           ,textAlign: TextAlign.center),
//                       style: ButtonStyle(
//                         padding: MaterialStateProperty.all
//                           (EdgeInsets.symmetric(horizontal: 50,vertical: 5 )),
//                         backgroundColor: MaterialStateProperty.all( Color(0xFF181D29)),
//                       ),
//                       ),
//                     ),
//                     SizedBox(width: 10,),
//
//                    OutlinedButton(
//
//                       onPressed: (){},
//                       child: Text('Sing up',
//                           style: TextStyle(color: Color(0xFF181D29),
//                               fontFamily: 'Montserrat ',fontWeight: FontWeight.bold)
//                           ,textAlign: TextAlign.center,),
//                      style: OutlinedButton.styleFrom(
//                        side: BorderSide(color: Color(0xFF181D29),
//                          width: 1
//                        ),
//                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 50)
//                      ),
//
//                     )
//
//
//
//         ],
//             )
//
//
//
//           ],
//         ),
//       ),
//
//     ),
//
// ),
    ],
    ),
    );




    /*
 Container(
              child: DecoratedBox(
                decoration:  BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 2.0, color: Color(0xFFFFFFFF)),
                      left: BorderSide(width: 3.0, color: Color(0xFFFFFFFF)),
                      right: BorderSide(width: 3.0, color: Color(0xFFFFFFFF)),
                      bottom: BorderSide(width: 3.0, color: Color(0xFFFFFFFF)),

                ),

                ),

    child: Container(

         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
     children: [

         Text(

           'Get start',
           style: TextStyle(color: Colors.black87,
           fontSize: 28,
           fontFamily:'Montserrat',
           fontWeight: FontWeight.bold,
           ),
     ),
         Text(
           'If you want the best orange juice cocktails possible, squeeze the juice yourself.',
           style: TextStyle(color: Colors.grey,
               fontSize: 14,
               fontFamily:'Montserrat',
               fontWeight: FontWeight.normal
           ),
         )
     ],
         ),
        ),*/
         /*
   mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(

                  onPressed: (){},
                  child:
                  Text('Login',
                    style:TextStyle(
                        color: Colors.white,
                      fontFamily: 'Montserrat ',
                        fontSize: 30,
                        fontWeight: FontWeight.w400
                    )
                      ,textAlign: TextAlign.center,),

                 style: ElevatedButton.styleFrom(
                     primary: Color(0xff181D29)),

              ),
              SizedBox(width: 30,),

                  ElevatedButton(

                    onPressed: (){},
                    child:
                    Text('Sing up',
                      style:TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat ',
                          fontSize: 30,
                          fontWeight: FontWeight.w400
                      )
                      ,textAlign: TextAlign.center,),

                    style: ElevatedButton.styleFrom(
                        onSurface: Color(0xff181D29)),

                  ),




*/


  }
}
