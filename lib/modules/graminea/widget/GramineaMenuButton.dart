import 'package:flutter/material.dart';

class GramineaMenuButton extends StatelessWidget {
  final IconData icon;
  final String text;
  void Function() onPressed;

  GramineaMenuButton({Key key, this.icon, this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ElevatedButton(
        onPressed: this.onPressed,
        style:
            ElevatedButton.styleFrom(primary: Color.fromRGBO(18, 154, 200, 1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              this.icon,
              size: size.shortestSide * 0.20,
            ),
            Text(text),
          ],
        ));
  }
}
