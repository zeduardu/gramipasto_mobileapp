import 'package:flutter/material.dart';
import 'package:gramipasto_mobileapp/modules/graminea/screens/GramineaMenuScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: GramineaMenuScreen(),
      ),
    );
  }
}
