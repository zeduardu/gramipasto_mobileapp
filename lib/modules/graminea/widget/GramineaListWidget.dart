import 'package:flutter/material.dart';
import 'package:gramipasto_mobileapp/modules/graminea/models/Graminea.dart';

class GramineaListWidget extends StatelessWidget {
  final List<Graminea> gramineas;

  GramineaListWidget({Key key, this.gramineas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      //shrinkWrap: true,
      itemCount: gramineas.length,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.album),
                title: Text(gramineas[index].nomeComum),
                subtitle: Text(gramineas[index].nomeCientifico),
              )
            ],
          ),
        );
      },
    );
  }
}
