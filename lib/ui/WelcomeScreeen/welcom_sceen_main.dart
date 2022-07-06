import 'package:flutter/material.dart';
import 'package:view_products/responsive/size_config.dart';
import 'package:view_products/ui/WelcomeScreeen/lanch_screen_1.dart';
import 'package:view_products/widgets/out_boarding_content.dart';
import 'package:view_products/widgets/out_boarding_indicator.dart';

import 'lanch_screen0.dart';
import 'lanch_screen_2.dart';

class OutBoardingScreen extends StatefulWidget {
  const OutBoardingScreen({Key? key}) : super(key: key);

  @override
  _OutBoardingScreenState createState() => _OutBoardingScreenState();
}

class _OutBoardingScreenState extends State<OutBoardingScreen> {
  int _currentPage = 0;

  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Visibility(
                visible: _currentPage != 2,
                replacement: TextButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/login_screen'),
                  child: Text('START'),
                ),
                child: TextButton(
                  onPressed: () {
                    _pageController.jumpToPage(2);
                  },
                  child: Text('SKIP'),
                ),
              ),
            ),
            PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                print('Page: $page');
                setState(() {
                  _currentPage = page;
                });
              },
              scrollDirection: Axis.horizontal,
              children: [
                LaunchScreen(),
                Welcome(),
                Lanch_screen_2(),
              ],
            ),

            Positioned(
              top: 0,
              bottom: SizeConfig().scaleHeight(50),
              right: 0,
              left: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Visibility(
                  visible: _currentPage == 2,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig().scaleWidth(20),
                    ),
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, '/login_screen'),
                      child: Text(
                        'Start',
                        style: TextStyle(
                            fontSize: SizeConfig().scaleTextFont(16),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(
                          double.infinity,
                          SizeConfig().scaleHeight(50),
                        ),
                        primary: Color(0xFF181D29),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // SizedBox(height: 30),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Visibility(
            //       visible: _currentPage != 0,
            //       maintainSize: true,
            //       maintainAnimation: true,
            //       maintainState: true,
            //       child: IconButton(
            //         onPressed: () {
            //           _pageController.previousPage(
            //               duration: Duration(seconds: 1),
            //               curve: Curves.easeInOut);
            //         },
            //         icon: Icon(Icons.arrow_back_ios),
            //       ),
            //     ),
            //     Visibility(
            //       visible: _currentPage != 2,
            //       maintainSize: true,
            //       maintainAnimation: true,
            //       maintainState: true,
            //       child: IconButton(
            //         onPressed: () {
            //           _pageController.nextPage(
            //               duration: Duration(seconds: 1),
            //               curve: Curves.easeInOut);
            //         },
            //         icon: Icon(Icons.arrow_forward_ios),
            //       ),
            //     ),
            //   ],
            // ),
            Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              left: 0,
              child: Visibility(
                visible: _currentPage == 0,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig().scaleWidth(20),
                      vertical: SizeConfig().scaleHeight(21),
                    ),
                    height: SizeConfig().scaleHeight(252),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.only(
                        topEnd: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Get start',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: SizeConfig().scaleTextFont(28),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: SizeConfig().scaleHeight(7),
                        ),
                        Text(
                          'If you want the best orange juice cocktails possible, squeeze the juice yourself.',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: SizeConfig().scaleTextFont(14),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: SizeConfig().scaleHeight(1),
                        ),
                        SizedBox(
                          height: SizeConfig().scaleHeight(38),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(
                            //       vertical: 20, horizontal: 20),
                            //   // child: TextButton(
                            //   //   onPressed: () {},
                            //   //   child: Text(' Login',
                            //   //       style: TextStyle(
                            //   //           color: Color(0xffffffff),
                            //   //           fontFamily: 'Montserrat ',
                            //   //           fontWeight: FontWeight.w400,
                            //   //           fontSize: 15),
                            //   //       textAlign: TextAlign.center),
                            //   //   style: ButtonStyle(
                            //   //     padding: MaterialStateProperty.all(
                            //   //         EdgeInsets.symmetric(
                            //   //             horizontal: 50, vertical: 5)),
                            //   //     backgroundColor: MaterialStateProperty.all(
                            //   //         Color(0xFF181D29)),
                            //   //   ),
                            //   // ),
                            // ),
                            ElevatedButton(
                              onPressed: () {Navigator.pushReplacementNamed(context, '/login_screen');},
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Montserrat',
                                  fontSize: SizeConfig().scaleTextFont(16),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0XFF181D29),
                                  minimumSize: Size(
                                      SizeConfig().scaleWidth(158),
                                      SizeConfig().scaleHeight(50)),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              width: SizeConfig().scaleWidth(19),
                            ),
                            // OutlinedButton(
                            //   onPressed: () {},
                            //   child: Text(
                            //     'Sing up',
                            //     style: TextStyle(
                            //         color: Color(0xFF181D29),
                            //         fontFamily: 'Montserrat ',
                            //         fontWeight: FontWeight.bold),
                            //     textAlign: TextAlign.center,
                            //   ),
                            //   style: OutlinedButton.styleFrom(
                            //       side: BorderSide(
                            //           color: Color(0xFF181D29), width: 1),
                            //       padding: EdgeInsets.symmetric(
                            //           vertical: 10, horizontal: 50)),
                            // )
                            ElevatedButton(
                              onPressed: () {Navigator.pushReplacementNamed(context, '/sign_up_screen');},
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Montserrat',
                                  fontSize: SizeConfig().scaleTextFont(16),
                                  color: Color(0XFF181D29),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  minimumSize: Size(
                                      SizeConfig().scaleWidth(158),
                                      SizeConfig().scaleHeight(50)),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                          color: Color(0XFF181D29), width: SizeConfig().scaleWidth(2)))),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              bottom: SizeConfig().scaleHeight(50),
              right: 0,
              left: 0,
              child: Visibility(
                visible: _currentPage == 1,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {Navigator.pushReplacementNamed(context, '/login_screen');},
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                            fontSize: SizeConfig().scaleTextFont(16),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Color(0XFF181D29),
                            minimumSize: Size(SizeConfig().scaleWidth(158),
                                SizeConfig().scaleHeight(50)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                      SizedBox(
                        width: SizeConfig().scaleWidth(19),
                      ),
                      ElevatedButton(
                        onPressed: () {Navigator.pushReplacementNamed(context, '/sign_up_screen');},
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                            fontSize: SizeConfig().scaleTextFont(16),
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            elevation: 0,
                            minimumSize: Size(SizeConfig().scaleWidth(158),
                                SizeConfig().scaleHeight(50)),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side:
                                    BorderSide(color: Colors.white, width: 2))),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              top: 0,
              right: 0,
              left: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutBoardingIndicator(
                        marginEnd: 14, selected: _currentPage == 0),
                    OutBoardingIndicator(
                        marginEnd: 14, selected: _currentPage == 1),
                    OutBoardingIndicator(selected: _currentPage == 2),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
