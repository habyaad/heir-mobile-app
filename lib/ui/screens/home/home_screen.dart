import 'dart:ui';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:stacked/stacked.dart';
import '../../../models/asset.dart';
import '../../../models/user.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../widgets/bottom_nav.dart';
import '../../widgets/currency_popup_menu.dart';
import '../../widgets/detail_tile.dart';
import '../../widgets/general_button.dart';
import 'home_screen_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenModel>.reactive(
        builder: (context, model, child) => Scaffold(
                body: BottomNavBar(
              parent: NavIdentifier.home,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Welcome Back!',
                                  style: AppTextStyles.subHeadlineMedium()),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  Text(User.demoUser.firstName,
                                      style: AppTextStyles.title1Medium()),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  SizedBox(
                                      height: 28,
                                      width: 28,
                                      child: Image.asset(
                                        'assets/images/waving-palm.png',
                                        fit: BoxFit.scaleDown,
                                      ))
                                ],
                              ),
                            ],
                          ),
                          const CircleAvatar(
                            radius: 21,
                            backgroundImage:
                                NetworkImage('https://i.pravatar.cc/300'),
                            backgroundColor: Colors.transparent,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Net Worth',
                            style: AppTextStyles.largeTitleBold(),
                          ),
                          CurrencyPopUpMenu()
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      _NetWorthCard(
                        model: model,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const GeneralButton(
                            buttonText: 'Add Assets',
                          ),
                          GeneralButton(
                            buttonText: 'Add Card',
                            hasShadow: false,
                            buttonColor: Colors.white,
                            textColor: AppColors.secondaryColor1,
                            border:
                                Border.all(color: AppColors.secondaryColor1),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      const _TopAssetCategory(),
                      const SizedBox(
                        height: 16,
                      )
                    ],
                  ),
                ),
              ),
            )),
        viewModelBuilder: () => HomeScreenModel());
  }
}

class _NetWorthCard extends StatelessWidget {
  const _NetWorthCard({Key? key, required this.model}) : super(key: key);
  final HomeScreenModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 198.91,
          width: 366,
          decoration: BoxDecoration(
              color: AppColors.primaryColor1,
              borderRadius: BorderRadius.circular(16)),
        ),
        SizedBox(
          height: 200,
          width: 366,
          child: ClipRect(
            child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
                child: Image.asset(
                  'assets/images/heir-bg.png',
                  fit: BoxFit.scaleDown,
                )),
          ),
        ),
        Container(
          height: 200,
          width: 366,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    const Color(0xFFEEAB97).withOpacity(0.5),
                    Colors.white.withOpacity(0),
                  ],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  transform: const GradientRotation(101)),
              borderRadius: BorderRadius.circular(16)),
        ),
        Container(
          height: 200,
          width: 366,
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 21),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Net Worth',
                    style: AppTextStyles.ocrTextStyle(),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  GestureDetector(
                    onTap: () {
                      model.switchVisibility();
                    },
                    child: Icon(
                      model.amountIsVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Colors.white,
                      size: 16,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                  model.amountIsVisible
                      ? '€${User.demoUser.getTotalWorth}'
                      : model.obscureText,
                  style: AppTextStyles.ocrTextStyle().copyWith(fontSize: 28)),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Assets Value',
                          style: AppTextStyles.ocrTextStyle()
                              .copyWith(fontSize: 14)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                          model.amountIsVisible
                              ? '€${User.demoUser.getAssetValue}'
                              : model.obscureText,
                          style: AppTextStyles.ocrTextStyle()
                              .copyWith(fontSize: 18))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Cards Balance',
                          style: AppTextStyles.ocrTextStyle()
                              .copyWith(fontSize: 14)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                          model.amountIsVisible
                              ? '€${User.demoUser.getCardBalance}'
                              : model.obscureText,
                          style: AppTextStyles.ocrTextStyle()
                              .copyWith(fontSize: 18))
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class _TopAssetCategory extends StatelessWidget {
  const _TopAssetCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Top Assets',
              style: AppTextStyles.title1Medium(),
            ),
            Text(
              'See All',
              style: AppTextStyles.subHeadlineRegular()
                  .copyWith(color: AppColors.tertiaryColor1),
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => DetailTile(
                  trailingWidget: Text(
                    Asset.demoAssets[index].getAssetAmount,
                    style: AppTextStyles.headlineRegular()
                        .copyWith(color: AppColors.tertiaryColor1),
                  ),
                  detailTitle: Asset.demoAssets[index].assetName,
                  detailSubtitle: Asset.demoAssets[index].assetCategory.name,
                  leadingWidget: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(2, -2),
                              blurRadius: 4,
                              inset: true,
                              color: Colors.black.withOpacity(.25)),
                          BoxShadow(
                              offset: Offset(-2, 2),
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
            itemCount: Asset.demoAssets.length)
      ],
    );
  }
}
