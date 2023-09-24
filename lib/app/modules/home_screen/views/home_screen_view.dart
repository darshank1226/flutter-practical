//ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_prectical/app/routes/app_pages.dart';
import 'package:flutter_prectical/utils/colors.dart';
import 'package:flutter_prectical/widget/button_widget.dart';
import 'package:flutter_prectical/widget/logout_alert_dialogue.dart';

import 'package:get/get.dart';

import '../controllers/home_screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: AppBar(
            backgroundColor: AppColor.whiteColor,
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {
                    _showLogoutAlert(context);
                  },
                  icon: Icon(
                    Icons.logout,
                    color: AppColor.primaryColor,
                  ))
            ]),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, Good Evening",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80'),
                  ),
                ),
              ),
              Text(
                'Name :',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Obx(
                () => Text(
                  controller.userData.value?.name ?? "",
                  style: TextStyle(fontSize: 18, color: AppColor.greyColor),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Email :',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Obx(
                () => Text(
                  controller.userData.value?.email ?? "",
                  style: TextStyle(fontSize: 18, color: AppColor.greyColor),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Skills:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Obx(() => Wrap(
                  children: controller.userData.value?.skills.map((skill) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Chip(
                            label: Text(
                              skill,
                              style: TextStyle(
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ),
                        );
                      }).toList() ??
                      [])),
              SizedBox(height: 20),
              Text(
                'Work Experience:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Obx(
                () => Text(
                  controller.userData.value?.workExperience ?? "",
                  style: TextStyle(fontSize: 18, color: AppColor.greyColor),
                ),
              ),
              SizedBox(height: 20),
              Spacer(),
              CommonElevatedButton(
                buttonText: "Edit Profile",
                onPressed: () {
                  Get.toNamed(Routes.EDIT_PROFILE_SCREEN);
                },
                backgroundColor: AppColor.primaryColor,
                borderRadius: 0,
                fontSize: 16,
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return LogoutAlertDialogueWidget();
      },
    );
  }
}
