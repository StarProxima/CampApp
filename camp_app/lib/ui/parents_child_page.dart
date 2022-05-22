import 'dart:developer';
import 'dart:ffi';

import 'package:camp_app/styles/app_images.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../chat_page.dart';
import '../styles/app_colors.dart';
import '../styles/class_styles.dart';
import 'parent_child_profile_page.dart';
import 'repeatable_widget.dart';

class ParentChildPage extends StatefulWidget {
  const ParentChildPage({Key? key}) : super(key: key);

  @override
  State<ParentChildPage> createState() => _ParentChildPage();
}

class _ParentChildPage extends State<ParentChildPage> {
  static const double iconSize = 28;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(),
      child: Container(
        color: AppColors.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 64,
            ),
            Container(
                margin: const EdgeInsets.only(
                  left: 16,
                ),
                height: 40,
                color: AppColors.background,
                child: const Text(
                  "Хахук Рустам",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                )),
            const SizedBox(
              height: 8,
            ),
            Container(
              height: 64,
              margin: const EdgeInsets.only(
                left: 16,
              ),
              color: AppColors.background,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      color: AppColors.background,
                      child: const Text(
                        "Баланс: 100",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      )),
                  Expanded(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 640),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(
                        right: 16,
                      ),
                      color: AppColors.background,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return MaterialApp(
                                  home: Container(
                                    child: Column(children: [
                                      TextField(
                                        keyboardType: TextInputType.number,
                                      )
                                    ]),
                                  ),
                                );
                              });
                        },
                        style: appButtonStyle,
                        child: const Text(
                          "Пополнить",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromARGB(255, 23, 100, 255),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            makeLineI(
              "Профиль",
              Icons.account_box_outlined,
              () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ParentChildProfilePage()));
              },
            ),
            const SizedBox(
              height: 8,
            ),
            makeLineI("Здоровье", Icons.favorite, () => log("2")),
            const SizedBox(
              height: 8,
            ),
            makeLineI("Питание", Icons.emoji_food_beverage_outlined, () => log("2")),
            const SizedBox(
              height: 8,
            ),
            makeLineI("Расписание", Icons.format_list_bulleted, () => log("2")),
            const SizedBox(
              height: 8,
            ),
            makeLineI("Активность", Icons.mood_outlined, () => log("2")),
            const SizedBox(
              height: 8,
            ),
            makeLineI("Замечания", Icons.new_releases_outlined, () => log("2")),
          ],
        ),
      ),
    );
  }
}
