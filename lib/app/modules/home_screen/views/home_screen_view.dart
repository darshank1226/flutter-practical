// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
                    backgroundImage: AssetImage("assets/man.png"),
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
              Text(
                'Darshan',
                style: TextStyle(fontSize: 18, color: AppColor.greyColor),
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
              Text(
                'kachhadiyadarshan90@gmail.com',
                style: TextStyle(fontSize: 18, color: AppColor.greyColor),
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
              Obx(
                () => Wrap(
                  children: controller.availableSkills.map((skill) {
                    final isSelected =
                        controller.selectedSkills.contains(skill);

                    final textColor = isSelected ? Colors.white : Colors.black;

                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: ChoiceChip(
                        label: Text(
                          skill,
                          style: TextStyle(
                            color: textColor,
                          ),
                        ),
                        selected: controller.selectedSkills.contains(skill),
                        onSelected: (selected) {
                          if (selected) {
                            controller.selectedSkills.add(skill);
                            controller.setSkillColor(skill, Colors.black);
                            debugPrint(
                                'selectedSkills----${controller.selectedSkills}');
                          } else {
                            controller.selectedSkills.remove(skill);
                            debugPrint(
                                'removeSkill---${controller.selectedSkills}');
                            controller.setSkillColor(skill, Colors.grey);
                          }
                        },
                        selectedColor: controller.skillColors[skill],
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Work Experience:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                '5 + Years',
                style: TextStyle(fontSize: 18, color: AppColor.greyColor),
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
