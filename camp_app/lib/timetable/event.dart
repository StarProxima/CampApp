import 'package:camp_app/styles/app_colors.dart';
import 'package:camp_app/styles/app_images.dart';
import 'package:camp_app/styles/button_styles.dart';
import 'package:flutter/material.dart';

import '../event_page.dart';

class Event extends StatelessWidget {
  const Event({Key? key, required this.isActive, this.isAttached})
      : super(key: key);

  final title = "Разминка";
  final description = "Раз раз и готово";
  final bool isActive;
  final startTime = "8:00";
  final endTime = "8:30";
  final bool? isAttached;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EventPage()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: isActive ? AppColors.primary : AppColors.background,
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow,
                spreadRadius: 0,
                blurRadius: 16,
                offset: Offset.zero,
              ),
            ],
            border: Border.all(
                color: isActive ? AppColors.primary : AppColors.border,
                width: 2)),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: isActive ? AppColors.background : AppColors.textDark,
                  ),
                ),
                const Spacer(),
                Text(
                  "$startTime-$endTime",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: isActive ? AppColors.background : AppColors.textDark,
                  ),
                ),
                isAttached != null
                    ? ElevatedButton(
                        style: onlyIcons,
                        onPressed: () {
                          
                          //isAttached = !isAttached;
                        },
                        child: Image(
                          height: 24,
                          width: 24,
                          image: isAttached!
                              ? AppImages.attachSelected
                              : AppImages.attach,
                        ))
                    : Container(),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              description,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: isActive
                    ? AppColors.background.withAlpha(192)
                    : AppColors.textDark.withAlpha(127),
              ),
            )
          ],
        ),
      ),
    );
  }
}
