import 'package:camp_app/republic_rating_widget.dart';
import 'package:camp_app/styles/app_colors.dart';
import 'package:camp_app/autorization.dart';
import 'package:camp_app/timetable/timetable.dart';
import 'package:camp_app/ui/parent_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'child_profile_page.dart';
import 'timetable/activity_page.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var selectedWidget = 0;
  bool isAutorized = false;

  bool isParent = false;

  late var childProfile = ChildProfilePage(
    onExit: () {
      setState(() {
        isAutorized = false;
      });
    },
  );

  late var activity = RepublicRatingWidget();

  late var timeTable = const TimeTable();

  Widget getWidget(int index) {
    switch (index) {
      case 0:
        return childProfile;
      case 2:
        return activity;
      default:
        return timeTable;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: isAutorized
          ? isParent
              ? ParentProfilePage(
                  onExit: () {
                    setState(() {
                      isAutorized = false;
                    });
                  },
                )
              : Scaffold(
                  body: getWidget(selectedWidget),
                  bottomNavigationBar: BottomNavigationBar(
                    backgroundColor: AppColors.background,
                    selectedItemColor: AppColors.primary,
                    unselectedItemColor: AppColors.textGray,
                    currentIndex: selectedWidget,
                    items: const [
                      BottomNavigationBarItem(icon: Icon(Icons.person), label: "Профиль"),
                      BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "Расписание"),
                      BottomNavigationBarItem(icon: Icon(Icons.sunny), label: "Рейтинг"),
                    ],
                    onTap: (index) {
                      setState(() {
                        selectedWidget = index;
                      });
                    },
                  ),
                )
          : Autorization(
              onLoginParent: () {
                isParent = true;
                setState(() {
                  isAutorized = true;
                });
              },
              onLoginChild: () {
                isParent = false;
                setState(() {
                  isAutorized = true;
                });
              },
              onRegister: () {
                //isParent = true;
              },
            ),
    );
  }
}
