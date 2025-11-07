import 'package:auth_with_getx/common/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import 'app_colors.dart';

class AppThemeData {
  static ThemeData getTheme(BuildContext context) {
    const Color primaryColor = AppColors.primary;

    final Map<int, Color> primaryColorMap = {
      50: AppColors.primary50,
      100: AppColors.primary100,
      200: AppColors.primary200,
      300: AppColors.primary300,
      400: AppColors.primary400,
      500: AppColors.primary500,
      600: AppColors.primary600,
      700: AppColors.primary700,
      800: AppColors.primary800,
      900: AppColors.primary900,
    };
    final MaterialColor primaryMaterialColor = MaterialColor(
      primaryColor.value,
      primaryColorMap,
    );

    return ThemeData(
      fontFamily: "Inter",
      canvasColor: AppColors.background,
      scaffoldBackgroundColor: AppColors.background,
      brightness: Brightness.light,
      colorScheme: ThemeData().colorScheme.copyWith(primary: primaryColor),
      primaryColor: primaryColor,
      primarySwatch: primaryMaterialColor,
      splashColor: AppColors.primary200,
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all(
          AppColors.primary300,
        ), // Color of the thumb
        trackColor: WidgetStateProperty.all(
          AppColors.primary100,
        ), // Background track
        trackBorderColor: WidgetStateProperty.all(
          AppColors.primary200,
        ), // Border of the track
        radius: Radius.circular(3.w),
        thickness: WidgetStateProperty.all(1.w), // Width of the scrollbar
        thumbVisibility: WidgetStateProperty.all(false), // Always show thumb
      ),
      iconTheme: IconThemeData(size: 6.w),
      appBarTheme: AppBarTheme(
        toolbarHeight: 7.h,
        backgroundColor: AppColors.primary,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          systemNavigationBarColor: Color(0xFF000000),
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        iconTheme: IconThemeData(color: AppColors.background, size: 6.w),
        elevation: 0,
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: AppColors.background,
          fontWeight: FontWeight.w600,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.borderRadiusMedium),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: primaryColor,
          elevation: 0.0,
          minimumSize: Size(100.w, 5.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.borderRadiusSmall),
          ),
          // label medium
          textStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            height: 6 / 5,
            color: AppColors.ring,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.ring,
          backgroundColor: AppColors.background,
          elevation: 0.0,
          side: const BorderSide(color: AppColors.ring, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.borderRadiusSmall),
          ),
          minimumSize: Size(100.w, 4.h),
          // label medium
          textStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            height: 6 / 5,
            color: AppColors.ring,
          ),
        ),
      ),
      chipTheme: ChipThemeData(
        selectedColor: primaryColor,
        backgroundColor: AppColors.background,
        padding: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 1.5.w),
        brightness: Brightness.light,
        disabledColor: Colors.grey,
        secondarySelectedColor: AppColors.primary300,
        secondaryLabelStyle: const TextStyle(
          color: AppColors.background,
          fontWeight: FontWeight.w500,
        ),
        labelStyle: Theme.of(context).textTheme.labelSmall,
      ),
      // In your app theme file
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(fontSize: 12.sp),
        labelStyle: TextStyle(fontSize: 12.sp),
        // prefixIconColor: AppColors.textInput,
        contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            Dimens.borderRadiusSmall,
          ), // Set default rounded border to 15
          borderSide: BorderSide(
            color: AppColors.ring.withOpacity(0.2),
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            Dimens.borderRadiusSmall,
          ), // Set default rounded border to 15
          borderSide: BorderSide(
            color: AppColors.ring.withOpacity(0.2),
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            Dimens.borderRadiusSmall,
          ), // Set focused border rounded to 15
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 2.0,
          ), // Blue color when focused
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            Dimens.borderRadiusSmall,
          ), // Set error border rounded to 15
          borderSide: const BorderSide(color: Colors.red, width: 2.0),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 57.sp,
          fontWeight: FontWeight.w400,
          height: 64 / 57,
          letterSpacing: -0.25,
          color: AppColors.ring,
        ),
        displayMedium: TextStyle(
          fontSize: 32.sp,
          fontWeight: FontWeight.w500,
          height: 52 / 45,
          letterSpacing: 0.0,
          color: AppColors.ring,
        ),
        displaySmall: TextStyle(
          fontSize: 28.sp,
          fontWeight: FontWeight.w500,
          height: 44 / 36,
          letterSpacing: 0.0,
          color: AppColors.ring,
        ),
        headlineLarge: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.w700,
          height: 6 / 5,
          color: AppColors.ring,
        ),
        headlineMedium: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          height: 6 / 5,
          color: AppColors.ring,
        ),
        headlineSmall: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          height: 6 / 5,
          color: AppColors.ring,
        ),
        titleLarge: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          height: 6 / 5,
          color: AppColors.ring,
        ),
        titleMedium: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          height: 6 / 5,
          color: AppColors.ring,
        ),
        titleSmall: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          height: 6 / 5,
          color: AppColors.ring,
        ),
        bodyLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          height: 6 / 5,
          color: AppColors.ring,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          height: 6 / 5,
          color: AppColors.ring,
        ),
        bodySmall: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
          height: 6 / 5,
          color: AppColors.ring,
        ),
        labelLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          height: 6 / 5,
          color: AppColors.ring,
        ),
        labelMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          height: 6 / 5,
          color: AppColors.ring,
        ),
        labelSmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          height: 6 / 5,
          color: AppColors.ring,
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.primary,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.borderRadiusSmall),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          // padding: EdgeInsets.zero,
          minimumSize: const Size(50, 30),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          alignment: Alignment.centerLeft,
          textStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            height: 6 / 5,
            color: AppColors.primary,
          ),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
      ),
    );
  }
}
