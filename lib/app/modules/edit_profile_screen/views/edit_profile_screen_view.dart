// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_prectical/app/routes/app_pages.dart';
import 'package:flutter_prectical/utils/colors.dart';
import 'package:flutter_prectical/widget/button_widget.dart';

import 'package:get/get.dart';

import '../controllers/edit_profile_screen_controller.dart';

class EditProfileScreenView extends GetView<EditProfileScreenController> {
  const EditProfileScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return _showExitConfirmationDialog(context);
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Edit Profile'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: controller.avatarImage.value != null
                          ? Image.file(controller.avatarImage.value!).image
                          : NetworkImage(
                              'https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80'),
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
                SizedBox(height: 10),
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
                SizedBox(height: 10),
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
                SizedBox(height: 10),
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
                SizedBox(height: 20),
                CommonElevatedButton(
                    buttonText: "Save",
                    fontSize: 16,
                    borderRadius: 0,
                    backgroundColor: AppColor.primaryColor,
                    onPressed: () {
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
        ));
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
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('No'),
            ),
          ],
        );
      },
    );

    return result ?? false;
  }
}
