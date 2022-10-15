import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../heir_app_icons_icons.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';

class CurrencyPopUpMenu extends StatefulWidget {
  CurrencyPopUpMenu({Key? key}) : super(key: key);

  @override
  State<CurrencyPopUpMenu> createState() => CurrencyPopUpMenuState();
}

class CurrencyPopUpMenuState extends State<CurrencyPopUpMenu> {
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
