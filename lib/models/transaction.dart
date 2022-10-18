import 'package:flutter/cupertino.dart';
import 'package:money_formatter/money_formatter.dart';

import '../heir_app_icons_icons.dart';

enum TransactionType{credit, debit}

class Transaction {
  final String name;
  final DateTime dateTime;
  final TransactionType transactionType;
  final double transactionAmount;


  String get getTransactionAmount =>
      MoneyFormatter(
          amount: transactionAmount,
          settings: MoneyFormatterSettings(symbol: '€', fractionDigits: 0))
          .output
          .symbolOnLeft;
  String get getMeridian => dateTime.hour < 12? 'am': 'pm';

  Transaction({required this.name,
    required this.dateTime,
    required this.transactionType,
    required this.transactionAmount});
}