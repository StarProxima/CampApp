import 'dart:convert';

import 'package:camp_app/chat_page.dart';
import 'package:camp_app/shop.dart';
import 'package:camp_app/styles/app_colors.dart';
import 'package:camp_app/profile_card.dart';
import 'package:camp_app/styles/app_images.dart';
import 'package:camp_app/styles/class_styles.dart';
import 'package:camp_app/ui/awards_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:http/http.dart' as http;
import 'award.dart';
import 'ui/repeatable_widget.dart';

Future<List<AvatarCircle>> loadAwards() async {
  // тут бы индекс человека нужен
  var url = Uri(
      scheme: "https",
      host: "studrasp.ru",
      path: 'CampApp.php',
      queryParameters: {'action': 'get_child_achievements', 'index': '${1}'});
  var pleas = await http.get(url);

  String json = pleas.body.toString();
  final List<dynamic> data = jsonDecode(json);
  List<AvatarCircle> awardList = [];
  for (int i = 0; i < data.length; i++) {
    awardList.add(
      AvatarCircle(
        urlImage: data[i]["urlPhoto"],
        radius: 36,
      ),
    );
  }
  return awardList;
}

class ChildProfilePage extends StatefulWidget {
  const ChildProfilePage({Key? key, required this.onExit}) : super(key: key);

  final Function() onExit;

  @override
  State<ChildProfilePage> createState() => _ChildProfilePageState();
}

class _ChildProfilePageState extends State<ChildProfilePage> {
  List<AvatarCircle> awards = [];

  @override
  void initState() {
    super.initState();
    loadAwards().then((value) {
      setState(() {
        awards = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        color: AppColors.background,
        padding: const EdgeInsets.only(top: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ProfileCard(title: "Хахук Рустам", description: "Ребенок", imageURL: null, image: null),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
              child: Row(
                children: [
                  Text(
                    "Мои награды",
                    style: TextStyle(
                      color: AppColors.textDark,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AwardsPage()),
                      );
                    },
                    child: Text(
                      "Все награды",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    style: appButtonStyle,
                  )
                ],
              ),
            ),
            Container(
              constraints: const BoxConstraints(maxHeight: 104),
              child: ListView.separated(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return awards[index];
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 8,
                  );
                },
                itemCount: awards.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Row(
                children: [
                  Text(
                    "Баланс: 100p",
                    style: TextStyle(
                      color: AppColors.textDark,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ShopWidget()),
                      );
                    },
                    child: Text(
                      "Каталог",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    style: appButtonStyle,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            makeLineI("Обо мне", Icons.account_box_outlined, () {}),
            makeLineI("Моя медкарта", Icons.local_hospital_outlined, () {}),
            makeLineI("Выход", Icons.exit_to_app, () {
              widget.onExit();
            }),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
