import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:heir/ui/screens/statistics/statistics_model.dart';
import 'package:stacked/stacked.dart';

import '../../../heir_app_icons_icons.dart';
import '../../../models/asset.dart';
import '../../../models/user.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../widgets/bottom_nav.dart';
import '../../widgets/custom_paints/statistics_paint.dart';
import '../../widgets/detail_tile.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StatisticsScreenModel>.reactive(
        builder: (context, model, child) => Scaffold(
                body: BottomNavBar(
              parent: NavIdentifier.statistics,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 415,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(32),
                              bottomLeft: Radius.circular(32)),
                          gradient: LinearGradient(
                              colors: [Color(0xff5887D1), Color(0xffD5C7FF)],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft)),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 60,
                          ),
                          _AssetTransactionToggler(model: model),
                          const SizedBox(
                            height: 32,
                          ),
                          Stack(
                            children: [
                              CustomPaint(
                                painter: StatisticsPaint(model.stats),
                                size: const Size(260, 260),
                              ),
                              SizedBox(
                                height: 260,
                                width: 260,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Assets Value',
                                      style: AppTextStyles.title2Medium()
                                          .copyWith(color: Colors.white, shadows: [
                                        Shadow(
                                            offset: const Offset(0, 4),
                                            blurRadius: 4,
                                            color: Colors.black.withOpacity(0.25))
                                      ]),
                                    ),
                                    const SizedBox(
                                      height: 27,
                                    ),
                                    Text(
                                      '€${User.demoUser.getAssetValue}',
                                      style: AppTextStyles.ocrTextStyle()
                                          .copyWith(color: Colors.white, fontSize: 28),
                                    ),
                                    const SizedBox(
                                      height: 14,
                                    ),
                                    Text(
                                      'Total Assets (5)',
                                      style: AppTextStyles.headlineRegular()
                                          .copyWith(color: Colors.white),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
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
                                      .copyWith(
                                          color: AppColors.tertiaryColor2),
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const _AssetSection(
                          assetCategory: Category.Crypto,
                          color: Color(0xffE5F8FF),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const _AssetSection(
                          assetCategory: Category.Bank,
                          color: Color(0xffFEF1EE),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            )),
        viewModelBuilder: () => StatisticsScreenModel());
  }
}

class _AssetSection extends StatelessWidget {
  const _AssetSection(
      {Key? key, required this.assetCategory, required this.color})
      : super(key: key);
  final Category assetCategory;
  final Color color;

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
            const Icon(
              HeirAppIcons.fi_rr_cross_circle,
              color: AppColors.tertiaryColor1,
              size: 16,
            )
          ],
        ),
        ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => DetailTile(
                  amount: assetList[index].getAssetAmount,
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

class _AssetTransactionToggler extends StatelessWidget {
  const _AssetTransactionToggler({Key? key, required this.model})
      : super(key: key);
  final StatisticsScreenModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.primaryColor4,
          borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              model.toggleAssetTransaction(true);
            },
            child: Container(
              width: 102,
              height: 27,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: model.assetActive
                    ? const LinearGradient(
                        colors: [Color(0xff5887D1), Color(0xffD5C7FF)],
                        transform: GradientRotation(99.77),
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)
                    : null,
              ),
              child: Center(
                child: Text(
                  'Assets',
                  style: AppTextStyles.headlineMedium().copyWith(
                      color: model.assetActive
                          ? Colors.white
                          : AppColors.tertiaryColor2),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              model.toggleAssetTransaction(false);
            },
            child: Container(
              width: 102,
              height: 27,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: !(model.assetActive)
                    ? const LinearGradient(
                        colors: [Color(0xff5887D1), Color(0xffD5C7FF)],
                        transform: GradientRotation(99.77),
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)
                    : null,
              ),
              child: Center(
                child: Text('Transactions',
                    style: AppTextStyles.headlineMedium().copyWith(
                        color: !(model.assetActive)
                            ? Colors.white
                            : AppColors.tertiaryColor2)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
