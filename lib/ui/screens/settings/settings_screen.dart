import 'package:flutter/material.dart';
import 'package:heir/ui/screens/settings/settings_model.dart';
import 'package:stacked/stacked.dart';

import '../../../utils/app_text_styles.dart';
import '../../widgets/bottom_nav.dart';
      
class SettingsScreen extends StatelessWidget {
    const SettingsScreen ({Key? key}) : super(key: key);
      
    @override
    Widget build(BuildContext context) {
        return ViewModelBuilder<SettingsScreenModel>.reactive(
          builder: (context, model, child) => Scaffold(
              body: BottomNavBar(
                parent: NavIdentifier.settings,
                child: Column(
                  children: [
                    SizedBox(height: 60,),
                    Text('settings screen', style: AppTextStyles.largeTitleBold(),),
                  ],
                ),
              )),
          viewModelBuilder: () => SettingsScreenModel()
         );
       }
      }