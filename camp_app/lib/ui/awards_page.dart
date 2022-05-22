import 'dart:convert';
import 'dart:developer';

import 'package:camp_app/award.dart';
import 'package:camp_app/styles/app_colors.dart';
import 'package:camp_app/styles/button_styles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../styles/app_images.dart';

//import 'event.dart';

class AwardModel {
  AwardModel(this.name,this.description,this.dateReceipt,this.urlImage,this.isReceived);
  String name;
  String description;
  String urlImage;
  bool isReceived;
  DateTime dateReceipt;
}

Future<List<AwardModel>> loadAwards() async {
    // тут бы индекс человека нужен
    var url = Uri(
        scheme: "https",
        host: "studrasp.ru",
        path: 'CampApp.php',
        queryParameters: {
          'action': 'get_marked_achievements_for_child',
          'index': '${1}'
        });
    var pleas = await http.get(url);

    String json = pleas.body.toString();
    final List<dynamic> data = jsonDecode(json);
    List<AwardModel> AwardList = [];
    for (int i = 0; i < data.length; i++)
    {
      if (data[i]["isReceived"] == null) {
        AwardList.add(AwardModel(data[i]["name"], data[i]["description"],DateTime.now(),data[i]["urlPhoto"], false));
      } else {
        AwardList.add(AwardModel(data[i]["name"], data[i]["description"],DateTime.parse(data[i]["getData"].toString().substring(0,10)),data[i]["urlPhoto"], true));
      }
    }
    return AwardList;
  }



class AwardsPage extends StatefulWidget {
  const AwardsPage({Key? key}) : super(key: key);

  @override
  _AwardsPageState createState() => _AwardsPageState();
}

class _AwardsPageState extends State<AwardsPage> {
  bool isAllAwards = true;
  List<AwardModel> awards = [];

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
    return Container(
      color: AppColors.background,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 52,
                // decoration: BoxDecoration(
                //   color: AppColors.background,
                //   border:
                //       Border(bottom: BorderSide(color: AppColors.border, width: 2)),
                // ),
                child: Text(
                  'Награды',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textDark,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                //alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(
                  top: 2,
                  left: 2,
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
              Padding(
                padding: const EdgeInsets.only(
                  top: 52,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const SizedBox(
                    //   height: 64,
                    // ),
                    // const Padding(
                    //   padding: EdgeInsets.only(left: 16, right: 16),
                    //   child: Text(
                    //     "Награды",
                    //     style: TextStyle(
                    //       fontWeight: FontWeight.w900,
                    //       fontSize: 36,
                    //     ),
                    //     textAlign: TextAlign.left,
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    Container(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      height: 48,
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: isAllAwards ? activity : activitySelected,
                              onPressed: () {
                                setState(() {
                                  isAllAwards = !isAllAwards;
                                });
                              },
                              child: Text(
                                "Неполученные",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: isAllAwards
                                        ? AppColors.textDark
                                        : AppColors.background),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              style: isAllAwards ? activitySelected : activity,
                              onPressed: () {
                                setState(() {
                                  isAllAwards = !isAllAwards;
                                });
                              },
                              child: Text(
                                "Все награды",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: isAllAwards
                                        ? AppColors.background
                                        : AppColors.textDark),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        child: ListView.separated(
                          padding: const EdgeInsets.only(
                              bottom: 16, left: 16, right: 16, top: 16),
                          itemBuilder: (context, index) {
                            return Awards(
                              name: awards[index].name,
                              description: awards[index].description,
                              urlImage: awards[index].urlImage,
                              isReceived: awards[index].isReceived,
                              dateReceipt:awards[index].dateReceipt,
                              rad: 48,
                            );
                          },
                          itemCount: awards.length,
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 8);
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
