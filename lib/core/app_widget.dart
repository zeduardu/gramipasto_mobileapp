import 'package:flutter/material.dart';
import 'package:gramipasto_mobileapp/screens/search/search_screen.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gramipasto",
      home: SearchScreen(),
    );
  }
}
