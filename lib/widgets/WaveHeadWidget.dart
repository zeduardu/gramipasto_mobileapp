import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class WaveHeadWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipPath(
        clipper: WaveClipperTwo(),
        child: Container(
            height: 200,
            width: constraint.maxWidth,
            color: Colors.greenAccent,
            child: Center(
              child: Text("Gramipasto"),
            )),
      );
    });
  }
}
