// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_prectical/app/modules/home_screen/controllers/home_screen_controller.dart';
import 'package:flutter_prectical/app/routes/app_pages.dart';
import 'package:flutter_prectical/utils/colors.dart';
import 'package:flutter_prectical/widget/button_widget.dart';
import 'package:flutter_prectical/widget/text_widget.dart';

import 'package:get/get.dart';

import '../controllers/edit_profile_screen_controller.dart';

class EditProfileScreenView extends GetView<EditProfileScreenController> {
  const EditProfileScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () {
      return _showExitConfirmationDialog(context);
    }, child: GetBuilder<EditProfileScreenController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade300,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: AppColor.primaryColor,
              )),
          elevation: 0,
        ),
        body: Container(
          height: double.infinity,
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
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CommonText(
                    text: "Edit Profile",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 30),
                  Stack(
                    children: <Widget>[
                      Obx(
                        () => CircleAvatar(
                          radius: 80,
                          backgroundImage: controller.avatarImage.value != null
                              ? Image.file(controller.avatarImage.value!).image
                              : NetworkImage(
                                  'https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80'),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: AppColor.primaryColor, width: 2)),
                          child: IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              controller.pickupImage();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: controller.nameController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColor.primaryColor, width: 2)),
                        labelStyle: TextStyle(color: AppColor.primaryColor),
                        border: OutlineInputBorder(),
                        labelText: 'Name'),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: controller.emailController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColor.primaryColor, width: 2)),
                        labelStyle: TextStyle(color: AppColor.primaryColor),
                        border: OutlineInputBorder(),
                        labelText: 'Email'),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: controller.skillsController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColor.primaryColor, width: 2)),
                        labelStyle: TextStyle(color: AppColor.primaryColor),
                        border: OutlineInputBorder(),
                        labelText: 'Skills'),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: controller.workExperienceController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColor.primaryColor, width: 2)),
                        labelStyle: TextStyle(color: AppColor.primaryColor),
                        border: OutlineInputBorder(),
                        labelText: 'Work Experience'),
                  ),
                  SizedBox(height: 40),
                  CommonElevatedButton(
                      buttonText: "Save",
                      fontSize: 16,
                      borderRadius: 0,
                      backgroundColor: AppColor.primaryColor,
                      onPressed: () {
                        final homeController = Get.find<HomeScreenController>();
                        homeController.getUserData();
                        controller.updateProfile();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Profile Updated Successfully'),
                          ),
                        );
                        Get.toNamed(Routes.HOME_SCREEN);
                      })
                ],
              ),
            ),
          ),
        ),
      );
    }));
  }

  Future<bool> _showExitConfirmationDialog(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Discard Changes?'),
          content:
              Text('Do you want to leave this page without saving changes?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child:
                  Text('Yes', style: TextStyle(color: AppColor.primaryColor)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                'No',
                style: TextStyle(color: AppColor.primaryColor),
              ),
            ),
          ],
        );
      },
    );

    return result ?? false;
  }
}
