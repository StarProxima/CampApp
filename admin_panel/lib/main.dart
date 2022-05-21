import 'package:admin_panel/menu_widget.dart';
import 'package:admin_panel/staticstic_widget.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'chats/chat_list_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Панель администратора',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Menu {
  Menu(this.title, this.icon);
  String title = "";
  Icon icon;
}

class _MyHomePageState extends State<MyHomePage> {
  var menus = [
    Menu(
      "Статистика",
      Icon(
        Icons.favorite,
        color: AppColors.primary,
        size: 24.0,
        semanticLabel: '',
      ),
    ),
    Menu(
      "Сообщения",
      Icon(
        Icons.favorite,
        color: AppColors.primary,
        size: 24.0,
        semanticLabel: '',
      ),
    ),
  ];

  int selectedMenu = 0;

  var staticsticWidget = StatisticWidget();
  var chatListWidget = ChatListWidget();

  Widget getSelectedWidget() {
    switch (selectedMenu) {
      case 0:
        return staticsticWidget;
      default:
        return chatListWidget;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 16),
          color: AppColors.background,
          height: 64,
          child: Row(
            children: [
              Text(
                "Панель администратора",
                style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.w900, fontSize: 24),
              )
            ],
          ),
        ),
        Container(
          height: 2,
          color: AppColors.border,
        ),
        Expanded(
          child: Row(
            children: [
              Container(
                color: AppColors.background,
                width: 256,
                child: ListView.separated(
                    padding: const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
                    itemBuilder: (context, index) {
                      return MenuWidget(
                        title: menus[index].title,
                        icon: menus[index].icon,
                        onTap: () {
                          setState(() {
                            selectedMenu = index;
                          });
                        },
                        isSelected: index == selectedMenu,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 4,
                      );
                    },
                    itemCount: menus.length),
              ),
              Container(
                width: 2,
                color: AppColors.border,
              ),
              Expanded(
                child: Container(
                  color: AppColors.background,
                  alignment: Alignment.topLeft,
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: getSelectedWidget(),
                ),
              )
            ],
          ),
        )
      ],
    ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
