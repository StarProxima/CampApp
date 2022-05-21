import 'package:admin_panel/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  Future<String?> loadRating() async {
    var today = DateTime.now();
    var url = Uri(scheme: "https", host: "studrasp.ru", path: 'CampApp.php', queryParameters: {
      'action': 'get_avg_score_for_timetable_event',
      'index': '${widget.model.eventID}',
      'date': '${today.year}-${today.month}-${today.day}',
      'dayCount': '0'
    });
    var date = await http.get(url);
    return date.body.toString();
  }

  var starRating = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadRating().then((value) {
      setState(() {
        starRating = value!;
      });
    });
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
            "${starRating} звезды",
            style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700),
          ),
        ]),
      ),
    );
  }
}
