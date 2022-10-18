import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../heir_app_icons_icons.dart';
import '../../../models/transaction.dart';
import '../../../models/user.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../widgets/bottom_nav.dart';
import '../../widgets/currency_popup_menu.dart';
import '../../widgets/custom_paints/calendar_paint.dart';
import '../../widgets/detail_tile.dart';
import 'cards_model.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CardScreenModel>.reactive(
        builder: (context, model, child) => Scaffold(
            body: BottomNavBar(
                parent: NavIdentifier.card,
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    Container(
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
                                Text(
                                  'Cards',
                                  style: AppTextStyles.largeTitleBold(),
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
                                      width: 9,
                                    ),
                                    Text(
                                      'Add Card',
                                      style: AppTextStyles.headlineRegular()
                                          .copyWith(
                                              color: AppColors.tertiaryColor1),
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Text(
                              'Total Balance',
                              style: AppTextStyles.headlineRegular(),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('€${User.demoUser.getCardBalance}',
                                    style: AppTextStyles.title1Medium()),
                                CurrencyPopUpMenu()
                              ],
                            ),
                            const SizedBox(
                              height: 13,
                            ),
                          ],
                        )),
                    const _AtmCardCarousel(),
                    const SizedBox(
                      height: 15.68,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 70,
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (c, i) {
                                    return model.buttons[i];
                                  },
                                  separatorBuilder: (c, i) => const SizedBox(
                                        width: 33,
                                      ),
                                  itemCount: model.buttons.length),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            _TransactionCategory(
                              transactions: model.transactions,
                            ),
                            const SizedBox(
                              height: 16.36,
                            )
                          ],
                        )),
                  ],
                )))),
        viewModelBuilder: () => CardScreenModel());
  }
}

class _AtmCard extends StatelessWidget {
  const _AtmCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          width: 366,
          child: Container(
            height: 172.63,
            width: 337.5,
            decoration: BoxDecoration(
                color: AppColors.primaryColor1,
                borderRadius: BorderRadius.circular(16)),
            child: Align(
              child: Container(
                height: 76.37,
                width: 130.93,
                child: Image.asset(
                  'assets/images/mastercard-logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7.5, sigmaY: 7.5),
            child: Container(
              height: 200,
              width: 366,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    const Color(0xFFEB001B).withOpacity(.3),
                    const Color(0xFFF79E1B).withOpacity(.3),
                  ], transform: const GradientRotation(101)),
                  borderRadius: BorderRadius.circular(16)),
            ),
          ),
        ),
        Container(
          height: 200,
          width: 366,
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 21),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/mastercard-logo.png',
                  ),
                  Text('Debit',
                      style: AppTextStyles.ocrTextStyle()
                          .copyWith(fontSize: 14, color: Colors.white)),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('**** 0329',
                      style: AppTextStyles.ocrTextStyle()
                          .copyWith(fontSize: 14, color: Colors.white)),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Balance',
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
                  Row(
                    children: [
                      Text('VALID \nTHRU',
                          style: AppTextStyles.ocrTextStyle()
                              .copyWith(fontSize: 8)),
                      const SizedBox(
                        width: 3,
                      ),
                      Text('03/24',
                          style: AppTextStyles.ocrTextStyle()
                              .copyWith(fontSize: 14))
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

class _AtmCardCarousel extends StatefulWidget {
  const _AtmCardCarousel({Key? key}) : super(key: key);

  @override
  State<_AtmCardCarousel> createState() => _AtmCardCarouselState();
}

class _AtmCardCarouselState extends State<_AtmCardCarousel> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List atms = [const _AtmCard(), const _AtmCard(), const _AtmCard()];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Column(
          children: [
            CarouselSlider.builder(
                itemCount: 3,
                carouselController: _controller,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        atms[itemIndex],
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: false,
                    viewportFraction: 1,
                    aspectRatio: 2.0,
                    initialPage: 0,
                    disableCenter: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                    enableInfiniteScroll: false)),
            const SizedBox(
              height: 16.32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: atms.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                      width: _current == entry.key ? 24 : 4.0,
                      height: 4.0,
                      margin: const EdgeInsets.only(right: 6.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: _current == entry.key
                              ? AppColors.secondaryColor1
                              : const Color(0xffFD5522).withOpacity(.2))),
                );
              }).toList(),
            ),
          ],
        ));
  }
}

class _TransactionCategory extends StatelessWidget {
  const _TransactionCategory({Key? key, required this.transactions})
      : super(key: key);
  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Transactions',
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
                  amount: transactions[index].transactionType ==
                          TransactionType.debit
                      ? '-${transactions[index].getTransactionAmount}'
                      : transactions[index].getTransactionAmount,
                  detailTitle: transactions[index].name,
                  detailSubtitle:
                      '${transactions[index].dateTime.hour} : ${transactions[index].dateTime.minute} ${transactions[index].getMeridian}',
                  leadingWidget: Stack(
                    children: [
                      CustomPaint(
                        size: const Size(38, 38),
                        painter: CalendarPaint(
                            gradientColors: transactions[index].solidColor),
                      ),
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(13),
                            bottomLeft: Radius.circular(13)),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 37, sigmaY: 37),
                          child: CustomPaint(
                            size: const Size(38, 38),
                            painter: CalendarPaint(
                                gradientColors:
                                    transactions[index].gradientColors),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 38,
                        width: 38,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(transactions[index].dateTime.day.toString(),
                                style: AppTextStyles.subHeadlineBold().copyWith(color: AppColors.tertiaryColor1)),
                            Text(
                              transactions[index].getMonth,
                              style: AppTextStyles.subHeadlineRegular().copyWith(color: AppColors.tertiaryColor1),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
            separatorBuilder: (ctx, i) => const SizedBox(
                  height: 12,
                ),
            itemCount: transactions.length)
      ],
    );
  }
}
