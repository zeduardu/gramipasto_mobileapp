import 'package:flutter/material.dart';

class GramineaImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.30,
      width: MediaQuery.of(context).size.width,
      child: Image.network(
        'https://www.pggwrightsonseeds.com.au/Files/Images/SeedsAU/ProductImages/guinea-grass-landing-page-400x400.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
