import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class Dimens {
  // Default padding and margin values
  static const double paddingPage = 20.0;
  static const double paddingScreen = 24.0;
  static double paddingXXSmall = 1.0.w;
  static double paddingXSmall = 2.0.w;
  static double paddingSmall = 3.0.w;
  static double paddingText = 4.0.w;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 32.0;
  static const double borderRadiusXSmall = 5.0;
  static const double borderRadiusSmall = 10.0;
  static const double borderRadiusMedium = 16.0;
  static const double borderRadiusLarge = 25.0;

  // Custom padding
  static EdgeInsets paddingAllDefault = const EdgeInsets.all(paddingPage);
  static EdgeInsets paddingAllXXSmall =
      EdgeInsets.symmetric(vertical: paddingXXSmall, horizontal: paddingXSmall);
  static EdgeInsets paddingAllXSmall =
      EdgeInsets.symmetric(vertical: paddingXSmall, horizontal: paddingSmall);
  static EdgeInsets paddingAllSmall =
      EdgeInsets.symmetric(vertical: paddingText, horizontal: paddingSmall);
  static EdgeInsets marginAllSmall =
      EdgeInsets.symmetric(vertical: paddingText, horizontal: paddingSmall);
  static EdgeInsets marginDefault =
      EdgeInsets.symmetric(horizontal: paddingPage, vertical: paddingText);
  static EdgeInsets paddingHorizontal =
      const EdgeInsets.symmetric(horizontal: paddingPage);
  static EdgeInsets paddingVerticalMedium =
      const EdgeInsets.symmetric(vertical: paddingMedium);
  static EdgeInsets paddingVerticalSmall =
      EdgeInsets.symmetric(vertical: paddingText);
  static EdgeInsets paddingSliverAppBar =
      EdgeInsets.symmetric(horizontal: paddingPage, vertical: paddingXSmall);
  static EdgeInsets paddingBeforeSliver = const EdgeInsets.only(
      top: paddingPage, left: paddingPage, right: paddingPage);
  static EdgeInsets paddingListSliver = const EdgeInsets.only(
      bottom: paddingPage, left: paddingPage, right: paddingPage);
  static EdgeInsets paddingDialog =
      EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w);

  // Spacing for widgets like SizedBox
  static Widget verticalSpaceSmall = SizedBox(height: 0.5.h);
  static Widget verticalSpaceRegular = SizedBox(height: 1.h);
  static Widget verticalSpaceMedium = SizedBox(height: 2.h);
  static Widget verticalSpaceLarge = SizedBox(height: 3.h);

  static Widget horizontalSpaceSmall = SizedBox(width: 2.w);
  static Widget horizontalSpaceMedium = const SizedBox(width: 16.0);
  static Widget horizontalSpaceLarge = const SizedBox(width: 32.0);
}
