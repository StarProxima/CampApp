import 'dart:convert';
import 'dart:developer';

import 'package:admin_panel/app_colors.dart';
import 'package:admin_panel/button_styles.dart';
import 'package:admin_panel/event_widget.dart';
import 'package:admin_panel/review_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReviewsWidget extends StatefulWidget {
  const ReviewsWidget({Key? key, required this.event}) : super(key: key);

  final EventModel event;
  @override
  State<ReviewsWidget> createState() => _ReviewsWidgetState();
}

class _ReviewsWidgetState extends State<ReviewsWidget> {
  var reviews = [];
  var rating = "";

  Future<String?> loadEvents() async {
    var today = DateTime.now();
    var url = Uri(scheme: "https", host: "studrasp.ru", path: 'CampApp.php', queryParameters: {
      'action': 'get_all_reviews_for_timetable_event',
      'index': '${widget.event.eventID}',
      'date': '${today.year}-${today.month}-${today.day}',
      'dayCount': '0'
    });
    log(url.toString());
    var date = await http.get(url);
    print(date.body.toString());
    return date.body.toString();
  }

  Future<String?> loadRating() async {
    var today = DateTime.now();
    var url = Uri(scheme: "https", host: "studrasp.ru", path: 'CampApp.php', queryParameters: {
      'action': 'get_avg_score_for_timetable_event',
      'index': '${widget.event.eventID}',
      'date': '${today.year}-${today.month}-${today.day}',
      'dayCount': '0'
    });
    log(url.toString());
    var date = await http.get(url);
    return date.body.toString();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadEvents().then((value) {
      if (value == null) {
        reviews = [];
      } else {
        List<dynamic> values = jsonDecode(value);
        setState(() {
          reviews = [
            for (int i = 0; i < values.length; i++)
              ReviewModel(int.parse(values[i]['score']), values[i]['comments'], values[i]['date'])
          ];
        });
      }

      loadRating().then(
        (value) {
          setState(() {
            rating = value!;
          });
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 48,
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "<",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                style: appButtonStyle,
              ),
              Text(
                widget.event.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: ElevatedButton(
                  onPressed: () {
                    //TODO: Selection
                  },
                  child: const Text("Сегодня", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  style: textButton,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 2,
          color: AppColors.border,
        ),
        Expanded(
          child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                return ReviewCard(model: reviews[index]);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 8,
                );
              },
              itemCount: reviews.length),
        ),
        Container(
          height: 2,
          color: AppColors.border,
        ),
        Container(
          padding: EdgeInsets.only(left: 16, right: 16),
          height: 48,
          child: Row(children: [
            const Text("Рейтинг", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const Spacer(),
            Text("${rating} звезды",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.primary)),
          ]),
        )
      ],
    );
  }
}
