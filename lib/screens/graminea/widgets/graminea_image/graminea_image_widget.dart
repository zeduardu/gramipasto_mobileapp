import 'package:flutter/material.dart';

class GramineaImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);

    return Container(
      height: 256,
      width: media.size.width,
      child: Image.network(
        'https://www.pggwrightsonseeds.com.au/Files/Images/SeedsAU/ProductImages/guinea-grass-landing-page-400x400.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
