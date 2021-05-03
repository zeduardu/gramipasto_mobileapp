import 'package:flutter/material.dart';
import 'package:gramipasto_mobileapp/core/core.dart';

class MiniCardWidget extends StatelessWidget {
  final String value;

  const MiniCardWidget({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.border,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                this.value,
                style: AppTextStyles.body11,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
