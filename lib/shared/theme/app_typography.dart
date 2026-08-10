import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Figma 스타일가이드 Mobile(390x844) 타입스케일 기준.
/// TODO: Pretendard 폰트 파일이 추가되면 각 스타일에 fontFamily를 지정합니다.
abstract final class AppTypography {
  static TextStyle get display =>
      TextStyle(fontSize: 28.sp, height: 1.3, fontWeight: FontWeight.bold);

  static TextStyle get heading1 =>
      TextStyle(fontSize: 24.sp, height: 1.4, fontWeight: FontWeight.bold);

  static TextStyle get heading2 =>
      TextStyle(fontSize: 20.sp, height: 1.4, fontWeight: FontWeight.bold);

  static TextStyle get heading3 =>
      TextStyle(fontSize: 18.sp, height: 1.4, fontWeight: FontWeight.bold);

  static TextStyle get bodyLarge =>
      TextStyle(fontSize: 16.sp, height: 1.6, fontWeight: FontWeight.normal);

  static TextStyle get body =>
      TextStyle(fontSize: 14.sp, height: 1.5, fontWeight: FontWeight.normal);

  static TextStyle get label =>
      TextStyle(fontSize: 14.sp, height: 1.4, fontWeight: FontWeight.w500);

  static TextStyle get caption =>
      TextStyle(fontSize: 12.sp, height: 1.5, fontWeight: FontWeight.normal);

  static TextStyle get captionMedium =>
      TextStyle(fontSize: 12.sp, height: 1.5, fontWeight: FontWeight.w500);

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
