import 'package:camp_app/shop.dart';
import 'package:camp_app/shop_item_widget.dart';
import 'package:camp_app/styles/app_colors.dart';
import 'package:camp_app/styles/app_images.dart';
import 'package:camp_app/styles/class_styles.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ShopElementWidget extends StatefulWidget {
  const ShopElementWidget({Key? key, required this.model}) : super(key: key);

  final ShopModel model;
  @override
  State<ShopElementWidget> createState() => _ShopElementWidgetState();
}

class _ShopElementWidgetState extends State<ShopElementWidget> {
  var map = AssetImage('assets/map.jpg');
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.model.title,
              style: TextStyle(color: AppColors.textDark, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () {},
                style: appButtonStyle,
                child: Text(
                  "Показать на карте",
                  style: TextStyle(color: AppColors.primary, fontSize: 16),
                ))
          ],
        ),
        SizedBox(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ShopItemWidget(item: widget.model.items[index]);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 8,
              );
            },
            itemCount: widget.model.items.length,
          ),
        ),
      ],
    );
  }
}

class PhotoView {}
