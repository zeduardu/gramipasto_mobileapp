import 'package:flutter/material.dart';

import 'package:gramipasto_mobileapp/controllers/GramineaController.dart';
import 'package:gramipasto_mobileapp/core/core.dart';

class GramineaScreen extends StatelessWidget {
  final controller = GramineaController();
  final int id;

  GramineaScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
            ],
          ),
        ),
      ),
      body: Center(
        child: Text(
          this.id.toString(),
          style: AppTextStyles.heading,
        ),
      ),
    );
  }
}
