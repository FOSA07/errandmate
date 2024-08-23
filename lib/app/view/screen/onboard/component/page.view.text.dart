import 'package:flutter/material.dart';

import '../../../../utils/constant/app.texts/onboard.text.dart';

class PageViewText extends StatelessWidget {
  final bool current;
  final int pageNumber;
  const PageViewText({
    super.key, 
    required this.current,
    required this.pageNumber
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: current ? 1 : 0, 
      duration: const Duration(seconds: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pageNumber == 1 ? OnBoardText.header1 :
            pageNumber == 2 ? OnBoardText.header2 :
            OnBoardText.header3,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.white
            ),
          ),
          Text(
            pageNumber == 1 ? OnBoardText.body1 :
            pageNumber == 2 ? OnBoardText.body2 :
            OnBoardText.body3,
            style: const TextStyle(
              color: Colors.white
            ),
          ),
        ],
      ),
    );
  }
}