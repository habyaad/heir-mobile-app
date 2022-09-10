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
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../ui/screens/cards/cards_screen.dart' as _i2;
import '../../ui/screens/home/home_screen.dart' as _i1;
import '../../ui/screens/settings/settings_screen.dart' as _i4;
import '../../ui/screens/statistics/statistics_screen.dart' as _i3;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomeScreen());
    },
    CardRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.CardScreen());
    },
    StatisticsRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.StatisticsScreen());
    },
    SettingsRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SettingsScreen());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(HomeRoute.name, path: '/'),
        _i5.RouteConfig(CardRoute.name, path: '/card-screen'),
        _i5.RouteConfig(StatisticsRoute.name, path: '/statistics-screen'),
        _i5.RouteConfig(SettingsRoute.name, path: '/settings-screen')
      ];
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.CardScreen]
class CardRoute extends _i5.PageRouteInfo<void> {
  const CardRoute() : super(CardRoute.name, path: '/card-screen');

  static const String name = 'CardRoute';
}

/// generated route for
/// [_i3.StatisticsScreen]
class StatisticsRoute extends _i5.PageRouteInfo<void> {
  const StatisticsRoute()
      : super(StatisticsRoute.name, path: '/statistics-screen');

  static const String name = 'StatisticsRoute';
}

/// generated route for
/// [_i4.SettingsScreen]
class SettingsRoute extends _i5.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '/settings-screen');

  static const String name = 'SettingsRoute';
}
