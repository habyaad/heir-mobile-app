import 'dart:ui';

import 'package:flutter/material.dart';
import '../../../../models/transaction.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../widgets/custom_paints/calendar_paint.dart';
import '../../../widgets/detail_tile.dart';
import '../../cards/cards_model.dart';

class TransactionSection extends StatelessWidget {
  const TransactionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Transaction> transactions = CardScreenModel.transactions;

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
              'History',
              style: AppTextStyles.title1Medium(),
            ),
            const Icon(
              Icons.search,
              size: 16,
              color: AppColors.tertiaryColor2,
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => DetailTile(
                  trailingWidget: Text(
                    transactions[index].transactionType == TransactionType.debit
                        ? '-${transactions[index].getTransactionAmount}'
                        : transactions[index].getTransactionAmount,
                    style: AppTextStyles.headlineRegular()
                        .copyWith(color: AppColors.tertiaryColor1),
                  ),
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
                                style: AppTextStyles.subHeadlineBold()
                                    .copyWith(color: AppColors.tertiaryColor1)),
                            Text(
                              transactions[index].getMonth,
                              style: AppTextStyles.subHeadlineRegular()
                                  .copyWith(color: AppColors.tertiaryColor1),
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
      ]),
    );
  }
}
