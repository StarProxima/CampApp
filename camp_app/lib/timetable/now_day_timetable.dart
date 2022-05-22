import 'dart:convert';
import 'dart:developer';
import 'dart:async';
import 'package:camp_app/styles/app_colors.dart';
import 'package:camp_app/styles/class_styles.dart';
import 'package:flutter/material.dart';
import 'event.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class EventForTimetable {
  late int eventInd;
  late int to;
  late int from;
  late String name;
  late String description;
  late String urlPhoto;
  late String urlMap;
}

class NowDayTimetable {
  late String tableName;
  late List<EventForTimetable> events = [];

  NowDayTimetable();
  static NowDayTimetable deserialize(String json) {
    var tmpObj = NowDayTimetable();
    final data = jsonDecode(json);
    tmpObj.tableName = data['tableName'];
    for (int i = 0; i < data['events'].length; i++) {
      var tmpEvent = EventForTimetable();
      tmpEvent.description = data['events'][i]['description'];
      tmpEvent.eventInd = int.parse(data['events'][i]['eventInd']);
      tmpEvent.to = int.parse(data['events'][i]['toTime']);
      tmpEvent.from = int.parse(data['events'][i]['fromTime']);
      tmpEvent.name = data['events'][i]['name'];
      tmpEvent.urlPhoto = data['events'][i]['urlPhoto'];
      tmpEvent.urlMap = data['events'][i]['urlMap'];
      tmpObj.events.add(tmpEvent);
    }
    return tmpObj;
  }

  static Future<NowDayTimetable> getNowDayTimetable(int index, int mount, int day) async {
    int weekday = DateTime(2022, mount, day).weekday;
    var url = Uri(
        scheme: "https",
        host: "studrasp.ru",
        path: 'CampApp.php',
        queryParameters: {'action': 'get_timetable_json', 'index': '${index}', 'weekday': '${weekday}'});
    //log(url.toString());
    var pleas =
        await http.get(url);
    // flutter clean не работает. От pleas нужно получить ответ.
    return deserialize(pleas.body.toString());
  }
}
