import 'package:flutter/material.dart';
import 'package:gramipasto_mobileapp/models/Graminea.dart';

class GramineaListWidget extends StatelessWidget {
  final List<Graminea> gramineas;

  GramineaListWidget({Key key, this.gramineas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[],) GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: gramineas.length,
      itemBuilder: (context, index) {
        return Container(
          child: Text(
            gramineas[index].nomeComum,
            style: TextStyle(color: Colors.black),
          ),
          height: 200,
          width: 200,
          color: Colors.blueAccent,
        );
      },
    );
  }
}
