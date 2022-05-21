import 'package:camp_app/styles/app_colors.dart';
import 'package:flutter/material.dart';

class Award extends StatelessWidget {
  const Award({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 16,
          )
        ],
        color: AppColors.background,
        borderRadius: const BorderRadius.all(Radius.circular(36)),
        border: Border.all(color: AppColors.border, width: 2),
      ),
    );
  }
}
