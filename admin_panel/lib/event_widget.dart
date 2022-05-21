import 'package:admin_panel/app_colors.dart';
import 'package:flutter/material.dart';

class EventModel {
  EventModel(this.eventID, this.title);
  int eventID;
  String title;
}

class EventWidget extends StatefulWidget {
  const EventWidget({Key? key, required this.model, required this.onTap}) : super(key: key);

  final EventModel model;
  final Function() onTap;
  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  double rating() {
    //todo: php request
    return 3.5;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: AppColors.shadow)],
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(width: 2, color: AppColors.border),
          color: AppColors.background,
        ),
        padding: const EdgeInsets.only(left: 16, right: 16),
        height: 42,
        child: Row(children: [
          Text(widget.model.title, style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.w700)),
          const Spacer(),
          Text(
            "${rating()} звезды",
            style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700),
          ),
        ]),
      ),
    );
  }
}
