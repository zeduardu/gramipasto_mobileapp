import 'package:flutter/material.dart';
import 'package:gramipasto_mobileapp/core/core.dart';
import 'package:gramipasto_mobileapp/models/Graminea.dart';
import 'package:gramipasto_mobileapp/screens/graminea/graminea_screen.dart';

class GramineaCardWidget extends StatelessWidget {
  final Graminea graminea;

  GramineaCardWidget({Key? key, required this.graminea}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.border),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Image.asset(
                      AppImages.grass,
                      height: 64,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: 1,
                        height: 80,
                        color: AppColors.lightGrey,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            this.graminea.nomeComum,
                            style: AppTextStyles.heading,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            this.graminea.nomeCientifico,
                            style: AppTextStyles.body,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                child: Text('Ver'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GramineaScreen(graminea: this.graminea,),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
