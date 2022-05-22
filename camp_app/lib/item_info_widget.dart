import 'package:cached_network_image/cached_network_image.dart';
import 'package:camp_app/styles/app_colors.dart';
import 'package:camp_app/styles/class_styles.dart';
import 'package:flutter/material.dart';

import 'image_cache.dart';

class ItemInfoWidget extends StatefulWidget {
  const ItemInfoWidget({Key? key}) : super(key: key);

  @override
  State<ItemInfoWidget> createState() => _ItemInfoWidgetState();
}

class _ItemInfoWidgetState extends State<ItemInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 64),
          alignment: Alignment.topCenter,
          color: AppColors.background,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 196,
                height: 196,
                padding: const EdgeInsets.only(top: 96),
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: AppColors.shadow, blurRadius: 16, offset: Offset(0, 8))],
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  color: AppColors.background,
                  image: const DecorationImage(
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                        "https://cdn83.printdirect.ru/cache/item/33/5f/240-300s300-front-0-0.jpg"),
                  ),
                ),
              ),
              Text(
                "Значок",
                style: TextStyle(color: AppColors.textDark, fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Text(
                "75 рублей",
                style: TextStyle(color: AppColors.textGray, fontSize: 16, fontWeight: FontWeight.normal),
              ),
              Spacer(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: appButtonStyle,
                  child: Text("Купить",
                      style: TextStyle(color: AppColors.primary, fontSize: 20, fontWeight: FontWeight.bold))),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: appButtonStyle,
                  child: Text(
                    "Отмена",
                    style: TextStyle(color: AppColors.textGray, fontSize: 20, fontWeight: FontWeight.normal),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
