import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../app_colors.dart';

ButtonStyle appButtonStyle = ButtonStyle(
    elevation: MaterialStateProperty.all(0),
    backgroundColor: MaterialStateProperty.resolveWith(
      (states) {
        return AppColors.background;
      },
    ),
    foregroundColor: MaterialStateProperty.resolveWith(
      (states) {
        return AppColors.textDark;
      },
    ),
    overlayColor: MaterialStateProperty.resolveWith(
      (states) {
        return AppColors.border;
      },
    ),
    padding: MaterialStateProperty.all(EdgeInsets.zero),

    shadowColor: MaterialStateProperty.all(Colors.transparent),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
    ));