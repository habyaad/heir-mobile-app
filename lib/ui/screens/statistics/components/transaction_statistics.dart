import 'package:flutter/material.dart';

import '../../../../heir_app_icons_icons.dart';
import '../../../../models/user.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../widgets/custom_paints/asset_statistics_paint.dart';
import '../../../widgets/custom_paints/transaction_statistics_paint.dart';
import '../statistics_model.dart';

class TransactionStatistics extends StatelessWidget {
  final StatisticsScreenModel model;

  const TransactionStatistics({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          painter: TransactionStatisticsPaint(),
          size: const Size(260, 260),
        ),
        SizedBox(
          height: 260,
          width: 260,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Expenses',
                    style: AppTextStyles.title2Medium()
                        .copyWith(color: Colors.white, shadows: [
                      Shadow(
                          offset: const Offset(0, 4),
                          blurRadius: 4,
                          color: Colors.black.withOpacity(0.25))
                    ]),
                  ),
                  const SizedBox(width: 6,),
                  const Icon(Icons.arrow_drop_down, size: 14, color: Colors.white,)
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                '€325,000',
                style: AppTextStyles.ocrTextStyle()
                    .copyWith(color: Colors.white, fontSize: 28),
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                'Out of N3,511,400',
                style: AppTextStyles.headlineRegular()
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
        Container(
          height: 260,
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 35,
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  bool isActive = model.activeIndex == index;
                  return GestureDetector(
                    onTap: () {
                      model.makeActive(index);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: isActive
                            ? AppColors.primaryColor1
                            : Colors.transparent,
                      ),
                      child: Text(
                        index==0? 'W' : index==1? 'M' : 'Y',
                        style: AppTextStyles.headlineRegular()
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  );
                },
                separatorBuilder: (c, i) => const SizedBox(
                      width: 12,
                    ),
                itemCount: 3),
          ),
        ),
      ],
    );
  }
}
