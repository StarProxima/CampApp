import 'package:camp_app/styles/app_colors.dart';
import 'package:camp_app/styles/app_images.dart';
import 'package:camp_app/styles/button_styles.dart';
import 'package:flutter/material.dart';

import '../event_page.dart';

class Event extends StatefulWidget {
  const Event(
      {Key? key,
      required this.isActive,
      this.isAttached,
      required this.title,
      required this.description,
      required this.startTime,
      required this.endTime,
      required this.onTap})
      : super(key: key);

  final String title;
  final String description;
  final bool isActive;
  final int startTime;
  final int endTime;
  final bool? isAttached;
  final Function() onTap;

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
        widget.onTap();
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
            border: Border.all(color: widget.isActive ? AppColors.primary : AppColors.border, width: 2)),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: widget.isActive ? AppColors.background : AppColors.textDark,
                  ),
                ),
                const Spacer(),
                Text(
                  //"${Duration(hours: 0, minutes: widget.startTime)} - ${Duration(hours: 0, minutes: widget.endTime)}",
                  "${(widget.startTime / 60).floor()}:${widget.startTime % 60}-${(widget.endTime / 60).floor()}:${widget.endTime % 60}",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: widget.isActive ? AppColors.background : AppColors.textDark,
                  ),
                ),
                
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.description,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: widget.isActive ? AppColors.background.withAlpha(192) : AppColors.textDark.withAlpha(127),
              ),
            )
          ],
        ),
      ),
    );
  }
}
