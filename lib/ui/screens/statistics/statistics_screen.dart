import 'package:flutter/material.dart';
import 'package:heir/ui/screens/statistics/statistics_model.dart';
import 'package:stacked/stacked.dart';

import '../../../utils/app_text_styles.dart';
import '../../widgets/bottom_nav.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StatisticsScreenModel>.reactive(
        builder: (context, model, child) => Scaffold(
            body: BottomNavBar(
              parent: NavIdentifier.statistics,
              child: Column(
                children: [
                  SizedBox(height: 60,),
                  Text('statistics screen', style: AppTextStyles.largeTitleBold(),),
                ],
              ),
            )),
        viewModelBuilder: () => StatisticsScreenModel()
    );
  }
}