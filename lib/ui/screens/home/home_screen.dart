import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../utils/app_router/app_router.gr.dart';
import '../../../utils/app_text_styles.dart';
import '../../widgets/bottom_nav.dart';
import 'home_screen_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenModel>.reactive(
        builder: (context, model, child) => Scaffold(
                body: BottomNavBar(
                  parent: NavIdentifier.home,
              child: Column(
                children: [
                  SizedBox(height: 60,),
                  Text('home screen', style: AppTextStyles.largeTitleBold(),),
                ],
              ),
            )),
        viewModelBuilder: () => HomeScreenModel());
  }
}
