import 'package:cached_network_image/cached_network_image.dart';
import 'package:camp_app/image_cache.dart';
import 'package:camp_app/shop.dart';
import 'package:camp_app/styles/app_colors.dart';
import 'package:flutter/material.dart';

class ShopItemWidget extends StatefulWidget {
  const ShopItemWidget({Key? key, required this.item}) : super(key: key);

  final ShopItem item;
  @override
  State<ShopItemWidget> createState() => _ShopItemWidgetState();
}

class _ShopItemWidgetState extends State<ShopItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 96,
          height: 96,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: AppColors.shadow, blurRadius: 8)],
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            image: DecorationImage(
              alignment: Alignment.topCenter,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
              image: CachedNetworkImageProvider(widget.item.previewURL),
            ),
            color: AppColors.border,
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 20,
          child: Text(
            widget.item.name,
            style: TextStyle(fontSize: 12, color: AppColors.textDark),
          ),
        )
      ],
    );
  }
}
