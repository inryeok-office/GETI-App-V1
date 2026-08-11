import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Figma 스타일가이드 Mobile(390x844) 타입스케일 기준.
/// TODO: Pretendard 폰트 파일이 추가되면 각 스타일에 fontFamily를 지정합니다.
abstract final class AppTypography {
  static TextStyle get display => TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 28.sp,
    height: 1.3,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.28.sp,
  );

  static TextStyle get heading1 => TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 24.sp,
    height: 1.4,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.24.sp,
  );

  static TextStyle get heading2 => TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 20.sp,
    height: 1.4,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.2.sp,
  );

  static TextStyle get heading3 => TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 18.sp,
    height: 1.4,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.18.sp,
  );

  static TextStyle get bodyLarge => TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 16.sp,
    height: 1.6,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.16.sp,
  );

  static TextStyle get body => TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 14.sp,
    height: 1.5,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.14.sp,
  );

  static TextStyle get label => TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 14.sp,
    height: 1.4,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.14.sp,
  );

  static TextStyle get caption => TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 12.sp,
    height: 1.5,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.12.sp,
  );

  static TextStyle get captionMedium => TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 12.sp,
    height: 1.5,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.12.sp,
  );

  static TextTheme get textTheme => TextTheme(
    displayLarge: display,
    headlineLarge: heading1,
    headlineMedium: heading2,
    headlineSmall: heading3,
    bodyLarge: bodyLarge,
    bodyMedium: body,
    labelLarge: label,
    bodySmall: caption,
    labelSmall: captionMedium,
  );
}
