import 'package:flutter/material.dart';
import 'package:heir/ui/screens/statistics/statistics_model.dart';
import 'package:stacked/stacked.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../widgets/bottom_nav.dart';

import 'components/asset_section.dart';
import 'components/asset_statistics.dart';
import 'components/transaction_section.dart';
import 'components/transaction_statistics.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StatisticsScreenModel>.reactive(
        builder: (context, model, child) => Scaffold(
                body: BottomNavBar(
              parent: NavIdentifier.statistics,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 415,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(32),
                              bottomLeft: Radius.circular(32)),
                          gradient: LinearGradient(
                              colors: [Color(0xff5887D1), Color(0xffD5C7FF)],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft)),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 60,
                          ),
                          _AssetTransactionToggler(model: model),
                          const SizedBox(
                            height: 32,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Visibility(
                                visible: model.assetActive,
                                replacement: TransactionStatistics(model: model,),
                                child: AssetStatistics(
                                  model: model,
                                )),
                          )
                        ],
                      ),
                    ),
                    Visibility(
                      visible: model.assetActive,
                      replacement: const TransactionSection(),
                      child: const AssetSection(),
                    )
                  ],
                ),
              ),
            )),
        viewModelBuilder: () => StatisticsScreenModel());
  }
}

class _AssetTransactionToggler extends StatelessWidget {
  const _AssetTransactionToggler({Key? key, required this.model})
      : super(key: key);
  final StatisticsScreenModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.primaryColor4,
          borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              model.toggleAssetTransaction(true);
            },
            child: Container(
              width: 102,
              height: 27,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: model.assetActive
                    ? const LinearGradient(
                        colors: [Color(0xff5887D1), Color(0xffD5C7FF)],
                        transform: GradientRotation(99.77),
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)
                    : null,
              ),
              child: Center(
                child: Text(
                  'Assets',
                  style: AppTextStyles.headlineMedium().copyWith(
                      color: model.assetActive
                          ? Colors.white
                          : AppColors.tertiaryColor2),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              model.toggleAssetTransaction(false);
            },
            child: Container(
              width: 102,
              height: 27,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: !(model.assetActive)
                    ? const LinearGradient(
                        colors: [Color(0xff5887D1), Color(0xffD5C7FF)],
                        transform: GradientRotation(99.77),
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)
                    : null,
              ),
              child: Center(
                child: Text('Transactions',
                    style: AppTextStyles.headlineMedium().copyWith(
                        color: !(model.assetActive)
                            ? Colors.white
                            : AppColors.tertiaryColor2)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
