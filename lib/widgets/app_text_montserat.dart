import 'package:flutter/material.dart';
import 'package:view_products/responsive/size_config.dart';

class AppTexMontseratBlack extends StatelessWidget {
  String titleOfButton;

  AppTexMontseratBlack({required this.titleOfButton});

  @override
  Widget build(BuildContext context) {
    return Text(
      titleOfButton,
      style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: SizeConfig().scaleTextFont(42),
          fontWeight: FontWeight.w900,
          color: Colors.black),
    );
  }
}
