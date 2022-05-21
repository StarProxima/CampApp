import 'package:camp_app/styles/app_colors.dart';
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
      child: Column(
        children: [
          Container(
            width: 96,
            height: 96,
            child: Image.network(
                "https://sun2-4.userapi.com/s/v1/ig2/9lmQapzTb9GZbpZApYXDtaLIBPTLNRXUyThAgPctJzQ4FbPA8UkTdfpHGziBQntTahlvo53CTq1t-E-zDjxJOMLg.jpg?size=400x400&quality=96&crop=524,550,1090,1090&ava=1"),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: AppColors.shadow,
                blurRadius: 16,
              )
            ], borderRadius: const BorderRadius.all(Radius.circular(48)), color: AppColors.background),
          ),
          const SizedBox(
            height: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(color: AppColors.textDark, fontSize: 24, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
