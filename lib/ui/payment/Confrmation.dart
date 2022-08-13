import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Confrimation extends StatefulWidget {
  const Confrimation({Key? key}) : super(key: key);

  @override
  _ConfrimationState createState() => _ConfrimationState();
}

class _ConfrimationState extends State<Confrimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Confirmation',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold,fontSize: 22,fontFamily: 'Montserrat'),

        ),
        leading: IconButton(
          color: Colors.black,
          onPressed: () {Navigator.pop(context);},
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
        ),
       centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 80),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 30,),
            Center(
              child: Card(

                  child: Image.asset('assets/Group3233.png',width: 330,height: 200,),

              ),

            ),
            SizedBox(height: 20,),
            Center(child: Text('Successfully',style: TextStyle(
                fontSize: 22,fontWeight: FontWeight.normal,color: Color(0xff36596A)),)),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(child: Text('Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor sed di invidunt ut to  very good set labore.',style: TextStyle(
                  fontSize: 16,fontWeight: FontWeight.w300,color: Color(0xff36596A),),textAlign: TextAlign.center,),),
            ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child:  DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          begin: AlignmentDirectional.centerStart,
                          end: AlignmentDirectional.centerEnd,
                          colors: [
                            Color(0XFF273246),
                            Color(0XFF181D29),
                          ])),
                  child: ElevatedButton(
                    onPressed: () {Navigator.pushNamed(context, '/categories_screen');},
                    child: Text(
                      'Done',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        primary: Colors.transparent),
                  ),
                )
              )
          ],
        ),
      ),
    );
  }
// }
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// class Confrimation extends StatefulWidget {
//   const Confrimation({Key? key}) : super(key: key);
//
//   @override
//   _ConfrimationState createState() => _ConfrimationState();
// }
//
// class _ConfrimationState extends State<Confrimation> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//         backgroundColor: Color(0xFF181D29),
//                      elevation: 10,
//                      title: Text(
//                       'Details',
//                                style: TextStyle(
//                          color: Color(0xFFffffff), fontWeight: FontWeight.bold),
//                                   textAlign: TextAlign.center,
//                            ),
//                   leading: IconButton(
//                               color: Color(0xFFffffff),
//                               onPressed: () {},
//                                 icon: Icon(Icons.arrow_back_ios,color:Color(0xffffffff) ,),
//     ),
//     actions: [
//
//     ],
//         ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           SizedBox(height: 20,),
//           Card(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 40),
//               child: Image.asset('assets/Group3233.png',),
//             ),
//           ),
//           Text(''),
//         ],
//       ),
//     );
//   }
// }
}