import 'dart:async';
import 'dart:developer';

import 'package:camp_app/item_info_widget.dart';
import 'package:camp_app/shop_element_widget.dart';
import 'package:camp_app/styles/app_colors.dart';
import 'package:camp_app/styles/class_styles.dart';
import 'package:flutter/material.dart';

import 'ui/qr_scanner.dart';

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
          "https://storage-cdn5.gloria-jeans.ru/medias/GKT010527-4-02-300Wx300H.jpg?context=bWFzdGVyfHByb2R1Y3R8OTIzNnxpbWFnZS9qcGVnfGgyYy9oMmYvOTM1MTMwMjE1MjIyMi9HS1QwMTA1MjctNC0wMl8zMDBXeDMwMEguanBnfDMyNzdjMTc1MjhjYWRlN2ZkMGE4YzQwNTI0MDkxMmQwZmQwMTczOWZhN2U3MThkYTc1ODUxYWE0Yzk2YzJjMWY",
          1200),
      ShopItem("худи Вита", "https://niti-niti.ru/media/images/product/22871/full_hd.jpg", 2300),
      ShopItem("Перчатки", "https://www.spets.ru/upload/iblock/a6a/TW-59.jpg", 600),
    ]),
    ShopModel("Питание", [
      ShopItem("Тортик", "https://thecake-school.ru/assets/img/blog/milkygirl-cake_h_1.jpg", 1200),
      ShopItem("Шаурма", "https://kurkumashaurma.by/assets/images/products/104/meksikanskaya-1200-dsc-5855.jpg", 2300),
      ShopItem(
          "Сок",
          "https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Orange_juice_1_edit1.jpg/1200px-Orange_juice_1_edit1.jpg",
          600),
    ]),
    ShopModel("Сувениры", [
      ShopItem("Брелок", "https://s.a-5.ru/p/9b/ba/9bba5eef56a6f705.jpg", 200),
      ShopItem("Значок", "https://cdn83.printdirect.ru/cache/item/33/5f/240-300s300-front-0-0.jpg", 75),
    ])
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: SafeArea(
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
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => QRScanner(
                            onDetect: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const ItemInfoWidget()),
                              );
                            },
                          ),
                        ),
                      );
                    },
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
    );
  }
}
