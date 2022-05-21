import 'package:camp_app/styles/app_colors.dart';
import 'package:camp_app/styles/app_images.dart';
import 'package:camp_app/styles/button_styles.dart';
import 'package:flutter/material.dart';

import '../event_page.dart';

class Activity extends StatefulWidget {
  const Activity(
      {Key? key,
      required this.title,
      required this.description,
      required this.isAttached,
      required this.onTap})
      : super(key: key);

  final String title;
  final String description;
  final bool isAttached;
  final Function() onTap;

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  bool? isAttached;
  @override
  void initState() {
    isAttached = widget.isAttached;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: AppColors.background,
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow,
                spreadRadius: 0,
                blurRadius: 16,
                offset: Offset.zero,
              ),
            ],
            border: Border.all(color: AppColors.border, width: 2)),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppColors.textDark,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      widget.description,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: AppColors.textDark.withAlpha(127),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            isAttached != null
                ? Container(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                        style: onlyIcons,
                        onPressed: () {
                          setState(() {
                            isAttached = !isAttached!;
                          });
                        },
                        child: Image(
                          height: 24,
                          width: 24,
                          image: isAttached!
                              ? AppImages.attachSelected
                              : AppImages.attach,
                        )),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
