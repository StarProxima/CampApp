import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'styles/app_colors.dart';
import 'styles/app_images.dart';
import 'styles/button_styles.dart';
import 'package:http/http.dart' as http;

import 'package:photo_view/photo_view.dart';

class ReviewContent extends StatefulWidget {
  const ReviewContent({Key? key}) : super(key: key);

  @override
  State<ReviewContent> createState() => ReviewContentState();
}

class ReviewContentState extends State<ReviewContent> {
  final TextEditingController _textFieldController = TextEditingController();
  late String textInBox = "";
  late int starLevel = 1;
  late double sizeOfPic = 42;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Column(
        children: [
          Row(
            children: [
              for (int i = 1; i <= 5; i++)
                SizedBox(
                  height: sizeOfPic,
                  width: sizeOfPic,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        starLevel = i;
                      });
                    },
                    child: SizedBox(
                      width: sizeOfPic,
                      height: sizeOfPic,
                      child: Icon(
                        starLevel < i ? Icons.star_border_rounded : Icons.star_rounded,
                        color: AppColors.primary,
                        size: 42,
                      ),
                    ),
                    style: appButtonStyle,
                  ),
                )
            ],
          ),
          TextField(
            onChanged: (value) {
              setState(() {
                textInBox = value;
              });
            },
            controller: _textFieldController,
            decoration: InputDecoration(
              hintText: "Напишите отзыв",
              hintStyle: TextStyle(color: AppColors.textGray),
              border: const UnderlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}

class EventInfoModel {
  EventInfoModel(this.title, this.description, this.imgUrl);
  String imgUrl;
  String title;
  String description;
}

Future<EventInfoModel> loadEvent(int eventID) async {
  var url = Uri(
      scheme: "https",
      host: "studrasp.ru",
      path: 'CampApp.php',
      queryParameters: {'action': 'get_eventToTimetable_info', 'index': '${eventID}'});
  var pleas = await http.get(url);

  String json = pleas.body.toString();
  final data = jsonDecode(json);
  var k = data["name"];
  return EventInfoModel(data["name"], data["description"], data["urlPhoto"]);
}

class EventPage extends StatefulWidget {
  const EventPage({Key? key, required this.eventID, required this.eventModel, required this.map}) : super(key: key);

  final int eventID;
  final EventInfoModel eventModel;
  final AssetImage map;

  @override
  State<EventPage> createState() => _EventPage();
}

class _EventPage extends State<EventPage> {
  var event = EventInfoModel("", "", "");

  @override
  void initState() {
    super.initState();
    loadEvent(widget.eventID).then((value) {
      setState(() {
        event = value;
      });
    });
  }

  Widget createImage() {
    if (event.imgUrl != "") {
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          alignment: Alignment.topCenter,
          fit: BoxFit.fitWidth,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
          image: NetworkImage(event.imgUrl),
        )),
      );
    } else {
      return Container();
    }
  }

  void makeReview(int starCount, String textReview) async {
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    //здесь нужно иметь индекс профиля
    var url = Uri(scheme: "https", host: "studrasp.ru", path: 'CampApp.php', queryParameters: {
      'action': 'add_review',
      'childInd': '1',
      'eventInd': '${widget.eventID}',
      'starCount': '$starCount',
      'textReview': textReview,
      'date': '$date'
    });
    var pleas = await http.get(url);
    //log(url.toString());
  }

  Future<void> showScoreDialog() {
    var starState = GlobalKey<ReviewContentState>();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.background,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
            title: Text(
              'Поставьте оценку',
              style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold),
            ),
            content: ReviewContent(
              key: starState,
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
                child: Text('Подтвердить', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                onPressed: () {
                  makeReview(starState.currentState!.starLevel, starState.currentState!.textInBox);
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
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
            createImage(),
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
                      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(
                            top: 16,
                            left: 16,
                            right: 16,
                            bottom: 10,
                          ),
                          child: Text(
                            event.title,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: AppColors.textDark,
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          margin: const EdgeInsets.only(
                            right: 16,
                            top: 16,
                          ),
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                            width: 100,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                showScoreDialog();
                              },
                              style: appButtonStyle,
                              child: const Text(
                                "Оценить",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 50, 80, 234),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
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
                                  event.description,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: AppColors.textGray,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                  ),
                                ),
                                
                              ),
                              
                               GestureDetector(
                                 onTap: () {
                                   Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Stack(
                                        children: [
                                          PhotoView(
                                            //enableRotation: true,
                                            enablePanAlways: true,
                                            imageProvider: widget.map,
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
                                        ],
                                      )),
                                    );
                                 },
                                 child: Image(
                                    image: widget.map,
                                ),
                               )
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
