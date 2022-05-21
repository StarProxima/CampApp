import 'package:camp_app/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
    required this.title,
    required this.description,
    required this.imageURL,
    required this.image,
  }) : super(key: key);

  final String title;
  final String? imageURL;
  final Image? image;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Row(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(36)),
                border: Border.all(
                  color: AppColors.border,
                  width: 2,
                ),
                color: AppColors.background),
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(color: AppColors.textDark, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                description,
                style: TextStyle(color: AppColors.textGray, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
