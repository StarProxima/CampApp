import 'package:camp_app/app_colors.dart';
import 'package:camp_app/profile_card.dart';
import 'package:camp_app/styles/app_images.dart';
import 'package:camp_app/styles/classStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'award.dart';
import 'ui/repeatableWidget.dart';

class ChildProfilePage extends StatefulWidget {
  const ChildProfilePage({Key? key}) : super(key: key);

  @override
  State<ChildProfilePage> createState() => _ChildProfilePageState();
}

class _ChildProfilePageState extends State<ChildProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        color: AppColors.background,
        padding: const EdgeInsets.only(top: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                "Профиль",
                style: TextStyle(
                  color: AppColors.textDark,
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const ProfileCard(title: "Хахук Рустам", description: "Ребенок", imageURL: null, image: null),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Row(
                children: [
                  Text(
                    "Мои награды",
                    style: TextStyle(
                      color: AppColors.textDark,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "все награды",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
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
                  return Award();
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 8,
                  );
                },
                itemCount: 100,
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
                    onPressed: () {},
                    child: Text(
                      "Каталог",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: appButtonStyle,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
              child: Text(
                "Параметры",
                style: TextStyle(
                  color: AppColors.textDark,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            makeLine("Обо мне", AppImages.testPic, () {}),
            makeLine("Моя медкарта", AppImages.testPic, () {}),
            makeLine("Мои вожатые", AppImages.testPic, () {}),
            makeLine("Выход", AppImages.testPic, () {}),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
