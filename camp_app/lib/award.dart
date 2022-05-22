// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:camp_app/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AvatarCircle extends StatelessWidget {
  const AvatarCircle(
      {Key? key, this.urlImage, this.haveBorder = true, this.radius = 36})
      : super(key: key);

  final String? urlImage;
  final bool haveBorder;
  final int radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2.0 * radius,
      height: 2.0 * radius,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 16,
          )
        ],
        color: AppColors.background,
        borderRadius: BorderRadius.all(Radius.circular(2.0 * radius)),
        border: haveBorder
            ? Border.all(color: AppColors.border, width: 2)
            : Border.all(color: Colors.transparent, width: 0),
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(2.0 * radius)),
          child: urlImage != null ? Image.network(urlImage!) : Container()),
    );
  }
}

class Awards extends StatelessWidget {
  const Awards({
    Key? key,
    required this.name,
    required this.description,
    required this.isReceived,
    this.dateReceipt,
    this.urlImage,
  }) : super(key: key);

  final String name;
  final String description;
  final String? urlImage;
  final bool isReceived;
  final DateTime? dateReceipt;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 100,
          child: Column(
            children: [
              Container(
                height: 96,
                width: 96,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(48),
                  ),
                ),
                child: ColorFiltered(
                  colorFilter: isReceived
                      ? ColorFilter.mode(
                          Color.fromARGB(255, 255, 255, 255), BlendMode.modulate)
                      : ColorFilter.mode(
                          Color.fromARGB(73, 255, 255, 255), BlendMode.modulate),
                  child: AvatarCircle(
                    urlImage: urlImage,
                    radius: 48,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: isReceived
                    ? Column(
                        children: [
                          dateReceipt != null
                              ? Text(
                                  DateFormat('dd.MM.yyyy').format(dateReceipt!),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.textGray,
                                      fontWeight: FontWeight.w500),
                                )
                              : Container()
                        ],
                      )
                    : Container(),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 112, top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    name,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDark),
                  )),
              Container(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 20,
                  ),
                  child: Text(
                    description,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGray),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
