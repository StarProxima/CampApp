import 'package:admin_panel/app_colors.dart';
import 'package:admin_panel/chats/chat_page.dart';
import 'package:admin_panel/chats/chat_widget.dart';
import 'package:flutter/material.dart';

class ChatListWidget extends StatefulWidget {
  @override
  State<ChatListWidget> createState() => _ChatListWidgetState();
}

class _ChatListWidgetState extends State<ChatListWidget> {
  var chats = [
    ChatModel("Чел Челиков", "Родитель", "Здрасте!"),
    ChatModel("Чел Челиков", "Родитель", "Здрасте!"),
    ChatModel("Чел Челиков", "Родитель", "Здрасте!"),
  ];

  var selectedChat = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: AppColors.background,
          width: 420,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
                child: Text(
                  "Сообщения",
                  style: TextStyle(
                    color: AppColors.textDark,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ChatWidget(
                        model: chats[index],
                        isSelected: index == selectedChat,
                        onTap: () {
                          setState(() {
                            selectedChat = index;
                          });
                        },
                      );
                    },
                    itemCount: chats.length),
              ),
            ],
          ),
        ),
        Container(
          color: AppColors.border,
          width: 2,
        ),
        Expanded(
          child: Container(
            color: AppColors.border,
            child: ChatPage(),
          ),
        )
      ],
    );
  }
}
