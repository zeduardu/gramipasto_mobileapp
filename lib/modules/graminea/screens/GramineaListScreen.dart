import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:gramipasto_mobileapp/modules/graminea/models/Graminea.dart';
import 'package:gramipasto_mobileapp/services/GramineaService.dart';
import 'package:gramipasto_mobileapp/widgets/GramineaListWidget.dart';

class GramineaMenuScreen extends StatelessWidget {
  final gramineaService = GramineaService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: <Widget>[
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
                height: 200,
                width: constraints.maxWidth,
                color: Colors.greenAccent,
                child: Center(
                  child: Text("Gramipasto"),
                )),
          ),
          Container(
            width: constraints.maxWidth,
            height: 5,
          ),
          Expanded(
            child: FutureBuilder<List<Graminea>>(
                future: gramineaService.fetchGramineas(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? GramineaListWidget(gramineas: snapshot.data)
                      : Center(child: CircularProgressIndicator());
                }),
          )
        ],
      );
    }));
  }
}
