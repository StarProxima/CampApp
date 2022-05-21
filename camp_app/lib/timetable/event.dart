import 'package:camp_app/styles/app_colors.dart';
import 'package:camp_app/styles/app_images.dart';
import 'package:camp_app/styles/button_styles.dart';
import 'package:camp_app/styles/classStyles.dart';
import 'package:flutter/material.dart';

import '../event_page.dart';


class Event extends StatefulWidget {
    const Event({Key? key, required this.isActive, this.isAttached})
      : super(key: key);

  final title = "Разминка";
  final description = "Раз раз и готово";
  final bool isActive;
  final startTime = "8:00";
  final endTime = "8:30";
  final bool? isAttached;

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {

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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EventPage()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: widget.isActive ? AppColors.primary : AppColors.background,
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow,
                spreadRadius: 0,
                blurRadius: 16,
                offset: Offset.zero,
              ),
            ],
            border: Border.all(
                color: widget.isActive ? AppColors.primary : AppColors.border,
                width: 2)),
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: widget.isActive ? AppColors.background : AppColors.textDark,
                  ),
                ),
                //const Spacer(),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  widget.description,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: widget.isActive
                        ? AppColors.background.withAlpha(192)
                        : AppColors.textDark.withAlpha(127),
                  ),
                )
              ],
            ),
            isAttached != null
                    ? Container(
                      alignment: Alignment.topRight,
                      child: ElevatedButton(
                          style: onlyIconsMin,
                          onPressed: () {
                            setState(() {
                              isAttached = !isAttached!;
                            });
                          },
                          child: Image(
                            height: 24,
                            width: 24,
                            color: widget.isActive ? AppColors.background : AppColors.primary,
                            image: isAttached!
                                ? AppImages.attachSelected
                                : AppImages.attach,
                          )),
                    )
                    : SizedBox(),
          ],
        ),
      ),
    );
  }
}
