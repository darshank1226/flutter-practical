// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_prectical/utils/colors.dart';
import 'package:flutter_prectical/widget/button_widget.dart';

import 'package:get/get.dart';

import '../controllers/edit_profile_screen_controller.dart';

class EditProfileScreenView extends GetView<EditProfileScreenController> {
  const EditProfileScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80'),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: AppColor.primaryColor, width: 2)),
                    child: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {},
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
                      borderSide:
                          BorderSide(color: AppColor.primaryColor, width: 2)),
                  labelStyle: TextStyle(color: AppColor.primaryColor),
                  border: OutlineInputBorder(),
                  labelText: 'Name'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: controller.emailController,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.primaryColor, width: 2)),
                  labelStyle: TextStyle(color: AppColor.primaryColor),
                  border: OutlineInputBorder(),
                  labelText: 'Email'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: controller.skillsController,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.primaryColor, width: 2)),
                  labelStyle: TextStyle(color: AppColor.primaryColor),
                  border: OutlineInputBorder(),
                  labelText: 'Skills'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: controller.workExperienceController,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.primaryColor, width: 2)),
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
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Profile Updated Successfully'),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
