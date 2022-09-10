import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'cards_model.dart';

class CardScreen extends StatelessWidget {
    const CardScreen ({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return ViewModelBuilder<CardScreenModel>.reactive(
          builder: (context, model, child) => Scaffold(),
          viewModelBuilder: () => CardScreenModel()
         );
       }
      }