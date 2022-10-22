import 'dart:ui';

import 'package:stacked/stacked.dart';

class StatisticsScreenModel extends BaseViewModel {
  int activeIndex = 1;

  makeActive(int index) {
    activeIndex = index;
    notifyListeners();
  }

  bool assetActive = true;
  List<Stats> stats = [Stats.stat1, Stats.stat2, Stats.stat3, Stats.stat4];

  toggleAssetTransaction(bool toggle) {
    assetActive = toggle;
    notifyListeners();
  }
}

class Stats {
  final double degree;
  final Color color;

  Stats(this.degree, this.color);

  static Stats stat1 = Stats(49.68, const Color(0xffD5C7FF));
  static Stats stat2 = Stats(67.68, const Color(0xffFFF3D3));
  static Stats stat3 = Stats(102.96, const Color(0xffFEF1EE));
  static Stats stat4 = Stats(139.68, const Color(0xffE5F8FF));
}
