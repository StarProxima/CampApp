import 'package:camp_app/shop_element_widget.dart';
import 'package:camp_app/styles/app_colors.dart';
import 'package:camp_app/styles/class_styles.dart';
import 'package:flutter/material.dart';

class ShopWidget extends StatefulWidget {
  @override
  State<ShopWidget> createState() => _ShopWidgetState();
}

class ShopModel {
  ShopModel(this.title, this.items);
  String title;

  List<ShopItem> items;
}

class ShopItem {
  ShopItem(this.name, this.previewURL, this.cost);
  String name;
  String previewURL;
  int cost;
}

class _ShopWidgetState extends State<ShopWidget> {
  var shops = [
    ShopModel("Мерч", [
      ShopItem(
          "Футболка Вита",
          "https://static.wikia.nocookie.net/edopedia/images/a/a6/%D0%AD%D1%87%D0%BF%D0%BE%D1%87%D0%BC%D0%B0%D0%BA.png/revision/latest?cb=20180706160220&path-prefix=ru",
          1200),
      ShopItem(
          "худи Вита",
          "https://static.wikia.nocookie.net/edopedia/images/a/a6/%D0%AD%D1%87%D0%BF%D0%BE%D1%87%D0%BC%D0%B0%D0%BA.png/revision/latest?cb=20180706160220&path-prefix=ru",
          2300),
      ShopItem(
          "Перчатки",
          "https://static.wikia.nocookie.net/edopedia/images/a/a6/%D0%AD%D1%87%D0%BF%D0%BE%D1%87%D0%BC%D0%B0%D0%BA.png/revision/latest?cb=20180706160220&path-prefix=ru",
          600),
      ShopItem(
          "Перчатки",
          "https://static.wikia.nocookie.net/edopedia/images/a/a6/%D0%AD%D1%87%D0%BF%D0%BE%D1%87%D0%BC%D0%B0%D0%BA.png/revision/latest?cb=20180706160220&path-prefix=ru",
          600),
      ShopItem(
          "Перчатки",
          "https://static.wikia.nocookie.net/edopedia/images/a/a6/%D0%AD%D1%87%D0%BF%D0%BE%D1%87%D0%BC%D0%B0%D0%BA.png/revision/latest?cb=20180706160220&path-prefix=ru",
          600),
      ShopItem(
          "Перчатки",
          "https://static.wikia.nocookie.net/edopedia/images/a/a6/%D0%AD%D1%87%D0%BF%D0%BE%D1%87%D0%BC%D0%B0%D0%BA.png/revision/latest?cb=20180706160220&path-prefix=ru",
          600),
    ]),
    ShopModel("Питание", [
      ShopItem(
          "Тортик",
          "https://static.wikia.nocookie.net/edopedia/images/a/a6/%D0%AD%D1%87%D0%BF%D0%BE%D1%87%D0%BC%D0%B0%D0%BA.png/revision/latest?cb=20180706160220&path-prefix=ru",
          1200),
      ShopItem(
          "Шаурма",
          "https://static.wikia.nocookie.net/edopedia/images/a/a6/%D0%AD%D1%87%D0%BF%D0%BE%D1%87%D0%BC%D0%B0%D0%BA.png/revision/latest?cb=20180706160220&path-prefix=ru",
          2300),
      ShopItem(
          "Сок",
          "https://static.wikia.nocookie.net/edopedia/images/a/a6/%D0%AD%D1%87%D0%BF%D0%BE%D1%87%D0%BC%D0%B0%D0%BA.png/revision/latest?cb=20180706160220&path-prefix=ru",
          600),
    ]),
    ShopModel("Сувениры", [
      ShopItem(
          "Брелок",
          "https://static.wikia.nocookie.net/edopedia/images/a/a6/%D0%AD%D1%87%D0%BF%D0%BE%D1%87%D0%BC%D0%B0%D0%BA.png/revision/latest?cb=20180706160220&path-prefix=ru",
          200),
      ShopItem(
          "Значок",
          "https://static.wikia.nocookie.net/edopedia/images/a/a6/%D0%AD%D1%87%D0%BF%D0%BE%D1%87%D0%BC%D0%B0%D0%BA.png/revision/latest?cb=20180706160220&path-prefix=ru",
          75),
    ])
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: SafeArea(
        child: Expanded(
          child: Scaffold(
            body: Column(
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      style: appButtonStyle,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.primary,
                        size: 24,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "Каталог",
                      style: TextStyle(
                        color: AppColors.textDark,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      style: appButtonStyle,
                      onPressed: () {},
                      child: Icon(
                        Icons.qr_code_scanner_rounded,
                        color: AppColors.primary,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                Container(
                  color: AppColors.border,
                  height: 2,
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                    itemBuilder: (context, index) {
                      return ShopElementWidget(model: shops[index]);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 16,
                      );
                    },
                    itemCount: shops.length,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
