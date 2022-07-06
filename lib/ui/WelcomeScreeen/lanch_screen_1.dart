import 'package:flutter/material.dart';
import 'package:view_products/responsive/size_config.dart';
//import 'package:view_products/widgets/app_text_montserat.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'images/coco1.jpg',
                ),
                fit: BoxFit.cover),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          bottom: 150,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: SizeConfig().scaleWidth(286),
                    child: Text(
                      '''Find Juices and Drinks''',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w900,
                        fontSize:SizeConfig().scaleTextFont(42),
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height:SizeConfig().scaleHeight(10.0)),
                Text(
                  'If you want the best orange juice cocktails possible, squeeze the juice yourself.',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: SizeConfig().scaleTextFont(15.0),
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: SizeConfig().scaleWidth(10)),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

/*
body: Column(
         children: [

           Expanded(


             child: Container(
               decoration: BoxDecoration(

                    image: DecorationImage(

                  image: AssetImage(
                  'images/splash2.png'
    ),
    fit: BoxFit.cover
    ),
    ),
               child: Text('Find Juices and Drinks',
               style: TextStyle(
               fontFamily: 'Montserrat',
                   fontWeight: FontWeight.bold,
                   fontSize: 20,
                   color: Colors.white),
             ),


),
           ),
         ],
       ),

  child: Text('Find Juices and Drinks',
               style: TextStyle(
                 fontFamily: 'Montserrat',
                 fontWeight: FontWeight.bold,
                 fontSize: 20,
                 color: Colors.white
             ),),

      body: Column(
        children: [
          Expanded(

              child:Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                      'images/splash2.png'
                  ),
                      fit: BoxFit.cover
                  ),

                ),


              ),
          ),

        ],
      ),
 */
