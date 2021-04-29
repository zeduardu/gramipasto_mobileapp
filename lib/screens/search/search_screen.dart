import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gramipasto_mobileapp/controllers/GramineaController.dart';
import 'package:gramipasto_mobileapp/screens/search/widgets/graminea_card/gaminea_card_widget.dart';
import 'package:gramipasto_mobileapp/screens/search/widgets/search_term/search_term_widget.dart';
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
        appBar: AppBar(
          title: Text("Pesquisa de gramínea"),
          backgroundColor: Color.fromRGBO(18, 154, 200, 1),
        ),
        body: Column(
          children: <Widget>[
            SearchTermWidget(
              onChanged: (value) {
                setState(() {
                  this.searchTerm = value;
                });
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount:
                    controller.getGramineasBySearchTerm(this.searchTerm).length,
                itemBuilder: (context, index) {
                  return GramineaCardWidget(
                    commonName: controller
                        .getGramineasBySearchTerm(this.searchTerm)[index]
                        .nomeComum,
                    scientificName: controller
                        .getGramineasBySearchTerm(this.searchTerm)[index]
                        .nomeCientifico,
                  );
                },
              ),
            )
          ],
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
