import 'package:flutter/material.dart';
import 'package:gramipasto_mobileapp/models/Graminea.dart';

import 'package:gramipasto_mobileapp/screens/graminea/widgets/app_bar/app_bar_widget.dart';
import 'package:gramipasto_mobileapp/screens/graminea/widgets/graminea_details/graminea_details_widget.dart';
import 'package:gramipasto_mobileapp/screens/graminea/widgets/graminea_image/graminea_image_widget.dart';

class GramineaScreen extends StatelessWidget {
  final Graminea graminea;

  const GramineaScreen({Key? key, required this.graminea}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GramineaImageWidget(),
          Expanded(
            child: GramineaDetailsWidget(graminea: this.graminea),
          ),
        ],
      ),
    );
  }
}
