// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_images.dart';
import 'button_styles.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPage();
}

class _EventPage extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.background,
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Expanded(
              child: Container(
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
                          'Разминка',
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
                                  'Ого это же описание разминги нижней части тела работаем ножками огггггоооооо Ого это же описание разминги нижней части тела работаем ножками огггггоооооо Ого это же описание разминги нижней части тела работаем ножками огггггоооооо Ого это же описание разминги нижней части тела работаем ножками огггггоооооо Ого это же описание разминги нижней части тела работаем ножками огггггоооооо Ого это же описание разминги нижней части тела работаем ножками огггггоооооо Ого это же описание разминги нижней части тела работаем ножками огггггоооооо Ого это же описание разминги нижней части тела работаем ножками огггггоооооо Ого это же описание разминги нижней части тела работаем ножками огггггоооооо Ого это же описание разминги нижней части тела работаем ножками огггггоооооо Ого это же описание разминги нижней части тела работаем ножками огггггоооооо Ого это же описание разминги нижней части тела работаем ножками огггггоооооо Ого это же описание разминги нижней части тела работаем ножками огггггоооооо Ого это же описание разминги нижней части тела работаем ножками огггггоооооо Ого это же описание разминги нижней части тела работаем ножками огггггоооооо Ого это же описание разминги нижней части тела работаем ножками огггггоооооо Ого это же описание разминги нижней части тела работаем ножками огггггоооооо Ого это же описание разминги нижней части тела работаем ножками огггггоооооо Ого это же описание разминги нижней части тела работаем ножками огггггоооооо Ого это же описание разминги нижней части тела работаем ножками огггггоооооо Ого это же описание разминги нижней части тела работаем ножками огггггоооооо Ого это же описание разминги нижней части тела работаем ножками огггггоооооо',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: AppColors.textDark,
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
