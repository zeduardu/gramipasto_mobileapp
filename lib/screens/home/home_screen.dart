import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gramipasto_mobileapp/controllers/GramineaController.dart';
import 'package:gramipasto_mobileapp/screens/home/widgets/screen_button/screen_button_widget.dart';
import 'package:gramipasto_mobileapp/screens/search/search_screen.dart';
import 'package:gramipasto_mobileapp/utils/ui/app_dialogs.dart';

class HomeScreen extends StatelessWidget {
  final controller = GramineaController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              ScreenButtonWidget(
                icon: Icons.search,
                text: 'Pesquisar gramínea',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(),
                      ));
                },
              ),
              ScreenButtonWidget(
                icon: Icons.list,
                text: 'Cálculo...',
              ),
              ScreenButtonWidget(
                icon: Icons.update,
                text: 'Atualizar lista de gramíneas',
                onPressed: () {
                  try {
                    controller.upateGramineaListFile();
                    showInformationDialog(
                        context, 'Informação', 'Deu tudo certo!');
                  } catch (e) {
                    showInformationDialog(context, 'Erro', e.toString());
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
