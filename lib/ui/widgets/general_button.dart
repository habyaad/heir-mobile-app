import 'package:flutter/material.dart';
import 'package:heir/utils/app_text_styles.dart';

import '../../heir_app_icons_icons.dart';
import '../../utils/app_colors.dart';

class GeneralButton extends StatelessWidget {
  final String buttonText;
  final bool hasShadow;
  final Color buttonColor;
  final double width;
  final double height;
  final Color textColor;
  final Border? border;

  const GeneralButton(
      {Key? key,
      required this.buttonText,
      this.hasShadow = true,
      this.buttonColor = AppColors.primaryColor1,
      this.textColor = Colors.white,
      this.width = 175,
      this.height = 60,
      this.border})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: buttonColor,
          border: border ?? border,
          boxShadow: hasShadow
              ? [
                  BoxShadow(
                      blurRadius: 20,
                      offset: const Offset(0, 5),
                      color: const Color(0xFF5887D1).withOpacity(0.25))
                ]
              : null),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            HeirAppIcons.fi_rr_cross_circle,
            color: textColor,
            size: 18,
          ),
          const SizedBox(
            width: 9,
          ),
          Text(
            buttonText,
            style: AppTextStyles.title2Regular().copyWith(color: textColor),
          )
        ],
      ),
    );
  }
}
