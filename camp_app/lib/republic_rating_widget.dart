import 'package:camp_app/styles/app_colors.dart';
import 'package:camp_app/styles/app_images.dart';
import 'package:flutter/material.dart';

List<String> repName = ["Сметана", "Бананы", "Бочонок", "Шпинат", "Рыба"];

class RepublicRatingWidget extends StatefulWidget {
  @override
  State<RepublicRatingWidget> createState() => _RepublicRatingWidgetState();
}

class _RepublicRatingWidgetState extends State<RepublicRatingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(
          padding: const EdgeInsets.only(top: 64),
          child: Text(
            "Рейтинг",
            textAlign: TextAlign.left,
            style: TextStyle(
                color: AppColors.textDark,
                fontSize: 32,
                fontWeight: FontWeight.bold),
          ),
        ),
        for (int i = 0; i <= 4; i++)
          Column(
            children: [
              SizedBox(
                height: 16,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    width: 80,
                    height: 80,
                    child: Stack(children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AppImages.clear),
                            border: Border.all(
                                width: 3,
                                color: i == 0
                                    ? Color(0xFFFFCC4A)
                                    : i == 1
                                        ? Color(0xFFBDBDBD)
                                        : i == 2
                                            ? Color(0xFFB25600)
                                            : Color(0x00B25600)),
                            borderRadius:
                                BorderRadius.all(const Radius.circular(60))),
                            
                      )
                    ]),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
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
                    width: 12,
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 32),
                    height: 72,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "Республика " + repName[i],
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
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
                            "1024 очка",
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
            ],
          ),
        SizedBox(
          width: 16,
        )
      ]),
    );
  }
}
