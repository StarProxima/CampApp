import 'package:flutter/material.dart';
import 'app_colors.dart';

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
        // if (states.contains(MaterialState.selected)) {
        //   return AppColors.highlight;
        // } else if (states.contains(MaterialState.disabled)) {
        //   return AppColors.highlight;
        // } else if (states.contains(MaterialState.hovered)) {
        //   return AppColors.highlight;
        // }
        return AppColors.border;
      },
    ),
    padding: MaterialStateProperty.all(EdgeInsets.zero),
    minimumSize: MaterialStateProperty.all(
      const Size.square(36),
    ),
    fixedSize: MaterialStateProperty.all(
      const Size.square(36),
    ),
    maximumSize: MaterialStateProperty.all(
      const Size.square(36),
    ),
    shadowColor: MaterialStateProperty.all(Colors.transparent),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(256),
      ),
    ));