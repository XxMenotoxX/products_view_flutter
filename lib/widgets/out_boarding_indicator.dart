import 'package:flutter/material.dart';
import 'package:view_products/responsive/size_config.dart';

class OutBoardingIndicator extends StatelessWidget {
  final double marginEnd;
  final bool selected;

  OutBoardingIndicator({this.marginEnd = 0, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: marginEnd),
      width: SizeConfig().scaleWidth(10),
      height: SizeConfig().scaleHeight(10),
      decoration: BoxDecoration(
        color: selected ? Color(0xFF181D29) : Color(0xFFDDDDDD),
        shape: BoxShape.circle
      ),
    );
  }
}
