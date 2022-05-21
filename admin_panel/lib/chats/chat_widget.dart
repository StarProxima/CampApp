import 'package:admin_panel/app_colors.dart';
import 'package:flutter/material.dart';

class ChatModel {
  ChatModel(this.name, this.role, this.messageText);

  String name;
  String messageText;
  String role;
}

class ChatWidget extends StatefulWidget {
  const ChatWidget({Key? key, required this.model, required this.isSelected, required this.onTap}) : super(key: key);

  final ChatModel model;
  final isSelected;
  final Function() onTap;
  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        color: widget.isSelected ? AppColors.border : AppColors.background,
        padding: const EdgeInsets.only(left: 16, right: 16),
        height: 96,
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(36))),
              clipBehavior: Clip.antiAlias,
              width: 72,
              height: 72,
              child: Image.network(
                  "https://sun2-12.userapi.com/s/v1/ig2/oDvIf-ZdUiKUV2lc-w7PbobuyWiv2Uf7eBy0XxGhm7CdlbKq0X0w43q5q3gpe4Xs0-dVcMu91VOd1AKKvSRlMdfp.jpg?size=200x0&quality=96&crop=0,7,887,887&ava=1"),
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Row(
                    children: [
                      Text(
                        widget.model.name,
                        style: TextStyle(
                          color: AppColors.textDark,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        widget.model.role,
                        style: TextStyle(
                          color: AppColors.textGray,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  widget.model.messageText,
                  style: TextStyle(
                    color: AppColors.textGray,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
