import 'dart:developer';
import 'dart:ffi';

import 'package:camp_app/styles/app_images.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../styles/app_colors.dart';
import '../styles/class_styles.dart';
import 'parent_child_profile_page.dart';
import 'repeatable_widget.dart';

class RefillContent extends StatefulWidget {
  const RefillContent({Key? key}) : super(key: key);

  @override
  State<RefillContent> createState() => RefillContentState();
}

class RefillContentState extends State<RefillContent> {
  final TextEditingController _textFieldController = TextEditingController();
  late String textInBox = "";
  late int starLevel = 1;
  late double sizeOfPic = 42;
  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Column(
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                textInBox = value;
              });
            },
            controller: _textFieldController,
            decoration: InputDecoration(
              hintText: "Сумма",
              hintStyle: TextStyle(color: AppColors.textGray),
              border: const UnderlineInputBorder(),
            ),
          ),
          Container(
            constraints: const BoxConstraints(minWidth: double.infinity),
            padding: const EdgeInsets.only(top: 16),
            child: DropdownButton<String>(
              icon: null,
              hint: Text(
                'Способ оплаты',
                style: TextStyle(color: AppColors.textGray),
                textAlign: TextAlign.left,
              ),
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['Карта', 'Qiwi', 'Ещё что-то'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class ParentChildPage extends StatefulWidget {
  const ParentChildPage({Key? key}) : super(key: key);

  @override
  State<ParentChildPage> createState() => _ParentChildPageState();
}

class _ParentChildPageState extends State<ParentChildPage> {
  static const double iconSize = 28;

  void addBalance(int count) async {
    // DateTime now = new DateTime.now();
    // DateTime date = new DateTime(now.year, now.month, now.day);
    // //здесь нужно иметь индекс профиля
    // var url = Uri(scheme: "https", host: "studrasp.ru", path: 'CampApp.php', queryParameters: {
    //   'action': 'add_review',
    //   'childInd': '1',
    //   'eventInd': '${widget.eventID}',
    //   'starCount': '$starCount',
    //   'textReview': textReview,
    //   'date': '$date'
    // });
    // var pleas = await http.get(url);
    // //log(url.toString());
  }

  Future<void> showRefillDialog() {
    var refillState = GlobalKey<RefillContentState>();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.background,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
            title: Text(
              'Пополнение счёта',
              style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold),
            ),
            content: RefillContent(
              key: refillState,
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Отмена', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              TextButton(
                child: Text('Пополнить', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                onPressed: () {
                  int? x = int.tryParse(refillState.currentState!.textInBox);

                  if (x != null) {
                    addBalance(x);
                    setState(() {
                      Navigator.pop(context);
                    });
                  }
                },
              ),
            ],
          );
        });
  }

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
                          showRefillDialog();
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
