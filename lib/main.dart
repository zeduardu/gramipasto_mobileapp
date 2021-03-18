import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:gramipasto_mobileapp/services/GramineaService.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {

  final GramineaService gramineaService;

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
            height: 30,
          ),
          FutureBuilder(
            future: ,
            builder: builder
          )
        ],
      );
    }));
  }
}
