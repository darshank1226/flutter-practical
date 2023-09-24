// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_prectical/app/routes/app_pages.dart';
import 'package:flutter_prectical/utils/colors.dart';
import 'package:flutter_prectical/widget/text_widget.dart';
import 'package:get/get.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Get.offAllNamed(Routes.LOGIN_SCREEN);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [
                0.2,
                0.5,
                0.8,
                0.7
              ],
                  colors: [
                Colors.grey.shade300,
                Colors.grey.shade400,
                Colors.grey.shade700,
                Colors.grey.shade800
              ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 9,
                child: Center(
                  child: CommonText(
                    text: "My Profile",
                    color: AppColor.primaryColor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: CommonText(
                  text: "Splash Screen",
                  color: AppColor.whiteColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )),
    );
  }
}
