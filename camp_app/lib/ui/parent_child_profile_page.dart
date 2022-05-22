import 'package:camp_app/chat_page.dart';
import 'package:camp_app/styles/app_colors.dart';
import 'package:camp_app/profile_card.dart';
import 'package:camp_app/styles/app_images.dart';
import 'package:camp_app/styles/class_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

import '../award.dart';
import '../child_profile_page.dart';
import 'repeatable_widget.dart';

class ParentChildProfilePage extends StatefulWidget {
  const ParentChildProfilePage({Key? key}) : super(key: key);

  @override
  State<ParentChildProfilePage> createState() => _ParentChildProfilePageState();
}

class _ParentChildProfilePageState extends State<ParentChildProfilePage> {
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
                    "Награды",
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
                    onPressed: () {},
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
            makeLine("Обо мне", AppImages.testPic, () {}),
            makeLine("Мои вожатые", AppImages.testPic, () {}),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
