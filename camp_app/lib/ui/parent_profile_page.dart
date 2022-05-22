import 'dart:developer';

import 'package:camp_app/styles/app_images.dart';
import 'package:camp_app/ui/repeatable_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../chat_page.dart';
import '../styles/app_colors.dart';
import '../styles/class_styles.dart';
import 'parents_child_page.dart';

class ParentProfilePage extends StatefulWidget {
  const ParentProfilePage({Key? key, required this.onExit}) : super(key: key);

  final Function() onExit;

  @override
  State<ParentProfilePage> createState() => _ParentProfilePage();
}

class _ParentProfilePage extends State<ParentProfilePage> {
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
                  "Профиль",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 72,
              margin: const EdgeInsets.only(left: 16, top: 16),
              color: AppColors.background,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    width: 72,
                    height: 72,
                    child: Image.network(
                        "https://sun2-4.userapi.com/s/v1/ig2/MZ-ouRlLRxelxSixL5Fb8K1OvlzF6ELa3yj-aTbgNa-SlGwQuq0fRT0JME3FbQ9-75bbYny2e9M3zxveBBEXGL4r.jpg?size=400x400&quality=95&crop=32,378,702,702&ava=1"),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(36),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(33, 188, 188, 188), //shadowColor
                          spreadRadius: 8,
                          blurRadius: 8,
                          offset: Offset.zero, // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 32),
                    height: 72,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: const Text(
                            "Гиренко Даниил",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: double.infinity),
                          child: const Text(
                            "Родитель",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Color(0xFFA6B2C3),
                              fontWeight: FontWeight.normal,
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
                margin: const EdgeInsets.only(left: 16, top: 8),
                height: 40,
                color: AppColors.background,
                child: const Text(
                  "Мои дети",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                )),
            Container(
              margin: const EdgeInsets.only(
                left: 16,
              ),
              height: 134,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ParentChildPage()));
                      },
                      style: appButtonStyle,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            //color: Color.fromARGB(255, 255, 0, 0),
                            clipBehavior: Clip.antiAlias,
                            width: 84,
                            height: 84,
                            child: Image.network(
                                "https://sun2-4.userapi.com/s/v1/ig2/9lmQapzTb9GZbpZApYXDtaLIBPTLNRXUyThAgPctJzQ4FbPA8UkTdfpHGziBQntTahlvo53CTq1t-E-zDjxJOMLg.jpg?size=400x400&quality=96&crop=524,550,1090,1090&ava=1"),
                            decoration: BoxDecoration(
                              color: AppColors.background,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(42),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.shadow, //shadowColor
                                  blurRadius: 16,
                                  offset: Offset.zero, // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            constraints: const BoxConstraints(maxWidth: double.infinity),
                            child: Text(
                              "Рустам",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: AppColors.textGray,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                )),
            const SizedBox(
              height: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                makeLineI("Личные данные", Icons.account_box_outlined, () => log("1")),
                makeLineI("Обратная связь", Icons.question_mark,
                    () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatPage()))),
                makeLineI("Выход", Icons.exit_to_app, () => widget.onExit())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
