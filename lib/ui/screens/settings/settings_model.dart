import 'package:stacked/stacked.dart';
import '../../../models/option_menu.dart';

class SettingsScreenModel extends BaseViewModel {
  List<Menu> menuList = [
    Menu.notification,
    Menu.beneficiaries,
    Menu.assets,
    Menu.vaults,
    Menu.security,
    Menu.help
  ];
}