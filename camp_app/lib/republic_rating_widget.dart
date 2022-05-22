import 'package:camp_app/styles/app_colors.dart';
import 'package:flutter/material.dart';

class RepublicRatingWidget extends StatefulWidget {
  @override
  State<RepublicRatingWidget> createState() => _RepublicRatingWidgetState();
}

class _RepublicRatingWidgetState extends State<RepublicRatingWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text("Рейтинг", style: TextStyle(color: AppColors.textDark, fontSize: 32, fontWeight: FontWeight.bold))
    ]);
  }
}
