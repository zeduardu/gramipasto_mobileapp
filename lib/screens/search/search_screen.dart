import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gramipasto_mobileapp/controllers/GramineaController.dart';
import 'package:gramipasto_mobileapp/core/app_colors.dart';
import 'package:gramipasto_mobileapp/screens/search/widgets/graminea_card/gaminea_card_widget.dart';
import 'package:gramipasto_mobileapp/shared/widgets/app_bar_search/app_bar_search_widget.dart';
import 'package:gramipasto_mobileapp/utils/app_state.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final controller = GramineaController();
  String searchTerm = "";

  @override
  void initState() {
    super.initState();
    controller.getGramineas();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == AppState.success) {
      return Scaffold(
        appBar: AppBarSearchWidget(onChanged: (String value) {
          setState(() {            
            this.searchTerm = value;
          });
        }),
        body: Padding(
          padding: EdgeInsets.only(top: 15, right: 10, left: 10),
          child: ListView.builder(
            itemCount:
                controller.getGramineasBySearchTerm(this.searchTerm).length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: GramineaCardWidget(
                  graminea: controller.getGramineasBySearchTerm(this.searchTerm)[index],
                ),
              );
            },
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.jaggedIce),
          ),
        ),
      );
    }
  }
}
