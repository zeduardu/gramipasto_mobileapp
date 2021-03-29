import 'package:flutter/material.dart';

class GramineaMenuButton extends StatelessWidget {
  final IconData icon;
  final String text;

  GramineaMenuButton({Key key, this.icon, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ElevatedButton(
        onPressed: () {},
        child: Column(
          children: <Widget>[
            Icon(
              this.icon,
              size: size.shortestSide / 0.05,
            ),
            Text(this.text),
          ],
        ));
  }
}
