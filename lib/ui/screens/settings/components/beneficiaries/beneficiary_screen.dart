import 'dart:ui';

import 'package:flutter/material.dart';
import '../../../../../heir_app_icons_icons.dart';
import '../../../../../models/asset.dart';
import '../../../../../models/user.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_text_styles.dart';
import '../../../../widgets/assets_list_view.dart';
import '../../../../widgets/currency_popup_menu.dart';
import '../../../../widgets/custom_paints/beneficiary_paint.dart';

class BeneficiaryScreen extends StatelessWidget {
  final User beneficiary;

  const BeneficiaryScreen({Key? key, required this.beneficiary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment.topRight,
              child:
                  Image.asset('assets/images/settings_background_ellipse.png')),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(
                        Icons.arrow_back_ios,
                        size: 24,
                        color: AppColors.tertiaryColor1,
                      ),
                      Icon(
                        Icons.more_vert,
                        size: 24,
                        color: AppColors.tertiaryColor2,
                      )
                    ],
                  ),
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
                    backgroundColor: Colors.transparent,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    '${beneficiary.lastName} ${beneficiary.firstName}',
                    style: AppTextStyles.largeTitleBold(),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            HeirAppIcons.mail_outline_24px,
                            size: 16,
                            color: AppColors.tertiaryColor1,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            beneficiary.email,
                            style: AppTextStyles.headlineRegular(),
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(HeirAppIcons.call_24px,
                              size: 16, color: AppColors.tertiaryColor1),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            '+234 709 4563 342',
                            style: AppTextStyles.headlineRegular(),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Allocated Asset',
                          style: AppTextStyles.title1Medium()),
                      CurrencyPopUpMenu()
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const _AssetValueView(),
                      Column(
                        children: [
                          Text(
                            'Asset Value',
                            style: AppTextStyles.ocrTextStyle(),
                          ),
                          const SizedBox(height: 8,),
                          Text(
                            '€${User.demoUser.getAssetValue}',
                            style: AppTextStyles.ocrTextStyle().copyWith(fontSize: 24),
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
                    color: Color(0xffFEF1EE),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class _AssetValueView extends StatelessWidget {
  const _AssetValueView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 130,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 10,
            child: CustomPaint(
              size: const Size(366, 110),
              painter: BeneficiaryPaint(
                  color: const Color(0xffEEAB97)),
            ),
          ),
          Positioned(
            top: 20,
            child: SizedBox(
              height: 75,
              width: 366,
              child: ClipRect(
                child: ImageFiltered(
                    imageFilter: ImageFilter.blur(
                        sigmaX: 2.5, sigmaY: 2.5),
                    child: Image.asset(
                      'assets/images/heir-bg.png',
                      fit: BoxFit.scaleDown,
                    )),
              ),
            ),
          ),
          Positioned(
            top: 20,
            child: CustomPaint(
              size: const Size(366, 110),
              painter: BeneficiaryPaint(
                  color: const Color(0xff5887D1)),
            ),
          ),
        ],
      ),
    );
  }
}
