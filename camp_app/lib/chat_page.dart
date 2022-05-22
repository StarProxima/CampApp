import 'dart:convert';
import 'dart:developer';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:open_file/open_file.dart';
import 'package:uuid/uuid.dart';

import 'styles/app_colors.dart';
import 'styles/app_images.dart';
import 'styles/button_styles.dart';
import 'ui/qr_scanner.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<types.Message> _messages = [];
  final _user = const types.User(id: '06c33e8b-e835-4736-80f4-63f44b66666c');

  @override
  void initState() {
    super.initState();
    _promo();
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
      log('--------');
      log(jsonEncode(_messages)); 
    });
  }

  void _handleAtachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: AppColors.background,
          child: SafeArea(
            child: SizedBox(
              height: 144,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _handleImageSelection();
                    },
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        '    Photo',
                        style: TextStyle(fontSize: 16, color: AppColors.textDark),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _handleFileSelection();
                    },
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text('    File', style: TextStyle(fontSize: 16, color: AppColors.textDark)),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const QRScanner()));
                    },
                    //onPressed: () => Navigator.pop(context),
                    child: const Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text('    Cancel', style: TextStyle(fontSize: 16, color: Colors.red)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        mimeType: lookupMimeType(result.files.single.path!),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
      );

      _addMessage(message);
    }
  }

  void _handleImageSelection() async {
    log("here1");

    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );

      _addMessage(message);
    }
  }

  void _handleMessageTap(BuildContext context, types.Message message) async {
    if (message is types.FileMessage) {
      await OpenFile.open(message.uri);
    }
  }

  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = _messages[index].copyWith(previewData: previewData);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _messages[index] = updatedMessage;
      });
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void _loadMessages() async {
    final response = await rootBundle.loadString('assets/promoChat.json');
    final messages =
        (jsonDecode(response) as List).map((e) => types.Message.fromJson(e as Map<String, dynamic>)).toList();

    setState(() {
      _messages = messages;
    });
  }

  void _promo() async {
    String response = """{
        "author": {
            "firstName": "Administration",
            "id": "b4878b96-efbc-479a-8291-474ef323dec7",
            "imageUrl": "https://avatars.githubusercontent.com/u/14123304?v=4"
        },
        "createdAt": 1653211000835,
        "id": "9dcc55c2-2a28-492e-817b-aa81feec86d7",
        "status": "seen",
        "type": "text",
        "text": "Вас приветствует администрация, что вас интересует?"
    }""";
    
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      _messages =
        (jsonDecode("[" + response + "]") as List).map((e) => types.Message.fromJson(e as Map<String, dynamic>)).toList();
    });

    response =  """{
        "author": {
            "id": "06c33e8b-e835-4736-80f4-63f44b66666c"
        },
        "createdAt": 1653211200835,
        "id": "77e057f8-c651-405b-b2b7-f75746843fcf",
        "status": "seen",
        "type": "text",
        "text": "Здравствуйте, мой ребёнок недавно увидел ваш рекламный ролик в рекомендациях и заинтреловался. Можете рассказать подробнее о вашем лагере?"
    },""" + response;
    
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _messages =
        (jsonDecode("[" + response + "]") as List).map((e) => types.Message.fromJson(e as Map<String, dynamic>)).toList();
    });

    response =  """{
        "author": {
            "firstName": "Administration",
            "id": "b4878b96-efbc-479a-8291-474ef323dec7",
            "imageUrl": "https://avatars.githubusercontent.com/u/14123304?v=4"
        },
        "createdAt": 1653211266221,
        "id": "5a708fd2-bee6-4862-9f6e-31effebc9732",
        "type": "text",
        "previewData": {
            "description": "Санаторий \\"Вита\\" (г. Анапа) - современный комплекс для летнего детского отдыха, расположенный на первой береговой линии Черного моря",
            "image": {
                "height": 1120.0,
                "url": "https://static.tildacdn.com/tild3164-3734-4163-a265-366431633231/oNX0oP7wYjY.jpg",
                "width": 1680.0
            },
            "link": "https://vita-anapa.ru",
            "title": "Санаторий Вита / Главная"
        },
        "text": "Здравствуйте, да, конечно. У нас есть сайт, где вы можете ознакомиться со всей необходимой информацией: https://vita-anapa.ru"
    },""" + response;
    
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _messages =
        (jsonDecode("[" + response + "]") as List).map((e) => types.Message.fromJson(e as Map<String, dynamic>)).toList();
    });

    response =  """{
        "author": {
            "id": "06c33e8b-e835-4736-80f4-63f44b66666c"
        },
        "createdAt": 1653211352553,
        "id": "e40b23c4-3992-4c5a-b982-75899a062e51",
        "status": "seen",
        "type": "text",
        "text": "А можно список всех процедур, которые проводит санаторий?"
    },""" + response;
    
    await Future.delayed(Duration(seconds: 5));
    setState(() {
      _messages =
        (jsonDecode("[" + response + "]") as List).map((e) => types.Message.fromJson(e as Map<String, dynamic>)).toList();
    });

    response =  """{
        "author": {
            "firstName": "Administration",
            "id": "b4878b96-efbc-479a-8291-474ef323dec7",
            "imageUrl": "https://avatars.githubusercontent.com/u/14123304?v=4"
        },
        "createdAt": 1653211413537,
        "id": "d272c1d1-dedc-4c0c-aa0e-1ed622b074f8",
        "type": "text",
        "text": "Да, вот:"
    },""" + response;
    
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      _messages =
        (jsonDecode("[" + response + "]") as List).map((e) => types.Message.fromJson(e as Map<String, dynamic>)).toList();
    });

    response =  """{
        "author": {
            "firstName": "Administration",
            "id": "b4878b96-efbc-479a-8291-474ef323dec7",
            "imageUrl": "https://avatars.githubusercontent.com/u/14123304?v=4"
        },
        "createdAt": 1653211420192,
        "id": "d4f33403-80e2-4cd9-a606-a52266518ad5",
        "type": "file",
        "mimeType": "application/pdf",
        "name": "20_Полный_перечень_медицинских_услуг.pdf",
        "size": 771034,
        "uri": "C:\\\\Users\\\\rusta\\\\Downloads\\\\20_Полный_перечень_медицинских_услуг.pdf"
    },""" + response;
    
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      _messages =
        (jsonDecode("[" + response + "]") as List).map((e) => types.Message.fromJson(e as Map<String, dynamic>)).toList();
    });

    response =  """{
        "author": {
            "id": "06c33e8b-e835-4736-80f4-63f44b66666c"
        },
        "createdAt": 1653212417877,
        "id": "d235c852-0fd7-4323-9267-8fbe9357c375",
        "type": "text",
        "status": "sent",
        "text": "Спасибо"
    },""" + response;
    
    await Future.delayed(Duration(seconds: 8));
    setState(() {
      _messages =
        (jsonDecode("[" + response + "]") as List).map((e) => types.Message.fromJson(e as Map<String, dynamic>)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 52,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  border: Border(bottom: BorderSide(color: AppColors.border, width: 2)),
                ),
                child: Text(
                  'Администрация',
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
                child: Chat(
                  showUserAvatars: true,
                  isLastPage: true,
                  theme: DefaultChatTheme(
                      sendButtonIcon: const Icon(Icons.send_sharp),
                      attachmentButtonIcon: const Icon(Icons.attach_file_rounded),
                      backgroundColor: AppColors.background,
                      messageInsetsVertical: 12,
                      messageInsetsHorizontal: 12,
                      messageBorderRadius: 12,
                      primaryColor: AppColors.primary,
                      secondaryColor: AppColors.border,
                      inputBorderRadius: BorderRadius.zero,
                      inputBackgroundColor: AppColors.background,
                      inputTextColor: AppColors.textDark,
                      inputContainerDecoration: BoxDecoration(
                        border: Border(top: BorderSide(color: AppColors.border, width: 2)),
                      )),
                  messages: _messages,
                  onAttachmentPressed: _handleAtachmentPressed,
                  onMessageTap: _handleMessageTap,
                  onPreviewDataFetched: _handlePreviewDataFetched,
                  onSendPressed: _handleSendPressed,
                  user: _user,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
