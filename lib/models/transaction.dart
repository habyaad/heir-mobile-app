import 'package:flutter/cupertino.dart';
import 'package:money_formatter/money_formatter.dart';

import '../heir_app_icons_icons.dart';

enum TransactionType { credit, debit }

class Transaction {
  final String name;
  final DateTime dateTime;
  final TransactionType transactionType;
  final double transactionAmount;
  final List<Color> gradientColors;
  final List<Color> solidColor;

  List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  String get getTransactionAmount => MoneyFormatter(
          amount: transactionAmount,
          settings: MoneyFormatterSettings(symbol: '€', fractionDigits: 0))
      .output
      .symbolOnLeft;

  String get getMeridian => dateTime.hour < 12 ? 'am' : 'pm';

  String get getMonth => months[dateTime.month-1];

  Transaction(
      {required this.name,
      required this.dateTime,
      required this.transactionType,
      required this.gradientColors,
      required this.solidColor,
      required this.transactionAmount});
}
