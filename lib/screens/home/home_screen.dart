import 'package:flutter/material.dart';
import 'package:gramipasto_mobileapp/screens/home/widgets/screen_button/screen_button_widget.dart';
import 'package:gramipasto_mobileapp/screens/search/search_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/images/background.jpg",
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment(0, -0.50),
            child: Image.asset("assets/images/marca.png"),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ScreenButtonWidget.white(
                  label: 'Pesquisar',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ScreenButtonWidget.viking(
                  label: 'Atualizar',
                  onTap: () {},
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
