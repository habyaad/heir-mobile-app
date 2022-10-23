import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:heir/ui/screens/settings/settings_model.dart';
import 'package:stacked/stacked.dart';

import '../../../heir_app_icons_icons.dart';
import '../../../models/user.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../widgets/bottom_nav.dart';
import '../../widgets/detail_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsScreenModel>.reactive(
        builder: (context, model, child) => Scaffold(
                body: BottomNavBar(
              parent: NavIdentifier.settings,
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: Image.asset(
                          'assets/images/settings_background_ellipse.png')),
                  SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 76,
                          ),
                          Text(
                            'Settings',
                            style: AppTextStyles.largeTitleBold(),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const CircleAvatar(
                                    radius: 24,
                                    backgroundImage: NetworkImage(
                                        'https://i.pravatar.cc/300'),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${User.demoUser.lastName} ${User.demoUser.firstName}',
                                        style: AppTextStyles.title2Medium(),
                                      ),
                                      Text(User.demoUser.email,
                                          style: AppTextStyles
                                              .subHeadlineRegular())
                                    ],
                                  )
                                ],
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 24,
                                color: AppColors.tertiaryColor2,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Divider(
                            color: Colors.black.withOpacity(.2),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          _OptionMenu(
                            model: model,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            children: [
                              const Icon(
                                HeirAppIcons.fi_rr_sign_out,
                                color: Color(0xffE33A24),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Text(
                                'Sign Out',
                                style: AppTextStyles.title2Regular()
                                    .copyWith(color: const Color(0xffE33A24)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
        viewModelBuilder: () => SettingsScreenModel());
  }
}

class _OptionMenu extends StatelessWidget {
  final SettingsScreenModel model;

  const _OptionMenu({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                model.menuList[index].routeName != null
                    ? context.router
                        .pushNamed('/${model.menuList[index].routeName.toString()}')
                    : null;
              },
              child: DetailTile(
                  trailingWidget: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 24,
                    color: AppColors.tertiaryColor2,
                  ),
                  detailTitle: model.menuList[index].title,
                  detailSubtitle: model.menuList[index].subtitle,
                  leadingWidget: _OptionLeadingWidget(
                    color: model.menuList[index].color,
                    icon: model.menuList[index].icon,
                  )),
            ),
        separatorBuilder: (ctx, i) => const SizedBox(
              height: 12,
            ),
        itemCount: model.menuList.length);
  }
}

class _OptionLeadingWidget extends StatelessWidget {
  final Color color;
  final IconData icon;

  const _OptionLeadingWidget(
      {Key? key, required this.color, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
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
              color: Colors.white.withOpacity(.25)),
          BoxShadow(
              offset: const Offset(0, 6),
              blurRadius: 4,
              inset: false,
              color: const Color(0xff303036).withOpacity(.05)),
        ],
      ),
      child: Icon(
        icon,
        size: 24,
        color: AppColors.tertiaryColor1,
      ),
    );
  }
}
