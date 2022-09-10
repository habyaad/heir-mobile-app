import 'package:flutter/material.dart';
import 'package:heir/ui/screens/statistics/statistics_model.dart';
import 'package:stacked/stacked.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StatisticsScreenModel>.reactive(
        builder: (context, model, child) => Scaffold(),
        viewModelBuilder: () => StatisticsScreenModel()
    );
  }
}