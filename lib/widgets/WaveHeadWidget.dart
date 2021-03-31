import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class WaveHeadWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipPath(
        clipper: WaveClipperTwo(),
        child: Container(
          height: 180,
          width: constraint.maxWidth,
          color: Color.fromRGBO(98, 141, 101, 1),
          child: Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/img/logo_marca.png',
                    fit: BoxFit.fitWidth,
                    width: constraint.maxWidth * 0.50,
                  ),
                ],
              )),
        ),
      );
    });
  }
}
