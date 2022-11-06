import 'package:flutter/material.dart' hide BoxShadow, BoxDecoration;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../../heir_app_icons_icons.dart';
import '../../models/asset.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';
import 'detail_tile.dart';

class AssetListView extends StatelessWidget {
  const AssetListView(
      {Key? key, required this.assetCategory, required this.color, this.readOnly = false})
      : super(key: key);
  final Category assetCategory;
  final Color color;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    List<Asset> assetList = Asset.demoAssets
        .where((element) => element.assetCategory == assetCategory)
        .toList();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: color,
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(2, -2),
                      blurRadius: 5,
                      inset: true,
                      color: Colors.black.withOpacity(.15)),
                  BoxShadow(
                      offset: const Offset(-2, 2),
                      blurRadius: 4,
                      inset: true,
                      color: Colors.white.withOpacity(.25))
                ],
              ),
              child: Text(
                assetCategory.name,
                style: AppTextStyles.headlineRegular(),
              ),
            ),
            Visibility(
              visible: !readOnly,
              replacement: const SizedBox(),
              child: const Icon(
                HeirAppIcons.fi_rr_cross_circle,
                color: AppColors.tertiaryColor1,
                size: 16,
              ),
            )
          ],
        ),
        const SizedBox(height: 16,),
        ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => DetailTile(
              trailingWidget: Text(
                assetList[index].getAssetAmount,
                style: AppTextStyles.headlineRegular()
                    .copyWith(color: AppColors.tertiaryColor1),
              ),
              detailTitle: assetList[index].assetName,
              detailSubtitle: assetList[index].assetCategory.name,
              leadingWidget: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(2, -2),
                          blurRadius: 4,
                          inset: true,
                          color: Colors.black.withOpacity(.25)),
                      BoxShadow(
                          offset: const Offset(-2, 2),
                          blurRadius: 4,
                          inset: true,
                          color: Colors.white.withOpacity(.25))
                    ],
                    gradient: LinearGradient(
                        colors: [
                          const Color(0xFF9EB5DA).withOpacity(1),
                          const Color(0xFFEEAB97).withOpacity(.1)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)),
                child: Center(
                    child: Icon(
                      Asset.demoAssets[index].assetIcon,
                      color: AppColors.tertiaryColor1,
                    )),
              ),
            ),
            separatorBuilder: (ctx, i) => const SizedBox(
              height: 12,
            ),
            itemCount: assetList.length)
      ],
    );
  }
}
