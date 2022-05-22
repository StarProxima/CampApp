import 'package:camp_app/styles/app_colors.dart';
import 'package:camp_app/styles/class_styles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Autorization extends StatefulWidget {
  const Autorization({Key? key, required this.onLoginParent, required this.onLoginChild, required this.onRegister})
      : super(key: key);

  final Function() onLoginParent;
  final Function() onLoginChild;
  final Function() onRegister;
  @override
  _AutorizationState createState() => _AutorizationState();
}

class _AutorizationState extends State<Autorization> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          constraints: const BoxConstraints(minWidth: double.infinity),
          color: AppColors.background,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 64),
                width: 128,
                height: 128,
                child: const Image(image: AssetImage('assets/icon.png')),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  color: AppColors.background,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Бриз",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: AppColors.primary,
                ),
              ),
              const Spacer(),
              Container(
                constraints: const BoxConstraints(minWidth: double.infinity),
                height: 48,
                child: ElevatedButton(
                  style: appButtonStyleAutorization,
                  onPressed: () {
                    widget.onLoginChild();
                  },
                  child: Text(
                    "Войти как ребёнок",
                    style: TextStyle(
                      color: AppColors.background,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                constraints: const BoxConstraints(minWidth: double.infinity),
                height: 48,
                child: ElevatedButton(
                  style: appButtonStyleAutorization,
                  onPressed: () {
                    widget.onLoginParent();
                  },
                  child: Text(
                    "Войти как родитель",
                    style: TextStyle(
                      color: AppColors.background,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
