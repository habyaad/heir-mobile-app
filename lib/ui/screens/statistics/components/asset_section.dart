import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;

import '../../../../heir_app_icons_icons.dart';
import '../../../../models/asset.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../widgets/assets_list_view.dart';

class AssetSection extends StatelessWidget {
  const AssetSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(children: [
        const SizedBox(
          height: 32,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Asset Class',
              style: AppTextStyles.title1Medium()
                  .copyWith(color: const Color(0xff374957)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  HeirAppIcons.fi_rr_cross_circle,
                  color: AppColors.tertiaryColor1,
                  size: 16,
                ),
                const SizedBox(
                  width: 7,
                ),
                Text(
                  'Asset Class',
                  style: AppTextStyles.headlineRegular()
                      .copyWith(color: AppColors.tertiaryColor2),
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const AssetListView(
          assetCategory: Category.Crypto,
          color: Color(0xffE5F8FF),
        ),
        const SizedBox(
          height: 16,
        ),
        const AssetListView(
          assetCategory: Category.Bank,
          color: Color(0xffFEF1EE),
        ),
        const SizedBox(
          height: 16,
        ),
      ]),
    );
  }
}