import 'package:flutter/material.dart';
import 'package:view_products/responsive/size_config.dart';
class Lanch_screen_2 extends StatefulWidget {
  const Lanch_screen_2({Key? key}) : super(key: key);

  @override
  _Lanch_screen_2State createState() => _Lanch_screen_2State();
}

class _Lanch_screen_2State extends State<Lanch_screen_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(

                    image: DecorationImage(

                        image: AssetImage(
                          'images/juicedrink.jpg',


                        ),
                        fit: BoxFit.cover,

                    ),
                  ),

                ),

                  SizedBox(height:SizeConfig().scaleHeight(10)),
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

                              '''Find Fresh Juices''',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w900,
                                fontSize: SizeConfig().scaleTextFont(42),
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig().scaleHeight(10)),
                        Text(
                          'If you want the best orange juice cocktails possible, squeeze the juice yourself.',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: SizeConfig().scaleTextFont(15),
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: SizeConfig().scaleWidth(10)),
                      ],
                    ),
                  ),
                ),
    ],
    ),


    );
  }
}
