import 'dart:developer';

import 'package:camp_app/styles/app_colors.dart';
import 'package:camp_app/styles/classStyles.dart';
import 'package:flutter/material.dart';

import 'event.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({Key? key}) : super(key: key);

  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  DateTime? selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 64,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Text(
              "Расписание",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 36,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            height: 48,
            child: Row(
              children: [
                Text(
                  "Сегодня",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24, color: AppColors.primary),
                ),
                const Spacer(),
                ElevatedButton(
                  style: appButtonStyle,
                  onPressed: () {},
                  child: Text("C"),
                )
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              child: ListView.separated(
                padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16, top: 16),
                itemBuilder: (context, index) {
                  return Event(
                    isActive: index == 2,
                  );
                },
                itemCount: 10,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
