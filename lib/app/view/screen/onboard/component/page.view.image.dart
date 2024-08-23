import 'package:flutter/material.dart';

import '../../../../utils/constant/app.images/app.images.dart';

class PageViewImage extends StatelessWidget {
  int pageNumber;
  PageViewImage({super.key, required this.pageNumber});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      pageNumber == 1 ? AppImages.onboardImage1 :
      pageNumber == 2 ? AppImages.onboardImage2 :
      AppImages.onboardImage3,
      fit: BoxFit.cover,
    );
    // return AssetImage(

    // );
  }
}