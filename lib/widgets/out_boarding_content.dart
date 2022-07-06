import 'package:flutter/material.dart';

class OutBoardingContent extends StatelessWidget {
  final int imageNumber;
  final String title;

  OutBoardingContent({
    required this.imageNumber,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 33),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('images/Photo1.jpg'),
          SizedBox(height: 36),
          Text(
            title,
            style: TextStyle(
              color: Color(0xFF23203F),
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          SizedBox(height: 21),
          Text(
            'Now were up in the big leagues gettingour turn at bat. The Brady Bunch that\'s the way we  Brady Bunch..',
            // maxLines: 1,
            // overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              color: Color(0xFF716F87),
            ),
          ),
        ],
      ),
    );
  }
}
