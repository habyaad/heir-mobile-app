import 'package:flutter/material.dart';
import 'package:heir/utils/app_text_styles.dart';

import '../../heir_app_icons_icons.dart';
import '../../utils/app_colors.dart';

class DetailTile extends StatelessWidget {
  final String amount;
  final String detailTitle;
  final String detailSubtitle;
  final Widget leadingWidget;

  const DetailTile({
    Key? key,
    required this.amount,
    required this.detailTitle,
    required this.detailSubtitle,
    required this.leadingWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 76,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF5C5C5C), width: 0.15),
          boxShadow: [
            BoxShadow(
                color: AppColors.textBlack.withOpacity(.05),
                offset: const Offset(0, 6),
                blurRadius: 16)
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leadingWidget,
                const SizedBox(
                  width: 12,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      detailTitle,
                      style: AppTextStyles.title2Medium(),
                    ),
                    Text(detailSubtitle,
                        style: AppTextStyles.subHeadlineRegular())
                  ],
                )
              ],
            ),
          ),
          Text(
            amount,
            style: AppTextStyles.headlineRegular()
                .copyWith(color: AppColors.tertiaryColor1),
          )
        ],
      ),
    );
  }
}
