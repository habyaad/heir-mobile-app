import 'package:flutter/material.dart';
import 'package:heir/ui/screens/settings/settings_model.dart';
import 'package:stacked/stacked.dart';
      
class SettingsScreen extends StatelessWidget {
    const SettingsScreen ({Key? key}) : super(key: key);
      
    @override
    Widget build(BuildContext context) {
        return ViewModelBuilder<SettingsScreenModel>.reactive(
          builder: (context, model, child) => const Scaffold(
            body: Center(
              child: Text('Settings screen'),
            ),
          ),
          viewModelBuilder: () => SettingsScreenModel()
         );
       }
      }