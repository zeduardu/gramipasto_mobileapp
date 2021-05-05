import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gramipasto_mobileapp/core/core.dart';

class ScreenButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;
  final VoidCallback onTap;

  ScreenButtonWidget(
      {Key? key,
      required this.label,
      required this.backgroundColor,
      required this.fontColor,
      required this.borderColor,
      required this.onTap})
      : super(key: key);

  ScreenButtonWidget.white({required String label, required VoidCallback onTap})
      : this.backgroundColor = AppColors.white,
        this.fontColor = AppColors.viking,
        this.borderColor = AppColors.viking,
        this.label = label,
        this.onTap = onTap;

  ScreenButtonWidget.viking(
      {required String label, required VoidCallback onTap})
      : this.backgroundColor = AppColors.viking,
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.white,
        this.label = label,
        this.onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: MediaQuery.of(context).size.width * .85,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(this.backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(65),
              side: BorderSide(
                color: this.borderColor,
                width: 2,
              ),
            ),
          ),
        ),
        child: Text(this.label, style: GoogleFonts.notoSans(
          fontWeight: FontWeight.normal,
          fontSize: 24,
          color: this.fontColor
        ),),
        onPressed: this.onTap,
      ),
    );
  }
}
