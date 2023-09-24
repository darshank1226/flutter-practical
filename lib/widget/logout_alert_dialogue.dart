// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_prectical/app/routes/app_pages.dart';
import 'package:flutter_prectical/widget/text_widget.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutAlertDialogueWidget extends StatelessWidget {
  const LogoutAlertDialogueWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text("Logout"),
      content: CommonText(
        text: "Are you sure you want to logout?",
        fontSize: 16,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: CommonText(
            text: "Cancel",
            fontSize: 16,
          ),
        ),
        TextButton(
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            prefs.clear();
            Get.offAndToNamed(Routes.LOGIN_SCREEN);
          },
          child: CommonText(
            text: "Yes",
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
