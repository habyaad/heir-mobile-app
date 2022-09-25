import 'package:money_formatter/money_formatter.dart';

class User {
  final String name;
  final double assetValue;
  final double cardBalance;


  String get getAssetValue =>
      MoneyFormatter(
        amount: assetValue,)
          .output
          .nonSymbol;

  String get getCardBalance =>
      MoneyFormatter(
        amount: cardBalance,)
          .output
          .nonSymbol;

  // TODO: the naira symbol would be added to the money formatter

  String get getTotalWorth =>
      MoneyFormatter(
        amount: assetValue + cardBalance,)
          .output
          .nonSymbol;

  User({required this.name,
    required this.assetValue,
    required this.cardBalance,
  });

  static User demoUser =
  User(name: 'Olanrewaju',
    assetValue: 12076065.78,
    cardBalance: 3511400,
  );
}
