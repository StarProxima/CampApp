import 'dart:developer';
import 'dart:ffi';

import 'package:camp_app/styles/app_images.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../styles/app_colors.dart';
import '../scrollAbleList/src/scrollable_positioned_list.dart';
import '../styles/classStyles.dart';

Widget makeLine(String needText, ImageProvider img, void Function() onPressDo){
  return             Container(
              height: 42,
              margin: EdgeInsets.only(left: 16,right: 16),
              child: ElevatedButton(
                onPressed: onPressDo,
                style: appButtonStyle,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        margin: EdgeInsets.only(left: 8),
                        child: Image(
                          image: img,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Container(
                          child: Text(
                            needText,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          )),
                      Expanded(
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 640),
                        ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        margin: EdgeInsets.only(right: 8),
                        child: Image(
                          image: AppImages.testPic,
                        ),
                      ),
                    ]),
              ),
            );
}
