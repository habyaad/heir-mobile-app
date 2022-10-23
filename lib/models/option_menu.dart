import 'package:flutter/material.dart';

import '../heir_app_icons_icons.dart';

class Menu {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final String? routeName;

  Menu(this.icon, this.color, this.title, this.subtitle, {this.routeName});

  static Menu notification = Menu(HeirAppIcons.notifications_none_24px,
      const Color(0xffEFF8E9), 'Notifications', 'Set your Inheritance Trigger',
      routeName: null);
  static Menu beneficiaries = Menu(
      HeirAppIcons.beneficiary,
      const Color(0xffE5F8FF),
      'Beneficiaries',
      'Manage the beneficiaries to your assets',
      routeName: 'beneficiaries-screen');
  static Menu assets = Menu(HeirAppIcons.diamond, const Color(0xffD5C7FF),
      'Assets', 'Manage your linked digital assets',
      routeName: null);
  static Menu vaults = Menu(HeirAppIcons.finances1_27, const Color(0xffFFF3D3),
      'Vaults', 'Secure your most valuable Assets',
      routeName: null);
  static Menu security = Menu(HeirAppIcons.shield, const Color(0xffFEF1EE),
      'Security', 'Further secure your account and funds',
      routeName: null);
  static Menu help = Menu(
      HeirAppIcons.fi_rr_comment_alt,
      const Color(0xffE4F9F6),
      'Help and Support',
      'Get support or Send feedback',
      routeName: null);

//beneficiaries
}
