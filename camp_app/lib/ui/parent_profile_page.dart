import 'dart:developer';

import 'package:camp_app/styles/app_images.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../app_colors.dart';
import '../scrollAbleList/src/scrollable_positioned_list.dart';
import '../styles/classStyles.dart';

class ParentProfilePage extends StatefulWidget {
  const ParentProfilePage({Key? key}) : super(key: key);

  @override
  State<ParentProfilePage> createState() => _ParentProfilePage();
}

class _ParentProfilePage extends State<ParentProfilePage> {
  static const double iconSize = 28;
  ItemScrollController control = ItemScrollController();

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
                  "Профиль",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 72,
              margin: const EdgeInsets.only(
                left: 16,
              ),
              color: AppColors.background,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    width: 72,
                    height: 72,
                    child: const Image(
                      image: AppImages.testPic,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(36),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Color.fromARGB(33, 188, 188, 188), //shadowColor
                          spreadRadius: 8,
                          blurRadius: 8,
                          offset: Offset.zero, // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 32),
                    height: 72,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: const Text(
                            "Чел Челикович",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          constraints:
                              const BoxConstraints(maxWidth: double.infinity),
                          child: const Text(
                            "Родитель",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Color(0xFFA6B2C3),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                margin: const EdgeInsets.only(
                  left: 16,
                ),
                height: 40,
                color: AppColors.background,
                child: const Text(
                  "Мои дети",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 16,
              ),
              height: 134,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          //color: Color.fromARGB(255, 255, 0, 0),
                          clipBehavior: Clip.antiAlias,
                          width: 84,
                          height: 84,
                          child: const Image(
                            image: AppImages.testPic,
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(42),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(
                                    33, 188, 188, 188), //shadowColor
                                spreadRadius: 8,
                                blurRadius: 8,
                                offset:
                                    Offset.zero, // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          constraints:
                              const BoxConstraints(maxWidth: double.infinity),
                          child: Text(
                            "Рустам" + index.toString(),
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              color: Color(0xFFA6B2C3),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 12);
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                margin: const EdgeInsets.only(
                  left: 16,
                ),
                height: 40,
                color: AppColors.background,
                child: const Text(
                  "Параметры",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Container(
                margin: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 42,
                      child: ElevatedButton(
                        onPressed: () {
                          log("1");
                        },
                        style: appButtonStyle,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                margin: EdgeInsets.only(left: 8),
                                child: Image(
                                  image: AppImages.testPic,
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Container(
                                  margin: const EdgeInsets.only(
                                    left: 16,
                                  ),
                                  child: const Text(
                                    "Личные данные",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                    ),
                                  )),
                              Expanded(
                                child: Container(
                                  constraints:
                                      const BoxConstraints(maxWidth: 640),
                                ),
                              ),
                              Container(
                                width: 24,
                                height: 24,
                                margin: EdgeInsets.only(right: 8),
                                child: Image(
                                  image: AppImages.testPic,
                                ),
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 42,
                      child: ElevatedButton(
                        onPressed: () {
                          log("1");
                        },
                        style: appButtonStyle,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                margin: EdgeInsets.only(left: 8),
                                child: Image(
                                  image: AppImages.testPic,
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Container(
                                  margin: const EdgeInsets.only(
                                    left: 16,
                                  ),
                                  child: const Text(
                                    "Способ оплаты",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                    ),
                                  )),
                              Expanded(
                                child: Container(
                                  constraints:
                                      const BoxConstraints(maxWidth: 640),
                                ),
                              ),
                              Container(
                                width: 24,
                                height: 24,
                                margin: EdgeInsets.only(right: 8),
                                child: Image(
                                  image: AppImages.testPic,
                                ),
                              ),
                            ]),
                      ),
                    ),
                  SizedBox(
                    height: 42,
                    child: ElevatedButton(
                        onPressed: () {
                          log("1");
                        },
                        style: appButtonStyle,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                margin: EdgeInsets.only(left: 8),
                                child: Image(
                                  image: AppImages.testPic,
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Container(
                                  margin: const EdgeInsets.only(
                                    left: 16,
                                  ),
                                  child: const Text(
                                    "Обратная связь",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                    ),
                                  )),
                              Expanded(
                                child: Container(
                                  constraints:
                                      const BoxConstraints(maxWidth: 640),
                                ),
                              ),
                              Container(
                                width: 24,
                                height: 24,
                                margin: EdgeInsets.only(right: 8),
                                child: Image(
                                  image: AppImages.testPic,
                                ),
                              ),
                            ]),
                      ),
                  ),
                  SizedBox(
                    height: 42,
                    child: ElevatedButton(
                        onPressed: () {
                          log("1");
                        },
                        style: appButtonStyle,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                margin: EdgeInsets.only(left: 8),
                                child: const Image(
                                  image: AppImages.testPic,
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Container(
                                  margin: const EdgeInsets.only(
                                    left: 16,
                                  ),
                                  child: const Text(
                                    "Выход",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                    ),
                                  )),
                              Expanded(
                                child: Container(
                                  constraints:
                                      const BoxConstraints(maxWidth: 640),
                                ),
                              ),
                              Container(
                                width: 24,
                                height: 24,
                                margin: EdgeInsets.only(right: 8),
                                child: Image(
                                  image: AppImages.testPic,
                                ),
                              ),
                            ]),
                      ),
                  )
                  
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
