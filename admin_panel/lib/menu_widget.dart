import 'package:admin_panel/app_colors.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({Key? key, required this.title, required this.icon, required this.onTap, required this.isSelected})
      : super(key: key);

  final String title;
  final Icon icon;
  final Function() onTap;
  final bool isSelected;
  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  late Icon localIcon;

  @override
  Widget build(BuildContext context) {
    localIcon = Icon(
      widget.icon.icon,
      color: widget.isSelected ? AppColors.background : AppColors.primary,
      size: 24.0,
      semanticLabel: '',
    );
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: widget.isSelected ? AppColors.primary : AppColors.background,
        ),
        padding: const EdgeInsets.only(left: 8, right: 16, top: 8, bottom: 8),
        child: Row(
          children: [
            localIcon,
            const SizedBox(
              width: 8,
            ),
            Text(
              widget.title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: widget.isSelected ? AppColors.background : AppColors.textDark),
            ),
          ],
        ),
      ),
    );
  }
}
