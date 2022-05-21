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

ButtonStyle onlyIcons = ButtonStyle(
    elevation: MaterialStateProperty.all(0),
    backgroundColor: MaterialStateProperty.resolveWith(
      (states) {
        return Colors.transparent;
      },
    ),

    padding: MaterialStateProperty.all(EdgeInsets.zero),
    minimumSize: MaterialStateProperty.all(
      const Size.square(54),
    ),
    fixedSize: MaterialStateProperty.all(
      const Size.square(54),
    ),
    maximumSize: MaterialStateProperty.all(
      const Size.square(54),
    ),
    shadowColor: MaterialStateProperty.all(Colors.transparent),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(256),
      ),
    ));

  ButtonStyle onlyIconsMin = ButtonStyle(
    elevation: MaterialStateProperty.all(0),
    backgroundColor: MaterialStateProperty.resolveWith(
      (states) {
        return Colors.transparent;
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

ButtonStyle activity = ButtonStyle(
    elevation: MaterialStateProperty.all(0),
    backgroundColor: MaterialStateProperty.resolveWith(
      (states) {
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

ButtonStyle activitySelected = ButtonStyle(
    elevation: MaterialStateProperty.all(0),
    backgroundColor: MaterialStateProperty.resolveWith(
      (states) {
        return AppColors.primary;
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