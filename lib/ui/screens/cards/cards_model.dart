import 'dart:ui';

import 'package:heir/utils/app_colors.dart';
import 'package:stacked/stacked.dart';

import '../../../heir_app_icons_icons.dart';
import '../../../models/transaction.dart';
import '../../widgets/action_button.dart';

class CardScreenModel extends BaseViewModel {
  List buttons = [
    const ActionButtons(icon: HeirAppIcons.paper_plane, actionText: 'Transfer'),
    const ActionButtons(icon: HeirAppIcons.finances, actionText: 'Bills'),
    const ActionButtons(
        icon: HeirAppIcons.iconoir_scan_qr_code, actionText: 'QR Scan'),
  ];
  List<Transaction> transactions = [transaction1, transaction2, transaction3];
  static Transaction transaction1 = Transaction(
      name: 'Olawale Murphy',
      transactionAmount: 76000,
      dateTime: DateTime.utc(2022, 03, 23, 12, 23),
      transactionType: TransactionType.debit,
      gradientColors: [
        const Color(0xffFBFCFC).withOpacity(1),
        const Color(0xffFFFFFF).withOpacity(.1),
      ],
      solidColor: [
        const Color(0xffD5C7FF),
        const Color(0xffD5C7FF)
      ]);

  static Transaction transaction2 = Transaction(
      name: 'Shopping',
      transactionAmount: 82000,
      dateTime: DateTime.utc(2022, 03, 22, 13, 41),
      transactionType: TransactionType.debit,
      gradientColors: [
        const Color(0xffFBFCFC),
        const Color(0xffFFFFFF).withOpacity(.1),
      ],
      solidColor: [
        AppColors.secondaryColor1,
        AppColors.secondaryColor1
      ]);

  static Transaction transaction3 = Transaction(
      name: 'Kayode Bello',
      transactionAmount: 2000,
      dateTime: DateTime.utc(2022, 03, 21, 07, 35),
      transactionType: TransactionType.debit,
      gradientColors: [
        const Color(0xffFBFCFC),
        const Color(0xffFFFFFF).withOpacity(.1),
      ],
      solidColor: [
        const Color(0xffFEF1EE),
        const Color(0xffFEF1EE)
      ]);
}
