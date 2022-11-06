import 'package:stacked/stacked.dart';

class HomeScreenModel extends BaseViewModel {
  bool amountIsVisible = false;
  String obscureText = "******";

  switchVisibility(){
    amountIsVisible = !amountIsVisible;
    notifyListeners();
  }
}