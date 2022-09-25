import 'package:flutter/cupertino.dart';
import 'package:money_formatter/money_formatter.dart';

import '../heir_app_icons_icons.dart';

enum Category { Crypto, Bank }
class Asset {
  final String assetName;
  final Category assetCategory;
  final double assetAmount;
  final IconData assetIcon;

  static List<Asset>  demoAssets = [Asset.bitcoin, Asset.ethereum, Asset.kuda];

  String get getAssetAmount => MoneyFormatter(
          amount: assetAmount, settings: MoneyFormatterSettings(symbol: '€'))
      .output
      .symbolOnLeft;

  Asset(
      {required this.assetName,
      required this.assetCategory,
      required this.assetAmount,
      required this.assetIcon});

  static Asset bitcoin = Asset(
      assetName: 'BitCoin',
      assetAmount: 5876242.12,
      assetCategory: Category.Crypto,
      assetIcon: HeirAppIcons.btc_icon);
  static Asset ethereum = Asset(
      assetName: 'Ethereum',
      assetAmount: 2390001.83,
      assetCategory: Category.Crypto,
      assetIcon: HeirAppIcons.eth_icon);
  static Asset kuda = Asset(
      assetName: 'Kuda Bank',
      assetAmount: 1520000,
      assetCategory: Category.Bank,
      assetIcon: HeirAppIcons.bank);
}
