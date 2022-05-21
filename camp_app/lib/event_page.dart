// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'styles/app_colors.dart';
import 'styles/app_images.dart';
import 'styles/button_styles.dart';
import 'package:http/http.dart' as http;

class EventInfoModel {
  EventInfoModel(this.title, this.description, this.imgUrl);
  String imgUrl;
  String title;
  String description;
}

class EventPage extends StatefulWidget {
  const EventPage({Key? key, required this.eventID}) : super(key: key);

  final int eventID;

  @override
  State<EventPage> createState() => _EventPage();
}

class _EventPage extends State<EventPage> {
  var event = EventInfoModel("", "", "");

  EventInfoModel loadEvent() {
    var url = Uri(
        scheme: "https",
        host: "studrasp.ru",
        path: 'CampApp.php',
        queryParameters: {'action': 'get_timetable_json', 'index': '${index}', 'weekday': '${weekday}'});

    return EventInfoModel("", "", "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.background,
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Container(
              //alignment: Alignment.topCenter,
              // width: MediaQuery.of(context).size.width,
              //height: 500,
              decoration: BoxDecoration(
                  image: DecorationImage(
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth,
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
                image: AppImages.event,
              )),
            ),
            SafeArea(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 16,
                ),
                child: ElevatedButton(
                    style: appButtonStyle,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Image(
                      height: 24,
                      width: 24,
                      image: AppImages.back,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 200,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                child: Container(
                  color: AppColors.background,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(
                          top: 16,
                          left: 16,
                          right: 16,
                          bottom: 10,
                        ),
                        child: Text(
                          'Зарядка',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: AppColors.textDark,
                            fontWeight: FontWeight.w900,
                            fontSize: 36,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: ListView(
                            padding: const EdgeInsets.only(
                              top: 0,
                              bottom: 16,
                            ),
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                  bottom: 16,
                                ),
                                child: Text(
                                  'Когда человек встает с кровати, его организм какое-то время находится в переходном режиме – от бездействия к активности. \nУтренняя гимнастика помогает быстрее выполнить это переключение, настроиться на активную работу. Ее благотворное влияние на здоровье невозможно переоценить.',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: AppColors.textGray,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
