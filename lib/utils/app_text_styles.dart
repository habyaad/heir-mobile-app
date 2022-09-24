import 'package:flutter/material.dart';

class AppTextStyles{
  const AppTextStyles._();
  static TextStyle largeTitleBold() {
    return const TextStyle(fontSize: 28, fontWeight: FontWeight.w700,);
  }
  static TextStyle largeTitleMedium() {
    return const TextStyle(fontSize: 28, fontWeight: FontWeight.w500,);
  }
  static TextStyle largeTitleRegular() {
    return const TextStyle(fontSize: 28, fontWeight: FontWeight.w200,);
  }

  static TextStyle title1Bold() {
    return const TextStyle(fontSize: 24, fontWeight: FontWeight.w700,);
  }
  static TextStyle title1Medium() {
    return const TextStyle(fontSize: 24, fontWeight: FontWeight.w500,);
  }
  static TextStyle title1Regular() {
    return const TextStyle(fontSize: 24, fontWeight: FontWeight.w200,);
  }

  static TextStyle title2Bold() {
    return const TextStyle(fontSize: 18, fontWeight: FontWeight.w700,);
  }
  static TextStyle title2Medium() {
    return const TextStyle(fontSize: 18, fontWeight: FontWeight.w500,);
  }
  static TextStyle title2Regular() {
    return const TextStyle(fontSize: 18, fontWeight: FontWeight.w200,);
  }

  static TextStyle headlineBold() {
    return const TextStyle(fontSize: 14, fontWeight: FontWeight.w700,);
  }
  static TextStyle headlineMedium() {
    return const TextStyle(fontSize: 14, fontWeight: FontWeight.w500,);
  }
  static TextStyle headlineRegular() {
    return const TextStyle(fontSize: 14, fontWeight: FontWeight.w200,);
  }

  static TextStyle subHeadlineBold() {
    return const TextStyle(fontSize: 12, fontWeight: FontWeight.w700,);
  }
  static TextStyle subHeadlineMedium() {
    return const TextStyle(fontSize: 12, fontWeight: FontWeight.w500,);
  }
  static TextStyle subHeadlineRegular() {
    return const TextStyle(fontSize: 12, fontWeight: FontWeight.w200,);
  }
}