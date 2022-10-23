import 'package:flutter/material.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_text_styles.dart';
import '../../../../widgets/detail_tile.dart';
import '../../../../widgets/general_button.dart';
import 'beneficiary_model.dart';

class BeneficiariesScreen extends StatelessWidget {
  const BeneficiariesScreen({Key? key}) : super(key: key);

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.arrow_back_ios,
                        size: 24,
                        color: AppColors.tertiaryColor1,
                      ),
                      Text(
                        'Beneficiaries',
                        style: AppTextStyles.largeTitleBold(),
                      ),
                      const Icon(
                        Icons.more_vert,
                        size: 24,
                        color: AppColors.tertiaryColor2,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Beneficiary',
                    style: AppTextStyles.title1Medium(),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Allocate an asset class to a benficiary. Asset is transferred to your beneficiary in the event of an eventuality ',
                    style: AppTextStyles.headlineRegular()
                        .copyWith(color: AppColors.tertiaryColor2),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const _BeneficiarySection(),
                  const SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GeneralButton(
                      height: 40,
                      width: 158,
                      buttonText: 'Add Beneficiary',
                      buttonColor: Colors.white,
                      border: Border.all(color: AppColors.primaryColor1),
                      textColor: AppColors.primaryColor1,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Trustee',
                    style: AppTextStyles.title1Medium(),
                  ),
                  Text(
                    'Trustee is someone you trust that will help the beneficiaries get your assets if they do not respond to our notifications.',
                    style: AppTextStyles.headlineRegular()
                        .copyWith(color: AppColors.tertiaryColor2),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'No Trustee yet',
                      style: AppTextStyles.title2Bold(),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: GeneralButton(
                      height: 40,
                      width: 136,
                      buttonText: 'Add Trustee',
                    ),
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

class _BeneficiarySection extends StatelessWidget {
  const _BeneficiarySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              /*model.menuList[index].routeName != null
                      ? context.router
                      .pushNamed(
                      '/${model.menuList[index].routeName.toString()}')
                      : null;*/
            },
            child: DetailTile(
                trailingWidget: const Icon(
                  Icons.more_vert,
                  size: 24,
                  color: AppColors.tertiaryColor2,
                ),
                detailTitle:
                    '${Beneficiary.beneficiaryList[index].lastName} ${Beneficiary.beneficiaryList[index].firstName}',
                detailSubtitle: Beneficiary.beneficiaryList[index].email,
                leadingWidget: const CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
                  backgroundColor: Colors.transparent,
                ))),
        separatorBuilder: (ctx, i) => const SizedBox(
              height: 12,
            ),
        itemCount: Beneficiary.beneficiaryList.length);
  }
}
