import 'dart:ui';

import 'package:admin_panel/app_colors.dart';
import 'package:flutter/material.dart';

class ReviewModel {
  ReviewModel(this.score, this.comment, this.date);
  int score;
  String? comment;
  String date;
}

class ReviewCard extends StatefulWidget {
  const ReviewCard({Key? key, required this.model}) : super(key: key);

  final ReviewModel model;
  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  @override
  Widget build(BuildContext context) {
    var widgets = widget.model.comment == null
        ? [
            Row(
              children: [
                for (int i = 0; i < 5; i++)
                  Icon(
                    i < widget.model.score ? Icons.star_rounded : Icons.star_border_rounded,
                    color: AppColors.primary,
                    size: 24.0,
                    semanticLabel: '',
                  ),
                const Spacer(),
                Text(
                  widget.model.date,
                  style: TextStyle(color: AppColors.textGray, fontSize: 14, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ]
        : [
            Row(
              children: [
                for (int i = 0; i < 5; i++)
                  Icon(
                    i < widget.model.score ? Icons.star_rounded : Icons.star_border_rounded,
                    color: AppColors.primary,
                    size: 24.0,
                    semanticLabel: '',
                  ),
                const Spacer(),
                Text(
                  widget.model.date,
                  style: TextStyle(color: AppColors.textGray, fontSize: 14, fontWeight: FontWeight.w500),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(widget.model.comment!,
                style: TextStyle(color: AppColors.textGray, fontSize: 16, fontWeight: FontWeight.w400)),
          ];
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: AppColors.shadow, blurRadius: 16),
        ],
        border: Border.all(
          width: 2,
          color: AppColors.border,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        color: AppColors.background,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widgets,
      ),
    );
  }
}
