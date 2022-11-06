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
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../../models/user.dart' as _i9;
import '../../ui/screens/cards/cards_screen.dart' as _i2;
import '../../ui/screens/home/home_screen.dart' as _i1;
import '../../ui/screens/settings/components/beneficiaries/beneficiaries_screen.dart'
    as _i5;
import '../../ui/screens/settings/components/beneficiaries/beneficiary_screen.dart'
    as _i6;
import '../../ui/screens/settings/settings_screen.dart' as _i4;
import '../../ui/screens/statistics/statistics_screen.dart' as _i3;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
      );
    },
    CardRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.CardScreen(),
      );
    },
    StatisticsRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.StatisticsScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.SettingsScreen(),
      );
    },
    BeneficiariesRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.BeneficiariesScreen(),
      );
    },
    BeneficiaryRoute.name: (routeData) {
      final args = routeData.argsAs<BeneficiaryRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.BeneficiaryScreen(
          key: args.key,
          beneficiary: args.beneficiary,
        ),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          HomeRoute.name,
          path: '/',
        ),
        _i7.RouteConfig(
          CardRoute.name,
          path: '/card-screen',
        ),
        _i7.RouteConfig(
          StatisticsRoute.name,
          path: '/statistics-screen',
        ),
        _i7.RouteConfig(
          SettingsRoute.name,
          path: '/settings-screen',
        ),
        _i7.RouteConfig(
          BeneficiariesRoute.name,
          path: '/beneficiaries-screen',
        ),
        _i7.RouteConfig(
          BeneficiaryRoute.name,
          path: '/beneficiary-screen',
        ),
      ];
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.CardScreen]
class CardRoute extends _i7.PageRouteInfo<void> {
  const CardRoute()
      : super(
          CardRoute.name,
          path: '/card-screen',
        );

  static const String name = 'CardRoute';
}

/// generated route for
/// [_i3.StatisticsScreen]
class StatisticsRoute extends _i7.PageRouteInfo<void> {
  const StatisticsRoute()
      : super(
          StatisticsRoute.name,
          path: '/statistics-screen',
        );

  static const String name = 'StatisticsRoute';
}

/// generated route for
/// [_i4.SettingsScreen]
class SettingsRoute extends _i7.PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: '/settings-screen',
        );

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i5.BeneficiariesScreen]
class BeneficiariesRoute extends _i7.PageRouteInfo<void> {
  const BeneficiariesRoute()
      : super(
          BeneficiariesRoute.name,
          path: '/beneficiaries-screen',
        );

  static const String name = 'BeneficiariesRoute';
}

/// generated route for
/// [_i6.BeneficiaryScreen]
class BeneficiaryRoute extends _i7.PageRouteInfo<BeneficiaryRouteArgs> {
  BeneficiaryRoute({
    _i8.Key? key,
    required _i9.User beneficiary,
  }) : super(
          BeneficiaryRoute.name,
          path: '/beneficiary-screen',
          args: BeneficiaryRouteArgs(
            key: key,
            beneficiary: beneficiary,
          ),
        );

  static const String name = 'BeneficiaryRoute';
}

class BeneficiaryRouteArgs {
  const BeneficiaryRouteArgs({
    this.key,
    required this.beneficiary,
  });

  final _i8.Key? key;

  final _i9.User beneficiary;

  @override
  String toString() {
    return 'BeneficiaryRouteArgs{key: $key, beneficiary: $beneficiary}';
  }
}
