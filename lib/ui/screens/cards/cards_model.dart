import 'package:stacked/stacked.dart';

import '../../../heir_app_icons_icons.dart';
import '../../widgets/action_button.dart';

class CardScreenModel extends BaseViewModel {
  List buttons = [
    const ActionButtons(
        icon: HeirAppIcons.paper_plane,
        actionText: 'Transfer'),
    const ActionButtons(
        icon: HeirAppIcons.finances,
        actionText: 'Bills'),
    const ActionButtons(
        icon: HeirAppIcons.iconoir_scan_qr_code,
        actionText: 'QR Scan'),
  ];

}