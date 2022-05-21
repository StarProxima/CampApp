import 'dart:convert';
import 'dart:developer';

import 'package:admin_panel/app_colors.dart';
import 'package:admin_panel/event_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'reviews_widget.dart';

class StatisticWidget extends StatefulWidget {
  @override
  State<StatisticWidget> createState() => _StatisticWidgetState();
}

class _StatisticWidgetState extends State<StatisticWidget> {
  var events = [];

  Future<String?> loadEvents() async {
    log("here");

    var date = await http.get(Uri.parse("https://studrasp.ru/CampApp.php?action=get_all_eventToTimeTable"));
    log(date.body.toString());

    return date.body.toString();
  }

  @override
  void initState() {
    super.initState();

    loadEvents().then(
      (value) => {
        setState(
          () {
            List<dynamic> values = jsonDecode(value!);

            events.clear();
            events = [
              for (int i = 0; i < values.length; i++) EventModel(int.parse(values[i]['ind']), values[i]['name'])
            ];
          },
        )
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
          child: Text("Статистика",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: AppColors.textDark,
              )),
        ),
        Expanded(
          child: ListView.separated(
              padding: const EdgeInsets.only(left: 16, right: 16),
              itemBuilder: (context, index) {
                return EventWidget(
                  model: events[index],
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Expanded(
                            child: Container(
                              color: AppColors.shadow,
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                    color: AppColors.background,
                                  ),
                                  width: 420,
                                  height: 640,
                                  child: ReviewsWidget(event: events[index]),
                                ),
                              ),
                            ),
                          );
                        });
                    //open alert with rewiews
                  },
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 8,
                );
              },
              itemCount: events.length),
        )
      ],
    );
  }
}
