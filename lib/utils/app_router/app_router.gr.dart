// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../../ui/screens/cards/cards_screen.dart' as _i2;
import '../../ui/screens/home/home_screen.dart' as _i1;
import '../../ui/screens/settings/components/beneficiaries/beneficiaries_screen.dart' as _i5;
import '../../ui/screens/settings/settings_screen.dart' as _i4;
import '../../ui/screens/statistics/statistics_screen.dart' as _i3;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
      );
    },
    CardRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.CardScreen(),
      );
    },
    StatisticsRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.StatisticsScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.SettingsScreen(),
      );
    },
    BeneficiariesRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.BeneficiariesScreen(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          HomeRoute.name,
          path: '/',
        ),
        _i6.RouteConfig(
          CardRoute.name,
          path: '/card-screen',
        ),
        _i6.RouteConfig(
          StatisticsRoute.name,
          path: '/statistics-screen',
        ),
        _i6.RouteConfig(
          SettingsRoute.name,
          path: '/settings-screen',
        ),
        _i6.RouteConfig(
          BeneficiariesRoute.name,
          path: '/beneficiaries-screen',
        ),
      ];
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.CardScreen]
class CardRoute extends _i6.PageRouteInfo<void> {
  const CardRoute()
      : super(
          CardRoute.name,
          path: '/card-screen',
        );

  static const String name = 'CardRoute';
}

/// generated route for
/// [_i3.StatisticsScreen]
class StatisticsRoute extends _i6.PageRouteInfo<void> {
  const StatisticsRoute()
      : super(
          StatisticsRoute.name,
          path: '/statistics-screen',
        );

  static const String name = 'StatisticsRoute';
}

/// generated route for
/// [_i4.SettingsScreen]
class SettingsRoute extends _i6.PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: '/settings-screen',
        );

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i5.BeneficiariesScreen]
class BeneficiariesRoute extends _i6.PageRouteInfo<void> {
  const BeneficiariesRoute()
      : super(
          BeneficiariesRoute.name,
          path: '/beneficiaries-screen',
        );

  static const String name = 'BeneficiariesRoute';
}
