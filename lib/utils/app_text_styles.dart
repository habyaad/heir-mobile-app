import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();

  static TextStyle largeTitleBold() {
    return const TextStyle(
        fontSize: 28, fontWeight: FontWeight.w700, color: AppColors.textBlack);
  }

  static TextStyle largeTitleMedium() {
    return const TextStyle(
        fontSize: 28, fontWeight: FontWeight.w500, color: AppColors.textBlack);
  }

  static TextStyle largeTitleRegular() {
    return const TextStyle(
        fontSize: 28, fontWeight: FontWeight.w200, color: AppColors.textBlack);
  }

  static TextStyle title1Bold() {
    return const TextStyle(
        fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.textBlack);
  }

  static TextStyle title1Medium() {
    return const TextStyle(
        fontSize: 24, fontWeight: FontWeight.w500, color: AppColors.textBlack);
  }

  static TextStyle title1Regular() {
    return const TextStyle(
        fontSize: 24, fontWeight: FontWeight.w200, color: AppColors.textBlack);
  }

  static TextStyle title2Bold() {
    return const TextStyle(
        fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.textBlack);
  }

  static TextStyle title2Medium() {
    return const TextStyle(
        fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.textBlack);
  }

  static TextStyle title2Regular() {
    return const TextStyle(
        fontSize: 18, fontWeight: FontWeight.w200, color: AppColors.textBlack);
  }

  static TextStyle headlineBold() {
    return const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.textBlack);
  }

  static TextStyle headlineMedium() {
    return const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textBlack);
  }

  static TextStyle headlineRegular() {
    return const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w200, color: AppColors.textBlack);
  }

  static TextStyle subHeadlineBold() {
    return const TextStyle(
        fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.textBlack);
  }

  static TextStyle subHeadlineMedium() {
    return const TextStyle(
        fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.textBlack);
  }

  static TextStyle subHeadlineRegular() {
    return const TextStyle(
        fontSize: 12, fontWeight: FontWeight.w200, color: AppColors.textBlack);
  }

  static TextStyle ocrTextStyle() {
    return TextStyle(
        shadows: [
          Shadow(
              offset: const Offset(0, 4),
              blurRadius: 4,
              color: Colors.black.withOpacity(0.25))
        ],
        fontSize: 16,
        fontFamily: 'OcrAExtended',
        fontWeight: FontWeight.w400,
        color: Colors.white);
  }
}
