import 'package:camp_app/styles/app_colors.dart';
import 'package:camp_app/styles/classStyles.dart';
import 'package:flutter/material.dart';

class Autorization extends StatefulWidget {
  const Autorization({Key? key, required this.onLogin}) : super(key: key);

  final Function() onLogin;
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
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  color: AppColors.primary,
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
                  onPressed: () {},
                  child: Text(
                    "Регистрация",
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
                    widget.onLogin();
                  },
                  child: Text(
                    "Вход",
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
