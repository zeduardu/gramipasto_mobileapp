import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gramipasto_mobileapp/modules/graminea/screens/GramineaSearchScreen.dart';
import 'package:gramipasto_mobileapp/modules/graminea/widget/GramineaMenuButton.dart';
import 'package:gramipasto_mobileapp/services/GramineaService.dart';
import 'package:gramipasto_mobileapp/widgets/WaveHeadWidget.dart';
import 'package:gramipasto_mobileapp/utils/ui/appDialogs.dart';

class GramineaMenuScreen extends StatelessWidget {
  final gramineaService = GramineaService();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        WaveHeadWidget(),
        Expanded(
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              GramineaMenuButton(
                icon: Icons.search,
                text: 'Pesquisar gramínea',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GramineaSearchScreen(),
                      ));
                },
              ),
              GramineaMenuButton(
                icon: Icons.list,
                text: 'Listar gramíneas',
              ),
              GramineaMenuButton(
                icon: Icons.update,
                text: 'Atualizar lista de gramíneas',
                onPressed: () {
                  try {
                    gramineaService.updateJsonFile();
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
