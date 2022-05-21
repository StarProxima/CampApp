import 'package:admin_panel/app_colors.dart';
import 'package:admin_panel/button_styles.dart';
import 'package:admin_panel/event_widget.dart';
import 'package:admin_panel/review_card.dart';
import 'package:flutter/material.dart';

class ReviewsWidget extends StatefulWidget {
  const ReviewsWidget({Key? key, required this.event}) : super(key: key);

  final EventModel event;
  @override
  State<ReviewsWidget> createState() => _ReviewsWidgetState();
}

class _ReviewsWidgetState extends State<ReviewsWidget> {
  var reviews = [
    ReviewModel(3, "Нормально", "23.01.2003"),
    ReviewModel(5, null, "23.01.2003"),
    ReviewModel(1, "Ужас!", "23.01.2003"),
    ReviewModel(5, "Класс!", "23.01.2003"),
    ReviewModel(5, "Класс!", "23.01.2003"),
    ReviewModel(5, "Класс!\nasdadsa\nsadsadsad\nsdadsadadsadada dsada d !", "23.01.2003"),
    ReviewModel(5, "Класс!", "23.01.2003"),
    ReviewModel(5, "Класс!", "23.01.2003"),
    ReviewModel(5, "Класс!", "23.01.2003"),
    ReviewModel(5, "Класс!", "23.01.2003"),
    ReviewModel(5, "Класс!", "23.01.2003"),
    ReviewModel(5, "Класс!", "23.01.2003"),
  ];

  void loadReviews() {
    //todo: php requests
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
            Text("3.5 звезды", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.primary)),
          ]),
        )
      ],
    );
  }
}
