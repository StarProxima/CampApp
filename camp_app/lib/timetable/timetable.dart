import 'dart:developer';

import 'package:camp_app/styles/app_colors.dart';
import 'package:camp_app/styles/class_Styles.dart';
import 'package:camp_app/timetable/now_day_timetable.dart';
import 'package:flutter/material.dart';

import '../event_page.dart';
import 'event.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({Key? key}) : super(key: key);

  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  DateTime? selectedDate = DateTime.now();
  late NowDayTimetable table = NowDayTimetable();
  @override
  void initState() {
    super.initState();

    loadTable().then((value) {
      setState(() {
        table = value;
      });
    });
  }

  Future<NowDayTimetable> loadTable() async {
    return await NowDayTimetable.getNowDayTimetable(1, 0, 0);
  }

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
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              "Расписание",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 36, color: AppColors.textDark),
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
                  child: Text(""),
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
                    title: table.events[index].name,
                    description: table.events[index].description,
                    startTime: table.events[index].from,
                    endTime: table.events[index].to,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EventPage(
                                  eventID: table.events[index].eventInd,
                                )),
                      );
                    },
                  );
                },
                itemCount: table.events.length,
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
