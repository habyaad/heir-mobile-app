import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../heir_app_icons_icons.dart';
import '../../../models/asset.dart';
import '../../../models/user.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_router/app_router.gr.dart';
import '../../../utils/app_text_styles.dart';
import '../../widgets/bottom_nav.dart';
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
                                  Text(User.demoUser.name,
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
                          _CurrencyPopUpMenu()
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const _AtmCard(),
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
                        height: 32.75,
                      ),
                      const _TopAssetCategory()
                    ],
                  ),
                ),
              ),
            )),
        viewModelBuilder: () => HomeScreenModel());
  }
}

class _CurrencyPopUpMenu extends StatefulWidget {
  _CurrencyPopUpMenu({Key? key}) : super(key: key);

  @override
  State<_CurrencyPopUpMenu> createState() => _CurrencyPopUpMenuState();
}

class _CurrencyPopUpMenuState extends State<_CurrencyPopUpMenu> {
  List<String> currency = ['NGN', 'USD', 'EUR', 'DNR'];

  String selected = 'NGN';

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        constraints: const BoxConstraints(maxWidth: 90, maxHeight: 90),
        padding: EdgeInsets.zero,
        position: PopupMenuPosition.under,
        itemBuilder: (context) => [
              PopupMenuItem(
                  padding: EdgeInsets.zero,
                  child: Container(
                      padding: const EdgeInsets.all(6),
                      height: 80,
                      width: 85,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: currency.length,
                        itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                context.router.pop();
                                selected = currency[index];
                              });
                            },
                            child: Text(currency[index])),
                        separatorBuilder: (ctx, i) => const Divider(),
                      ))),
            ],
        child: Container(
          height: 18.69,
          width: 53.87,
          decoration: BoxDecoration(
              color: const Color(0xFFFAFAFA),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: AppColors.tertiaryColor1, width: 0.3),
              boxShadow: [
                BoxShadow(
                    color: AppColors.textBlack.withOpacity(.05),
                    offset: const Offset(0, 6),
                    blurRadius: 16)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                selected,
                style: AppTextStyles.subHeadlineRegular(),
              ),
              const Icon(
                HeirAppIcons.down_arrow,
                size: 5,
              )
            ],
          ),
        ));
  }
}

class _AtmCard extends StatelessWidget {
  const _AtmCard({Key? key}) : super(key: key);

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
        Container(
          height: 200,
          width: 366,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    const Color(0xFFEEAB9780).withOpacity(0.5),
                    Colors.white.withOpacity(0),
                  ],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  transform: const GradientRotation(101)),
              borderRadius: BorderRadius.circular(16)),
          child: Center(
              child: SizedBox(
                  width: 150,
                  height: 150,
                  child: ClipRRect(
                    child: ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
                        child: Image.asset(
                          'assets/images/heir-bg.png',
                          fit: BoxFit.contain,
                        )),
                  ))),
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
                  const Icon(
                    Icons.visibility_off_outlined,
                    color: Colors.white,
                    size: 12,
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text('€${User.demoUser.getTotalWorth}',
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
                      Text('€${User.demoUser.getAssetValue}',
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
                      Text('€${User.demoUser.getCardBalance}',
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
            itemBuilder: (context, index) => _AssetTile(
                  amount: Asset.demoAssets[index].getAssetAmount,
                  assetName: Asset.demoAssets[index].assetName,
                  assetCategory: Asset.demoAssets[index].assetCategory.name,
                  assetIcon: Asset.demoAssets[index].assetIcon,
                ),
            separatorBuilder: (ctx, i) => const SizedBox(
                  height: 12,
                ),
            itemCount: Asset.demoAssets.length)
      ],
    );
  }
}

class _AssetTile extends StatelessWidget {
  final String amount;
  final String assetName;
  final String assetCategory;
  final IconData assetIcon;

  const _AssetTile(
      {Key? key,
      required this.amount,
      required this.assetName,
      required this.assetCategory,
      required this.assetIcon})
      : super(key: key);

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
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [
                        const Color(0xFF9EB5DA).withOpacity(1),
                        const Color(0xFFEEAB97).withOpacity(.1)
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                  child: Center(
                      child: Icon(
                    assetIcon,
                    color: AppColors.tertiaryColor1,
                  )),
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      assetName,
                      style: AppTextStyles.title2Medium(),
                    ),
                    Text(assetCategory,
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
