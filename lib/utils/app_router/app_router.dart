import '../../ui/screens/cards/cards_screen.dart';
import '../../ui/screens/home/home_screen.dart';
import '../../ui/screens/settings/settings_screen.dart';
import '../../ui/screens/statistics/statistics_screen.dart';
import 'package:auto_route/annotations.dart';


@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomeScreen, initial: true),
    AutoRoute(page: CardScreen),
    AutoRoute(page: StatisticsScreen),
    AutoRoute(page: SettingsScreen),
  ],
)
class $AppRouter {}
