import 'dart:developer';

import 'package:camp_app/award.dart';
import 'package:camp_app/styles/app_colors.dart';
import 'package:camp_app/styles/button_styles.dart';
import 'package:flutter/material.dart';

//import 'event.dart';

class AwardsPage extends StatefulWidget {
  const AwardsPage({Key? key}) : super(key: key);
  
  @override
  _AwardsPageState createState() => _AwardsPageState();
}

class _AwardsPageState extends State<AwardsPage> {
  
  bool isAllAwards = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 64,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Text(
              "Награды",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 36,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
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
                      style: TextStyle(fontSize: 16, color: isAllAwards ? AppColors.textDark : AppColors.background),
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
                      style: TextStyle(fontSize: 16, color: isAllAwards ? AppColors.background : AppColors.textDark),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              child: ListView.separated(
                padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16, top: 16),
                itemBuilder: (context, index) {
                  return Awards(
                    name: 'За взятие Киева',
                    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed congue ante vitae placerat mattis. Mauris rhoncus ex massa, vel placerat urna fermentum non. Phasellus posuere lobortis orci, vitae gravida sapien viverra ac.',
                    urlImage: "https://sun2-4.userapi.com/s/v1/ig2/9lmQapzTb9GZbpZApYXDtaLIBPTLNRXUyThAgPctJzQ4FbPA8UkTdfpHGziBQntTahlvo53CTq1t-E-zDjxJOMLg.jpg?size=400x400&quality=96&crop=524,550,1090,1090&ava=1",
                    isReceived: index == 2,
                    dateReceipt: DateTime.now(),
                  );
                },
                itemCount: 10,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
