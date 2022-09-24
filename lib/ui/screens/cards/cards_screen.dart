import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../utils/app_text_styles.dart';
import '../../widgets/bottom_nav.dart';
import 'cards_model.dart';

class CardScreen extends StatelessWidget {
    const CardScreen ({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return ViewModelBuilder<CardScreenModel>.reactive(
          builder: (context, model, child) => Scaffold(
              body: BottomNavBar(
                parent: NavIdentifier.card,
                child: Column(
                  children: [
                    SizedBox(height: 60,),
                    Text('cards screen', style: AppTextStyles.largeTitleBold(),),
                  ],
                ),
              )),
          viewModelBuilder: () => CardScreenModel()
         );
       }
      }