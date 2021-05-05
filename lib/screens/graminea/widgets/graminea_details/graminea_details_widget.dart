import 'package:flutter/material.dart';
import 'package:gramipasto_mobileapp/controllers/GramineaController.dart';
import 'package:gramipasto_mobileapp/core/core.dart';
import 'package:gramipasto_mobileapp/models/Graminea.dart';
import 'package:gramipasto_mobileapp/screens/graminea/widgets/mini_card/mini_card_widget.dart';

class GramineaDetailsWidget extends StatelessWidget {
  final controller = GramineaController();
  final Graminea graminea;

  GramineaDetailsWidget({Key? key, required this.graminea}) : super(key: key);

  String get _exigenciaFertilidade =>
      controller.getLevel(this.graminea.exigenciaFertilidade);

  String get _toleranciaAlagamento =>
      this.graminea.toleranciaAlagamento ? 'Sim' : 'Não';

  String get _toleranciaSeca =>
      controller.getLevel(this.graminea.toleranciaSeca);

  String get _toleranciaFrio =>
      controller.getLevel(this.graminea.toleranciaFrio);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30, top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            this.graminea.nomeComum,
            style: AppTextStyles.titleBold,
          ),
          Text(
            this.graminea.nomeCientifico,
            style: AppTextStyles.subTitle,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  MiniCardWidget(value: this.graminea.origem),
                  MiniCardWidget(value: this.graminea.genero),
                  MiniCardWidget(value: '${this.graminea.precipiticaoMinima} mm'),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Exigência de fertilidade:',
                    style: AppTextStyles.heading15,
                  ),
                  Text(
                    this._exigenciaFertilidade,
                    style: AppTextStyles.body15,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tolerância ao alagamento:',
                    style: AppTextStyles.heading15,
                  ),
                  Text(
                    this._toleranciaAlagamento,
                    style: AppTextStyles.body15,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tolerância a seca:',
                    style: AppTextStyles.heading15,
                  ),
                  Text(
                    this._toleranciaSeca,
                    style: AppTextStyles.body15,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tolerância ao frio:',
                    style: AppTextStyles.heading15,
                  ),
                  Text(
                    this._toleranciaFrio,
                    style: AppTextStyles.body15,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
