import 'package:flutter/material.dart';
import 'package:heir/utils/app_text_styles.dart';

import '../../heir_app_icons_icons.dart';
import '../../utils/app_colors.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key, required this.icon, required this.actionText})
      : super(key: key);
  final IconData icon;
  final String actionText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 65,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0xff5887D1).withOpacity(.1),
            offset: const Offset(0, 10),
            blurRadius: 20)
      ], borderRadius: BorderRadius.circular(8),
      color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: AppColors.primaryColor1,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            actionText,
            style: AppTextStyles.headlineRegular()
                .copyWith(color: AppColors.tertiaryColor1),
          )
        ],
      ),
    );
  }
}
