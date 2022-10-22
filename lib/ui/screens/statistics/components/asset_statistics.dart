import 'package:flutter/material.dart';

import '../../../../models/user.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../widgets/custom_paints/asset_statistics_paint.dart';
import '../statistics_model.dart';

class AssetStatistics extends StatelessWidget {
  final StatisticsScreenModel model;
  const AssetStatistics({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          painter: AssetStatisticsPaint(model.stats),
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
                    .copyWith(
                    color: Colors.white,
                    shadows: [
                      Shadow(
                          offset: const Offset(0, 4),
                          blurRadius: 4,
                          color: Colors.black
                              .withOpacity(0.25))
                    ]),
              ),
              const SizedBox(
                height: 27,
              ),
              Text(
                '€${User.demoUser.getAssetValue}',
                style: AppTextStyles.ocrTextStyle()
                    .copyWith(
                    color: Colors.white,
                    fontSize: 28),
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
    );
  }
}
